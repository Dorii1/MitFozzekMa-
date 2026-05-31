// Receptjeim oldal funkcionalitás
document.addEventListener('DOMContentLoaded', function() {
  // Ellenőrizzük, hogy be van-e jelentkezve
  var currentUser = JSON.parse(localStorage.getItem('currentUser'));
  
  if (!currentUser) {
    // Ha nincs bejelentkezve, irányítsuk át a főoldalra
    alert('Kérjük, jelentkezz be a Receptjeim oldal megtekintéséhez!');
    window.location.href = 'index.html';
    return;
  }
  
  // Felhasználó információk megjelenítése (a userMenu.js is kezeli, de gyors betöltéshez itt is)
  var displayUsername = document.getElementById('displayUsername');
  var displayEmail = document.getElementById('displayEmail');
  if (displayUsername) displayUsername.textContent = currentUser.username;
  if (displayEmail) displayEmail.textContent = currentUser.email;
  
  // Új recept form kezelése
  var newRecipeForm = document.getElementById('newRecipeForm');
  var INGREDIENT_UNITS = [
    { value: '', label: 'Mértékegység' },
    { value: 'g', label: 'g (gramm)' },
    { value: 'kg', label: 'kg' },
    { value: 'ml', label: 'ml' },
    { value: 'l', label: 'l (liter)' },
    { value: 'db', label: 'db (darab)' },
    { value: 'csipet', label: 'csipet' },
    { value: 'evőkanál', label: 'evőkanál' },
    { value: 'teáskanál', label: 'teáskanál' },
    { value: 'szelet', label: 'szelet' },
    { value: 'fej', label: 'fej' },
    { value: 'gerezd', label: 'gerezd' },
    { value: 'csomag', label: 'csomag' },
    { value: 'doboz', label: 'doboz' },
    { value: 'pohár', label: 'pohár' },
    { value: 'bögre', label: 'bögre' },
    { value: 'tasak', label: 'tasak' },
    { value: 'késhegynyi', label: 'késhegynyi' },
    { value: 'ízlés szerint', label: 'ízlés szerint' }
  ];

  function buildUnitSelectOptions(selectedVal) {
    return INGREDIENT_UNITS.map(function(u) {
      return '<option value="' + (u.value || '').replace(/"/g, '&quot;') + '"' + (u.value === selectedVal ? ' selected' : '') + '>' + (u.label || u.value || 'Mértékegység') + '</option>';
    }).join('');
  }

  function parseIngredientPart(part) {
    var amount = '';
    var unit = '';
    part = (part || '').trim();
    var numMatch = part.match(/^(\d+(?:[.,]\d+)?)\s*(.*)$/);
    if (numMatch) {
      amount = numMatch[1].replace(',', '.');
      unit = numMatch[2].trim();
      if (!unit) {
        for (var i = 1; i < INGREDIENT_UNITS.length; i++) {
          if (INGREDIENT_UNITS[i].value === part) { unit = part; amount = ''; break; }
        }
      }
    } else {
      for (var j = 1; j < INGREDIENT_UNITS.length; j++) {
        var uv = INGREDIENT_UNITS[j].value;
        if (uv && part.toLowerCase() === uv.toLowerCase()) {
          unit = uv;
          break;
        }
      }
      if (!unit) amount = part;
    }
    return { amount: amount, unit: unit };
  }

  var addIngredientBtn = document.getElementById('addIngredientBtn');
  var ingredientsList = document.getElementById('ingredientsList');
  var ingredientCounter = 0;
  var addStepBtn = document.getElementById('addStepBtn');
  var stepsList = document.getElementById('stepsList');
  var stepCounter = 0;
  var editingRecipe = null;
  var preservedImageBase64 = null;

  function addStepItem(stepText) {
    stepCounter++;
    var num = stepCounter;
    var row = document.createElement('div');
    row.className = 'step-item';
    row.dataset.num = num;
    row.innerHTML = '<div class="row g-2 align-items-center"><div class="col-auto step-label">' + num + '. lépés:</div><div class="col"><input type="text" class="form-control step-input" placeholder="' + num + '. lépés leírása" value="' + (stepText || '').replace(/"/g, '&quot;').replace(/'/g, '&#39;') + '"></div><div class="col-auto"><button type="button" class="btn btn-outline-danger btn-remove-step" title="Lépés törlése">🗑️</button></div></div>';
    stepsList.appendChild(row);
    row.querySelector('.btn-remove-step').addEventListener('click', function() {
      row.remove();
      updateStepNumbers();
    });
    return row;
  }

  function updateStepNumbers() {
    var items = stepsList.querySelectorAll('.step-item');
    stepCounter = items.length;
    items.forEach(function(item, idx) {
      var num = idx + 1;
      item.dataset.num = num;
      var label = item.querySelector('.step-label');
      var input = item.querySelector('.step-input');
      if (label) label.textContent = num + '. lépés:';
      if (input) input.placeholder = num + '. lépés leírása';
    });
  }

  if (addStepBtn && stepsList) {
    addStepBtn.addEventListener('click', function(e) {
      e.preventDefault();
      addStepItem('');
      stepsList.lastChild.querySelector('.step-input').focus();
    });
    addStepItem('');
  }
  
  // Kép előnézet
  var recipeImage = document.getElementById('recipeImage');
  var recipeImageUrl = document.getElementById('recipeImageUrl');
  var imagePreview = document.getElementById('imagePreview');
  
  if (recipeImage) {
    recipeImage.addEventListener('change', function(e) {
      var file = e.target.files[0];
      if (file) {
        if (!file.type || file.type.indexOf('image/') !== 0) {
          alert('Kérjük, csak képfájlt tölts fel (JPG, PNG, GIF, WEBP)! A kiválasztott fájl típusa: ' + (file.type || 'ismeretlen'));
          recipeImage.value = '';
          if (imagePreview) imagePreview.innerHTML = '';
          return;
        }
        var reader = new FileReader();
        reader.onload = function(ev) {
          imagePreview.innerHTML = '<img src="' + ev.target.result + '" class="image-preview" alt="Kép előnézet">';
        };
        reader.readAsDataURL(file);
        if (recipeImageUrl) recipeImageUrl.value = '';
        preservedImageBase64 = null;
      }
    });
  }
  
  if (recipeImageUrl) {
    recipeImageUrl.addEventListener('input', function(e) {
      var url = e.target.value.trim();
      if (url && (url.match(/\.(jpg|jpeg|png|gif|webp)(\?|$)/i) || url.indexOf('data:image/') === 0)) {
        imagePreview.innerHTML = '<img src="' + url + '" class="image-preview" alt="Kép előnézet" onerror="this.parentElement.innerHTML=\'\';alert(\'A megadott URL nem betölthető képként.\')">';
      } else if (url === '') {
        imagePreview.innerHTML = '';
      }
      if (recipeImage) recipeImage.value = '';
      preservedImageBase64 = null;
    });
  }
  
  function addIngredientRow(nameVal, amountVal, unitVal) {
    ingredientCounter++;
    var unitOpts = buildUnitSelectOptions(unitVal || '');
    var row = document.createElement('div');
    row.className = 'ingredient-item';
    row.id = 'ingredientRow_' + ingredientCounter;
    row.innerHTML = '<div class="row g-2 align-items-center"><div class="col-12 col-md-4"><input type="text" class="form-control ingredient-name" placeholder="Hozzávaló neve" value="' + (nameVal || '').replace(/"/g, '&quot;').replace(/'/g, '&#39;') + '" required></div><div class="col-12 col-md-2"><input type="text" class="form-control ingredient-amount" placeholder="Mennyiség" value="' + (amountVal || '').replace(/"/g, '&quot;').replace(/'/g, '&#39;') + '"></div><div class="col-12 col-md-3"><select class="form-select form-select-sm ingredient-unit">' + unitOpts + '</select></div><div class="col-12 col-md-3"><button type="button" class="btn btn-danger w-100">🗑️ Törlés</button></div></div>';
    ingredientsList.appendChild(row);
    row.querySelector('button').addEventListener('click', function() { row.remove(); });
  }

  if (addIngredientBtn && ingredientsList) {
    addIngredientBtn.addEventListener('click', function(e) {
      e.preventDefault();
      addIngredientRow('', '', '');
    });
    addIngredientRow('', '', '');
  }

  var baseServesForScaling = 4;
  var recipeServesEl = document.getElementById('recipeServes');
  if (recipeServesEl) {
    baseServesForScaling = parseInt(recipeServesEl.value, 10) || 4;
    recipeServesEl.addEventListener('change', function() {
      var newServes = parseInt(recipeServesEl.value, 10) || 4;
      if (newServes === baseServesForScaling) return;
      var ratio = newServes / baseServesForScaling;
      var items = ingredientsList ? ingredientsList.querySelectorAll('.ingredient-item') : [];
      items.forEach(function(item) {
        var amountInput = item.querySelector('.ingredient-amount');
        var unitSelect = item.querySelector('.ingredient-unit');
        if (!amountInput) return;
        var unit = unitSelect ? unitSelect.value : '';
        var skipUnits = ['csipet', 'ízlés szerint', 'késhegynyi', 'fej', 'gerezd'];
        if (unit && skipUnits.indexOf(unit) !== -1) return;
        var val = amountInput.value.trim().replace(',', '.');
        var num = parseFloat(val);
        if (isNaN(num) || num <= 0) return;
        var newNum = num * ratio;
        amountInput.value = (newNum % 1 === 0) ? String(Math.round(newNum)) : newNum.toFixed(2).replace(/\.?0+$/, '');
      });
      baseServesForScaling = newServes;
    });
  }
  
  // Új recept form submit
  if (newRecipeForm) {
    newRecipeForm.addEventListener('submit', function(e) {
      e.preventDefault();
      
      var title = document.getElementById('recipeTitle').value.trim();
      var time = document.getElementById('recipeTime').value;
      var serves = document.getElementById('recipeServes').value || '4';
      var meal = document.getElementById('recipeMeal').value;
      var type = document.getElementById('recipeType').value;
      var kaloria = document.getElementById('recipeKaloria') ? document.getElementById('recipeKaloria').value.trim() : '';
      var steps = [];
      if (stepsList) {
        stepsList.querySelectorAll('.step-input').forEach(function(inp) {
          var v = inp.value.trim();
          if (v) steps.push(v);
        });
      }
      var imageFile = document.getElementById('recipeImage') ? document.getElementById('recipeImage').files[0] : null;
      var imageUrl = document.getElementById('recipeImageUrl') ? document.getElementById('recipeImageUrl').value.trim() : '';
      
      if (imageUrl && !imageUrl.match(/\.(jpg|jpeg|png|gif|webp)(\?|$)/i) && imageUrl.indexOf('data:image/') !== 0) {
        alert('Kérjük, csak érvényes kép URL-t adj meg (pl. .jpg, .png, .webp végződésű)!');
        return;
      }
      
      // Validáció
      if (!title || !time || !meal || !type || steps.length === 0) {
        alert('Kérjük, töltsd ki az összes kötelező mezőt, és adj meg legalább egy lépést!');
        return;
      }
      
      // Hozzávalók összegyűjtése
      var ingredients = [];
      var ingredientItems = ingredientsList.querySelectorAll('.ingredient-item');
      ingredientItems.forEach(function(item) {
        var nameInput = item.querySelector('.ingredient-name');
        var amountInput = item.querySelector('.ingredient-amount');
        var unitSelect = item.querySelector('.ingredient-unit');
        if (nameInput) {
          var name = nameInput.value.trim();
          var amount = amountInput ? amountInput.value.trim() : '';
          var unit = unitSelect ? (unitSelect.value || '').trim() : '';
          if (name) {
            var part = amount ? (unit ? amount + ' ' + unit : amount) : (unit || '');
            ingredients.push(part ? name + ': ' + part : name);
          }
        }
      });
      
      if (ingredients.length === 0) {
        alert('Kérjük, adj meg legalább egy hozzávalót!');
        return;
      }
      
      // Kép kezelése
      var finalImageUrl = '';
      if (imageFile) {
        if (!imageFile.type || imageFile.type.indexOf('image/') !== 0) {
          alert('Kérjük, csak képfájlt tölts fel (JPG, PNG, GIF, WEBP)!');
          return;
        }
        var reader = new FileReader();
        reader.onload = function(e) {
          finalImageUrl = e.target.result;
          saveRecipe(title, time, meal, type, steps, ingredients, finalImageUrl, editingRecipe, kaloria);
        };
        reader.readAsDataURL(imageFile);
      } else if (imageUrl) {
        finalImageUrl = imageUrl;
        saveRecipe(title, time, meal, type, steps, ingredients, finalImageUrl, editingRecipe, kaloria);
      } else if (editingRecipe && preservedImageBase64) {
        saveRecipe(title, time, meal, type, steps, ingredients, preservedImageBase64, editingRecipe, kaloria);
      } else {
        saveRecipe(title, time, meal, type, steps, ingredients, '', editingRecipe, kaloria);
      }
    });
  }

  function cancelEdit() {
    editingRecipe = null;
    newRecipeForm.reset();
    if (recipeServesEl) baseServesForScaling = parseInt(recipeServesEl.value, 10) || 4;
    if (ingredientsList) {
      ingredientsList.innerHTML = '';
      ingredientCounter = 0;
      addIngredientRow('', '', '');
    }
    if (stepsList) {
      stepsList.innerHTML = '';
      stepCounter = 0;
      addStepItem('');
    }
    preservedImageBase64 = null;
    if (imagePreview) imagePreview.innerHTML = '';
    if (recipeImage) recipeImage.value = '';
    if (recipeImageUrl) recipeImageUrl.value = '';
    var submitBtn = newRecipeForm ? newRecipeForm.querySelector('button[type="submit"]') : null;
    if (submitBtn) submitBtn.textContent = '💾 Recept mentése';
    var cancelBtn = document.getElementById('cancelEditBtn');
    if (cancelBtn) cancelBtn.remove();
    loadSavedRecipes();
  }

  function fillRecipeForm(recipe) {
    document.getElementById('recipeTitle').value = recipe.title || '';
    document.getElementById('recipeTime').value = recipe.time || '';
    var serves = recipe.serves || '4';
    document.getElementById('recipeServes').value = serves;
    baseServesForScaling = parseInt(serves, 10) || 4;
    document.getElementById('recipeMeal').value = recipe.meal || '';
    document.getElementById('recipeType').value = recipe.type || '';
    var kalEl = document.getElementById('recipeKaloria');
    if (kalEl) kalEl.value = recipe.kaloria || recipe.calories || '';
    var stepsRaw = recipe.steps || recipe.recept_hozzaadas || '';
    var stepsArr = Array.isArray(stepsRaw) ? stepsRaw : (typeof stepsRaw === 'string' ? stepsRaw.split(/\n+/).map(function(s) { return s.replace(/^\d+[\.\)]\s*/, '').trim(); }).filter(Boolean) : []);
    if (stepsList) {
      stepsList.innerHTML = '';
      stepCounter = 0;
      if (stepsArr.length === 0) {
        addStepItem('');
      } else {
        stepsArr.forEach(function(s) { addStepItem(s); });
      }
    }
    document.getElementById('recipeImageUrl').value = (recipe.image && recipe.image.indexOf('data:') !== 0) ? recipe.image : '';
    preservedImageBase64 = (recipe.image && recipe.image.indexOf('data:image/') === 0) ? recipe.image : null;
    if (recipe.image && recipe.image.indexOf('data:') === 0 && imagePreview) {
      imagePreview.innerHTML = '<img src="' + recipe.image + '" class="image-preview" alt="Kép előnézet">';
    } else if (imagePreview) imagePreview.innerHTML = '';
    ingredientsList.innerHTML = '';
    ingredientCounter = 0;
    var ings = recipe.ingredients || [];
    if (!Array.isArray(ings) && typeof ings === 'string') ings = ings.split(',').map(function(s) { return s.trim(); });
    for (var i = 0; i < ings.length; i++) {
      var ing = ings[i];
      var name = ing;
      var part = '';
      if (typeof ing === 'string' && ing.indexOf(':') !== -1) {
        var idx = ing.indexOf(':');
        name = ing.substring(0, idx).trim();
        part = ing.substring(idx + 1).trim();
      }
      var parsed = parseIngredientPart(part);
      addIngredientRow(name, parsed.amount, parsed.unit);
    }
    editingRecipe = recipe;
    var submitBtn = newRecipeForm ? newRecipeForm.querySelector('button[type="submit"]') : null;
    if (submitBtn) submitBtn.textContent = '✏️ Módosítás mentése';
    var cancelBtn = document.getElementById('cancelEditBtn');
    if (!cancelBtn) {
      cancelBtn = document.createElement('button');
      cancelBtn.type = 'button';
      cancelBtn.id = 'cancelEditBtn';
      cancelBtn.className = 'btn btn-outline-secondary btn-lg py-3 ms-2';
      cancelBtn.textContent = 'Módosítás megszakítása';
      cancelBtn.addEventListener('click', cancelEdit);
      var btnWrap = submitBtn ? (submitBtn.closest('.d-grid') || submitBtn.closest('.form-block-submit')) : null;
      if (btnWrap) {
        btnWrap.classList.remove('d-grid');
        btnWrap.classList.add('d-flex');
        btnWrap.appendChild(cancelBtn);
      }
    }
    if (document.querySelector('.recipe-form-section')) {
      document.querySelector('.recipe-form-section').scrollIntoView({ behavior: 'smooth', block: 'start' });
    }
  }
  
  function saveRecipe(title, time, meal, type, steps, ingredients, imageUrl, editRecipe, kaloria) {
    var stepsArray = Array.isArray(steps) ? steps : (typeof steps === 'string' && steps.trim() ? [steps.trim()] : []);
    
    var newRecipe = {
      id: 'user_' + Date.now(),
      title: title,
      time: time,
      serves: document.getElementById('recipeServes').value || '4',
      meal: meal,
      type: type,
      kaloria: kaloria || null,
      image: imageUrl,
      ingredients: ingredients,
      steps: stepsArray,
      allergens: 'none',
      edes: 'nem',
      sos: 'igen',
      userId: currentUser.username,
      createdAt: new Date().toISOString()
    };

    function finishSave(apiId, isUpdate) {
      if (apiId) newRecipe.id = 'db_' + apiId;
      var userRecipes = JSON.parse(localStorage.getItem('userRecipes_' + currentUser.username)) || [];
      if (editRecipe) {
        userRecipes = userRecipes.filter(function(x) {
          return x.id !== editRecipe.id && String(x.id) !== String(editRecipe.id);
        });
      }
      userRecipes.push(newRecipe);
      localStorage.setItem('userRecipes_' + currentUser.username, JSON.stringify(userRecipes));
      var savedRecipes = JSON.parse(localStorage.getItem('savedRecipes_' + currentUser.username)) || [];
      if (editRecipe) {
        savedRecipes = savedRecipes.filter(function(x) { return x !== editRecipe.id && x !== String(editRecipe.id); });
      }
      if (savedRecipes.indexOf(newRecipe.id) === -1) {
        savedRecipes.push(newRecipe.id);
        localStorage.setItem('savedRecipes_' + currentUser.username, JSON.stringify(savedRecipes));
      }
      alert(isUpdate ? 'A recept módosítva! 🎉' : 'Sikeresen hozzáadtad a receptet! 🎉 A recept mostantól megjelenik a Főoldalon és az adatbázisban.');
      cancelEdit();
      loadSavedRecipes();
      setTimeout(function() {
        var el = document.querySelector('.saved-recipes-section');
        if (el) el.scrollIntoView({ behavior: 'smooth', block: 'start' });
      }, 100);
    }

    if (editRecipe && editRecipe.id && String(editRecipe.id).indexOf('db_') === 0 && currentUser.id && currentUser.token) {
      var dbId = String(editRecipe.id).replace('db_', '');
      fetch('/api/recipes/' + dbId, {
        method: 'PUT',
        headers: {
          'Content-Type': 'application/json',
          'x-auth-user': String(currentUser.id),
          'x-auth-token': currentUser.token
        },
        body: JSON.stringify({
          title: title,
          time: time,
          meal: meal,
          type: type,
          steps: stepsArray,
          ingredients: ingredients,
          image: imageUrl,
          kaloria: kaloria || null
        })
      })
        .then(function(r) { return r.json().catch(function() { return {}; }).then(function(d) { return { ok: r.ok, data: d }; }); })
        .then(function(r) {
          if (r.ok && r.data && r.data.success) {
            finishSave(dbId, true);
          } else {
            finishSave(null, true);
          }
        })
        .catch(function() { finishSave(null, true); });
      return;
    }

    if (editRecipe) {
      finishSave(null, true);
      return;
    }

    if (currentUser.id && currentUser.token) {
      fetch('/api/recipes', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'x-auth-user': String(currentUser.id),
          'x-auth-token': currentUser.token
        },
        body: JSON.stringify({
          title: title,
          time: time,
          meal: meal,
          type: type,
          steps: stepsArray,
          ingredients: ingredients,
          image: imageUrl,
          kaloria: kaloria || null,
          allergens: 'none'
        })
      })
        .then(function(r) { return r.json().catch(function() { return {}; }).then(function(d) { return { ok: r.ok, data: d }; }); })
        .then(function(r) {
          if (r.ok && r.data && r.data.success) {
            finishSave(r.data.id);
          } else {
            finishSave(null);
            if (r.data && r.data.error === 'login_required') {
              alert('A recept mentéséhez újra be kell jelentkezned.');
            } else {
              alert('A receptet nem sikerült menteni az adatbázisba. Csak helyben mentve – nem fog megjelenni a Főoldalon.');
            }
          }
        })
        .catch(function(err) {
          console.error('Recept mentési hiba:', err);
          finishSave(null);
          alert('Nem sikerült kapcsolódni a szerverhez. A recept csak helyben mentve – nem fog megjelenni a Főoldalon.');
        });
    } else {
      finishSave(null);
    }
  }
  
  // Kedvelt receptek betöltése
  loadFavoriteRecipes();
  
  // Mentett receptek betöltése
  loadSavedRecipes();
  
  function loadFavoriteRecipes() {
    function slugify(s) {
      return String(s).toLowerCase().replace(/[^a-z0-9 -]+/g, '-').replace(/--+/g, '-').replace(/(^-|-$)/g, '');
    }
    
    var favoriteRecipes = JSON.parse(localStorage.getItem('favoriteRecipes_' + currentUser.username)) || [];
    var grid = document.getElementById('favoriteRecipesGrid');
    
    if (!grid) return;
    
    grid.innerHTML = '';
    
    if (favoriteRecipes.length === 0) {
      grid.innerHTML = '<div class="col-12"><div class="empty-state"><p>Még nincs kedvelt recepted. Böngészd az <a href="index.html">összes receptet</a> és kattints a szív ikonra, hogy kedvelve jelöld meg!</p></div></div>';
      return;
    }
    
    // Betöltjük az API-ból a kedvelt recepteket
    fetch('/api/recipes')
      .then(function(response) {
        if (!response.ok) throw new Error('hiba');
        return response.json();
      })
      .then(function(allRecipes) {
        // Szűrjük a kedvelt recepteket
        var favoriteFromApi = allRecipes.filter(function(recipe) {
          var recipeId = recipe.id || slugify(recipe.title || '');
          return favoriteRecipes.indexOf(recipeId) !== -1 || favoriteRecipes.indexOf(recipe.title) !== -1;
        });
        
        if (favoriteFromApi.length === 0) {
          grid.innerHTML = '<div class="col-12"><div class="empty-state"><p>Még nincs kedvelt recepted. Böngészd az <a href="index.html">összes receptet</a> és kattints a szív ikonra, hogy kedvelve jelöld meg!</p></div></div>';
          return;
        }
        
        // Rendereljük a kedvelt recepteket
        renderRecipes(favoriteFromApi, grid, 'favorite');
      })
      .catch(function(error) {
        console.error('hiba:', error);
        grid.innerHTML = '<div class="col-12"><div class="empty-state"><p class="text-danger">Hiba történt a kedvelt receptek betöltésekor.</p></div></div>';
      });
  }
  
  function loadSavedRecipes() {
    var savedRecipes = JSON.parse(localStorage.getItem('savedRecipes_' + currentUser.username)) || [];
    var userRecipes = JSON.parse(localStorage.getItem('userRecipes_' + currentUser.username)) || [];
    var grid = document.getElementById('savedRecipesGrid');
    
    if (!grid) return;
    
    grid.innerHTML = '';
    
    // Összegyűjtjük az összes receptet
    var allRecipesToShow = [];
    
    // Először a felhasználó saját receptjei
    allRecipesToShow = allRecipesToShow.concat(userRecipes);
    
    // Majd betöltjük az API-ból a mentett recepteket
    fetch('/api/recipes')
      .then(function(response) {
        if (!response.ok) throw new Error('hiba');
        return response.json();
      })
      .then(function(allRecipes) {
        // Szűrjük a mentett recepteket (amelyeket nem a felhasználó hozott létre)
        var currentUserId = currentUser.id ? String(currentUser.id) : '';
        var savedFromApi = allRecipes.filter(function(recipe) {
          var isInSaved = savedRecipes.indexOf(recipe.id) !== -1 || savedRecipes.indexOf('db_' + recipe.id) !== -1 || savedRecipes.indexOf(recipe.title) !== -1;
          var isOwnRecipe = recipe.userId != null && (String(recipe.userId) === currentUserId || String(recipe.userId) === currentUser.username);
          return isInSaved && !isOwnRecipe; // saját receptek userRecipes-ból jönnek, ne duplikálódjanak
        });
        
        allRecipesToShow = allRecipesToShow.concat(savedFromApi);
        
        // Deduplikáció – ugyanaz a recept (cím+idő+meal) ne jelenjen meg kétszer
        var seenByContent = {};
        allRecipesToShow = allRecipesToShow.filter(function(r) {
          var contentKey = ((r.title || '') + '|' + (r.time || '') + '|' + (r.meal || '')).toLowerCase();
          if (!contentKey) return true;
          if (seenByContent[contentKey]) return false;
          seenByContent[contentKey] = true;
          return true;
        });
        
        if (allRecipesToShow.length === 0) {
          grid.innerHTML = '<div class="col-12"><div class="empty-state"><p>Még nincs mentett recepted. Böngészd az <a href="index.html">összes receptet</a> és mentsd el a kedvenceidet, vagy add hozzá az első saját receptedet!</p></div></div>';
          return;
        }
        
        // Rendereljük a recepteket
        renderRecipes(allRecipesToShow, grid, 'saved');
      })
      .catch(function(error) {
        console.error('hiba:', error);
        // Ha csak a saját receptek vannak, azokat mutassuk
        if (userRecipes.length > 0) {
          renderRecipes(userRecipes, grid, 'saved');
        } else {
          grid.innerHTML = '<div class="col-12"><div class="empty-state"><p class="text-danger">Hiba történt a receptek betöltésekor.</p></div></div>';
        }
      });
  }
  
  function renderRecipes(recipes, grid, source) {
    function slugify(s) {
      return String(s).toLowerCase().replace(/[^a-z0-9 -]+/g, '-').replace(/--+/g, '-').replace(/(^-|-$)/g, '');
    }
    
    for (var i = 0; i < recipes.length; i++) {
      (function(r) {
      var col = document.createElement('div');
      col.className = 'col-md-4';
      
      var card = document.createElement('div');
      card.className = 'card';
      
      var media = document.createElement('div');
      media.className = 'card-media';
      media.style.position = 'relative';
      
      var img = document.createElement('img');
      img.className = 'card-img-top';
      img.src = r.image || '';
      img.alt = r.title || '';
      img.onerror = function() { this.style.background = '#e9ecef'; this.src = 'data:image/svg+xml,' + encodeURIComponent('<svg xmlns="http://www.w3.org/2000/svg" width="200" height="150" viewBox="0 0 200 150"><rect fill="#dee2e6" width="200" height="150"/><text fill="#6c757d" x="100" y="80" text-anchor="middle" font-size="14" font-family="sans-serif">Nincs kép</text></svg>'); };
      media.appendChild(img);
      
      var btnWrap = document.createElement('div');
      btnWrap.className = 'recipe-card-actions d-flex gap-2';
      btnWrap.style.cssText = 'position:absolute;top:8px;right:8px;z-index:2';
      var isOwnRecipe = r.userId === currentUser.username || (r.id && (String(r.id).indexOf('user_') === 0 || String(r.id).indexOf('db_') === 0));
      if (isOwnRecipe) {
        var editBtn = document.createElement('button');
        editBtn.className = 'btn btn-sm recipe-action-btn';
        editBtn.style.cssText = 'min-width:36px;height:36px;padding:0;background:rgba(255,255,255,0.9);color:#333;border:none;border-radius:8px';
        editBtn.textContent = '✏️';
        editBtn.title = 'Recept módosítása';
        editBtn.addEventListener('click', function(e) {
          e.stopPropagation();
          fillRecipeForm(r);
        });
        btnWrap.appendChild(editBtn);
      }
      var delBtn = document.createElement('button');
      delBtn.className = 'btn btn-sm recipe-action-btn';
      delBtn.style.cssText = 'min-width:36px;height:36px;padding:0;background:rgba(220,53,69,0.9);color:white;border:none;border-radius:8px';
      delBtn.setAttribute('aria-label', 'Eltávolítás');
      delBtn.dataset.id = slugify(r.title || '');
      delBtn.textContent = '🗑️';
      delBtn.title = 'Recept törlése';
      delBtn.addEventListener('click', function(e) {
        e.stopPropagation();
        var confirmMsg = source === 'favorite'
          ? 'Biztosan eltávolítod ezt a receptet a kedveltek közül?'
          : 'Biztosan törölni szeretnéd ezt a receptet?';
        if (confirm(confirmMsg)) {
          if (source === 'favorite') {
            removeFavoriteRecipe(r.id || r.title);
          } else {
            removeSavedRecipe(r.id || r.title);
          }
        }
      });
      btnWrap.appendChild(delBtn);
      media.appendChild(btnWrap);
      
      var preview = document.createElement('div');
      preview.className = 'preview';
      var pbtn = document.createElement('button');
      pbtn.className = 'btn btn-sm';
      pbtn.textContent = 'Megnézem';
      pbtn.addEventListener('click', function() {
        openRecipeModal(r);
      });
      preview.appendChild(pbtn);
      media.appendChild(preview);
      
      card.appendChild(media);
      
      var body = document.createElement('div');
      body.className = 'card-body';
      body.dataset.id = slugify(r.title || '');
      
      var h5 = document.createElement('h5');
      h5.className = 'card-title';
      h5.textContent = r.title || '';
      body.appendChild(h5);
      
      var badgeWrap = document.createElement('div');
      badgeWrap.className = 'd-flex justify-content-center gap-2 mt-2 flex-wrap';
      
      var timeVal = r.time || r.ido;
      if (timeVal && String(timeVal).trim()) {
        var timeBadge = document.createElement('span');
        timeBadge.className = 'badge badge-soft';
        timeBadge.textContent = '⏱️ ' + String(timeVal).trim() + ' min';
        badgeWrap.appendChild(timeBadge);
      }
      
      if (r.type) {
        var typeBadge = document.createElement('span');
        typeBadge.className = 'badge badge-accent';
        typeBadge.textContent = r.type.charAt(0).toUpperCase() + r.type.slice(1);
        badgeWrap.appendChild(typeBadge);
      }
      
      if (r.meal) {
        var mealBadge = document.createElement('span');
        mealBadge.className = 'badge badge-muted';
        mealBadge.textContent = r.meal.charAt(0).toUpperCase() + r.meal.slice(1);
        badgeWrap.appendChild(mealBadge);
      }
      if (r.kaloria || r.calories) {
        var calBadge = document.createElement('span');
        calBadge.className = 'badge badge-calorie';
        calBadge.textContent = '🔥 ' + (r.kaloria || r.calories) + ' kcal';
        badgeWrap.appendChild(calBadge);
      }
      body.appendChild(badgeWrap);
      card.appendChild(body);
      col.appendChild(card);
      grid.appendChild(col);
      })(recipes[i]);
    }
  }
  
  function removeFavoriteRecipe(recipeId) {
    var favoriteRecipes = JSON.parse(localStorage.getItem('favoriteRecipes_' + currentUser.username)) || [];
    var idStr = String(recipeId);
    favoriteRecipes = favoriteRecipes.filter(function(id) {
      return String(id) !== idStr;
    });
    localStorage.setItem('favoriteRecipes_' + currentUser.username, JSON.stringify(favoriteRecipes));
    loadFavoriteRecipes();
  }
  
  function removeSavedRecipe(recipeId) {
    var dbId = String(recipeId).indexOf('db_') === 0 ? String(recipeId).replace('db_', '') : null;
    if (dbId && currentUser.id && currentUser.token) {
      fetch('/api/recipes/' + dbId, {
        method: 'DELETE',
        headers: { 'x-auth-user': String(currentUser.id), 'x-auth-token': currentUser.token }
      }).catch(function() {});
    }
    var savedRecipes = JSON.parse(localStorage.getItem('savedRecipes_' + currentUser.username)) || [];
    savedRecipes = savedRecipes.filter(function(id) {
      return id !== recipeId && id !== recipeId.toString();
    });
    localStorage.setItem('savedRecipes_' + currentUser.username, JSON.stringify(savedRecipes));
    var userRecipes = JSON.parse(localStorage.getItem('userRecipes_' + currentUser.username)) || [];
    userRecipes = userRecipes.filter(function(recipe) {
      return recipe.id !== recipeId && recipe.id !== recipeId.toString();
    });
    localStorage.setItem('userRecipes_' + currentUser.username, JSON.stringify(userRecipes));
    loadSavedRecipes();
  }
  
  // Függvény, ami arányosan módosítja a hozzávalók mennyiségét
  function adjustIngredientsForServes(ingredients, serves, baseServes) {
    if (!ingredients || ingredients.length === 0) return ingredients;
    if (!serves || serves <= 0) serves = baseServes || 4;
    if (!baseServes || baseServes <= 0) baseServes = 4;
    
    var ratio = serves / baseServes;
    var adjusted = [];
    
    for (var i = 0; i < ingredients.length; i++) {
      var ing = ingredients[i];
      // Regex, ami kinyeri a számot a hozzávaló elejéről (pl. "2 db tojás" -> 2)
      var match = ing.match(/^(\d+(?:[.,]\d+)?)\s*(.*)$/);
      
      if (match) {
        var originalAmount = parseFloat(match[1].replace(',', '.'));
        var rest = match[2];
        var newAmount = originalAmount * ratio;
        
        // Kerekítjük 2 tizedesjegyre, de ha egész szám, akkor nem mutatjuk a tizedesjegyet
        if (newAmount % 1 === 0) {
          adjusted.push(Math.round(newAmount) + ' ' + rest);
        } else {
          adjusted.push(newAmount.toFixed(2).replace(/\.?0+$/, '') + ' ' + rest);
        }
      } else {
        // Ha nincs szám az elején, akkor változatlanul hagyjuk
        adjusted.push(ing);
      }
    }
    
    return adjusted;
  }

  function openRecipeModal(recipe) {
    var modalEl = document.getElementById("recipeModal");
    if (!modalEl) return;
    var titleEl = document.getElementById("recipeModalTitle");
    var imgEl = document.getElementById("recipeModalImg");
    var ingEl = document.getElementById("recipeModalIngredients");
    var stepsEl = document.getElementById("recipeModalSteps");
    var servesInput = document.getElementById("servesInput");
    
    // Tároljuk az eredeti receptet és hozzávalókat
    var originalIngredients = normalizeList(recipe.ingredients);
    var baseServes = 4; // Alapértelmezett főszám
    
    if (titleEl) titleEl.textContent = recipe.title || "Recept";
    var metaEl = document.getElementById("recipeModalMeta");
    var baseKaloria = parseFloat(recipe.kaloria || recipe.calories) || 0;
    function updateMeta() {
      if (!metaEl) return;
      var parts = [];
      if (recipe.time) parts.push("⏱️ " + recipe.time + " min");
      if (baseKaloria > 0) {
        var currentServes = servesInput ? parseInt(servesInput.value, 10) || baseServes : baseServes;
        var scaledKaloria = Math.round(baseKaloria * (currentServes / baseServes));
        parts.push("🔥 " + scaledKaloria + " kcal");
      }
      metaEl.textContent = parts.join(" • ");
      metaEl.style.display = parts.length ? "block" : "none";
    }
    updateMeta();
    if (recipe.image && imgEl) {
      imgEl.src = recipe.image;
      imgEl.alt = recipe.title || "Recept kép";
      imgEl.classList.remove("d-none");
    } else if (imgEl) {
      imgEl.classList.add("d-none");
    }
    
    // Függvény, ami frissíti a hozzávalók megjelenítését és a kalóriát
    function updateIngredients() {
      updateMeta();
      if (!ingEl) return;
      ingEl.innerHTML = "";
      
      if (originalIngredients.length === 0) {
        ingEl.innerHTML = '<li class="list-group-item text-muted">Nincs megadva hozzávaló.</li>';
        return;
      }
      
      var currentServes = servesInput ? parseInt(servesInput.value) || baseServes : baseServes;
      var adjustedIngredients = adjustIngredientsForServes(originalIngredients, currentServes, baseServes);
      
      for (var i = 0; i < adjustedIngredients.length; i++) {
        var li = document.createElement("li");
        li.className = "list-group-item";
        li.textContent = adjustedIngredients[i];
        ingEl.appendChild(li);
      }
    }
    
    // Kezdeti megjelenítés
    updateIngredients();
    
    // Event listener a főszám változásához (először eltávolítjuk a régi listener-eket, ha vannak)
    if (servesInput) {
      // Klónozzuk az input mezőt, hogy eltávolítsuk az összes event listener-t
      var newServesInput = servesInput.cloneNode(true);
      servesInput.parentNode.replaceChild(newServesInput, servesInput);
      servesInput = newServesInput;
      
      servesInput.addEventListener('input', updateIngredients);
      servesInput.addEventListener('change', updateIngredients);
    }
    
    if (stepsEl) {
      stepsEl.innerHTML = "";
      // Ha a részletes formátumot tartalmazza (LÉPÉS szóval), egyetlen stringként kezeljük
      var steps;
      if (Array.isArray(recipe.steps) && recipe.steps.length === 1 && 
          typeof recipe.steps[0] === 'string' && 
          recipe.steps[0].includes('LÉPÉS') && recipe.steps[0].includes('\n')) {
        steps = recipe.steps; // Egyetlen stringként hagyjuk
      } else {
        steps = normalizeList(recipe.steps);
      }
      
      if (steps.length === 0) {
        stepsEl.innerHTML = '<li class="list-group-item text-muted">Nincs megadva elkészítés.</li>';
      } else {
        // Ha a lépések egyetlen hosszú szövegben vannak (részletes formátum), formázzuk szépen
        if (steps.length === 1 && typeof steps[0] === 'string' && steps[0].includes('\n')) {
          var detailedSteps = steps[0];
          // Szétbontjuk a \n karakterek mentén
          var stepLines = detailedSteps.split('\n');
          var stepNumber = 0;
          var currentStepContent = [];
          
          for (var k = 0; k < stepLines.length; k++) {
            var line = stepLines[k].trim();
            if (line.length === 0) continue;
            
            // Ha új lépés kezdődik (számmal vagy "LÉPÉS" szóval)
            if (line.match(/^\d+\.\s*LÉPÉS/i) || line.match(/^\d+\.\s*-/)) {
              // Ha volt előző lépés, mentsük el
              if (stepNumber > 0 && currentStepContent.length > 0) {
                var stepLi = document.createElement("li");
                stepLi.className = "list-group-item";
                stepLi.style.cssText = 'padding: 12px 16px; border-left: 4px solid #45d328;';
              // Eltávolítjuk a vezető sorszámot (pl. "1. " vagy "1. LÉPÉS - " rész)
              var titleText = currentStepContent[0].replace(/^\d+\.\s*LÉPÉS\s*-\s*/, '').replace(/^\d+\.\s*/, '');
              stepLi.innerHTML = '<strong>' + titleText + '</strong>' + 
                  (currentStepContent.length > 1 ? '<br>' + currentStepContent.slice(1).join('<br>') : '');
                stepsEl.appendChild(stepLi);
              }
              // Új lépés kezdése
              stepNumber++;
              currentStepContent = [line];
            } else if (line.startsWith('-') || line.startsWith('•')) {
              // Alpontok
              currentStepContent.push('&nbsp;&nbsp;' + line);
            } else {
              // Normál szöveg
              if (currentStepContent.length === 0) {
                currentStepContent.push(line);
              } else {
                currentStepContent.push(line);
              }
            }
          }
          
          // Az utolsó lépés hozzáadása
          if (stepNumber > 0 && currentStepContent.length > 0) {
            var stepLi = document.createElement("li");
            stepLi.className = "list-group-item";
            stepLi.style.cssText = 'padding: 12px 16px; border-left: 4px solid #45d328;';
            // Eltávolítjuk a vezető sorszámot (pl. "1. " vagy "1. LÉPÉS - " rész)
            var titleText = currentStepContent[0].replace(/^\d+\.\s*LÉPÉS\s*-\s*/, '').replace(/^\d+\.\s*/, '');
            stepLi.innerHTML = '<strong>' + titleText + '</strong>' + 
              (currentStepContent.length > 1 ? '<br>' + currentStepContent.slice(1).join('<br>') : '');
            stepsEl.appendChild(stepLi);
          }
          
          // Ha nem találtunk formázott lépéseket, jelenítsük meg egyszerűen
          if (stepNumber === 0) {
            var stepLi = document.createElement("li");
            stepLi.className = "list-group-item";
            stepLi.style.cssText = 'padding: 12px 16px;';
            stepLi.innerHTML = detailedSteps.replace(/\n/g, '<br>');
            stepsEl.appendChild(stepLi);
          }
        } else {
          // Normál lépések megjelenítése számozással
          for (var j = 0; j < steps.length; j++) {
            var stepLi = document.createElement("li");
            stepLi.className = "list-group-item";
            stepLi.style.cssText = 'padding: 12px 16px; border-left: 4px solid #45d328;';
            // Ha tartalmaz \n karaktereket, formázzuk HTML-ben
            if (steps[j].includes('\n')) {
              stepLi.innerHTML = steps[j].replace(/\n/g, '<br>');
            } else {
              stepLi.textContent = steps[j];
            }
            stepsEl.appendChild(stepLi);
          }
        }
      }
    }
    
    var modal = new bootstrap.Modal(modalEl);
    modal.show();
  }
  
  function normalizeList(value) {
    if (!value) return [];
    if (Array.isArray(value)) return value;
    var parts = String(value).split(/\n|\r|,|;/);
    var result = [];
    for (var i = 0; i < parts.length; i++) {
      var trimmed = parts[i].trim();
      if (trimmed.length > 0) result.push(trimmed);
    }
    return result;
  }
  
  // User menu: userMenu.js kezeli (profil kattintás, dropdown, kijelentkezés)
});
