document.addEventListener('DOMContentLoaded', function() {
  var currentUser = JSON.parse(localStorage.getItem('currentUser'));
  var adminError = document.getElementById('adminError');
  var usersTableBody = document.getElementById('usersTableBody');
  var recipesTableBody = document.getElementById('recipesTableBody');
  var adminUsername = document.getElementById('adminUsername');
  var userCountBadge = document.getElementById('userCount');
  var recipeCountBadge = document.getElementById('recipeCount');

  function showError(message) {
    if (adminError) {
      adminError.textContent = message || 'Ismeretlen hiba történt.';
      adminError.classList.remove('d-none');
    } else {
      alert(message || 'Ismeretlen hiba történt.');
    }
  }

  if (!currentUser || currentUser.role !== 'admin' || !currentUser.token) {
    showError('Az admin felülethez érvényes admin jogosultság szükséges.');
    setTimeout(function() {
      window.location.href = 'bejelentkezes.html';
    }, 1500);
    return;
  }

  if (adminUsername) {
    adminUsername.textContent = currentUser.username;
  }

  function authHeaders() {
    return {
      'x-auth-user': currentUser.id,
      'x-auth-token': currentUser.token
    };
  }

  function fetchAdminData(endpoint) {
    return fetch(endpoint, { headers: authHeaders() })
      .then(function(resp) {
        return resp.json()
          .catch(function() { return {}; })
          .then(function(data) {
            if (!resp.ok || !data.success) {
              var message = data.error || 'server_error';
              var error = new Error(message);
              error.status = resp.status;
              throw error;
            }
            return data;
          });
      });
  }

  function renderUsers(users) {
    if (!usersTableBody) return;
    usersTableBody.innerHTML = '';
    if (userCountBadge) userCountBadge.textContent = users.length;

    if (!users.length) {
      usersTableBody.innerHTML = '<tr><td colspan="5" class="text-center py-3 text-muted">Még nincs regisztrált felhasználó.</td></tr>';
      return;
    }

    users.forEach(function(user) {
      var tr = document.createElement('tr');
      var canDelete = user.id !== currentUser.id;
      var delBtn = canDelete
        ? '<button type="button" class="btn btn-outline-danger btn-sm btn-delete-user" data-id="' + user.id + '" data-username="' + (user.username || '').replace(/"/g, '&quot;') + '" title="Felhasználó törlése">🗑️ Törlés</button>'
        : '<span class="text-muted small">–</span>';
      tr.innerHTML =
        '<td>' + user.id + '</td>' +
        '<td>' + user.username + '</td>' +
        '<td>' + user.email + '</td>' +
        '<td><span class="badge ' + (user.role === 'admin' ? 'bg-warning text-dark' : 'bg-secondary') + '">' + user.role + '</span></td>' +
        '<td>' + delBtn + '</td>';
      usersTableBody.appendChild(tr);
    });
  }

  function truncate(text, limit) {
    if (!text) return '';
    if (text.length <= limit) return text;
    return text.substring(0, limit) + '…';
  }

  function escapeHtml(text) {
    if (!text) return '';
    var div = document.createElement('div');
    div.textContent = text;
    return div.innerHTML;
  }

  function renderRecipes(recipes) {
    if (!recipesTableBody) return;
    recipesTableBody.innerHTML = '';
    if (recipeCountBadge) recipeCountBadge.textContent = recipes.length;

    if (!recipes.length) {
      recipesTableBody.innerHTML = '<tr><td colspan="7" class="text-center py-3 text-muted">Még nincs beküldött recept.</td></tr>';
      return;
    }

    recipes.forEach(function(recipe) {
      var tr = document.createElement('tr');
      tr.innerHTML =
        '<td>' + recipe.idreceptek + '</td>' +
        '<td>' + (recipe.meal || '-') + '</td>' +
        '<td>' + (recipe.kulonlegesseg || recipe.unnepi_etelek || '-') + '</td>' +
        '<td><span class="text-nowrap">' + (recipe.author ? escapeHtml(recipe.author) : '<em class="text-muted">Ismeretlen</em>') + '</span></td>' +
        '<td>' + truncate(recipe.recept_hozzaadas || 'Nincs leírás', 80) + '</td>' +
        '<td><button type="button" class="btn btn-outline-danger btn-sm btn-delete-recipe" data-id="' + recipe.idreceptek + '" title="Recept törlése">🗑️ Törlés</button></td>';
      recipesTableBody.appendChild(tr);
    });
  }

  function refreshData() {
    fetchAdminData('/api/admin/users')
      .then(function(data) { renderUsers(data.users || []); })
      .catch(function(err) { console.error(err); });
    fetchAdminData('/api/admin/recipes')
      .then(function(data) { renderRecipes(data.recipes || []); })
      .catch(function(err) { console.error(err); });
  }

  function deleteUser(userId, username) {
    if (!confirm('Biztosan törölni szeretnéd a felhasználót "' + username + '" és az összes receptjét?')) return;
    fetch('/api/admin/users/' + userId, {
      method: 'DELETE',
      headers: authHeaders()
    })
      .then(function(resp) { return resp.json().catch(function() { return {}; }).then(function(d) { return { ok: resp.ok, data: d }; }); })
      .then(function(r) {
        if (r.ok && r.data.success) {
          refreshData();
          if (adminError) adminError.classList.add('d-none');
        } else {
          showError(r.data && r.data.error === 'cannot_delete_self' ? 'Saját fiókot nem törölhetsz.' : 'Törlés sikertelen.');
        }
      })
      .catch(function() { showError('Törlés sikertelen.'); });
  }

  function deleteRecipe(recipeId) {
    if (!confirm('Biztosan törölni szeretnéd ezt a receptet?')) return;
    fetch('/api/admin/recipes/' + recipeId, {
      method: 'DELETE',
      headers: authHeaders()
    })
      .then(function(resp) { return resp.json().catch(function() { return {}; }).then(function(d) { return { ok: resp.ok, data: d }; }); })
      .then(function(r) {
        if (r.ok && r.data.success) {
          refreshData();
          if (adminError) adminError.classList.add('d-none');
        } else {
          showError('Törlés sikertelen.');
        }
      })
      .catch(function() { showError('Törlés sikertelen.'); });
  }

  document.addEventListener('click', function(e) {
    var btn = e.target.closest('.btn-delete-user');
    if (btn) {
      deleteUser(btn.dataset.id, btn.dataset.username || '');
      return;
    }
    btn = e.target.closest('.btn-delete-recipe');
    if (btn) {
      deleteRecipe(btn.dataset.id);
    }
  });

  fetchAdminData('/api/admin/users')
    .then(function(data) { renderUsers(data.users || []); })
    .catch(function(err) {
      console.error(err);
      showError('Nem sikerült betölteni a felhasználókat (' + (err.message || 'ismeretlen hiba') + ').');
    });

  fetchAdminData('/api/admin/recipes')
    .then(function(data) { renderRecipes(data.recipes || []); })
    .catch(function(err) {
      console.error(err);
      showError('Nem sikerült betölteni a recepteket (' + (err.message || 'ismeretlen hiba') + ').');
    });
});
