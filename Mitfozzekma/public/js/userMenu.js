// User menu dropdown funkcionalitás - közös kód minden oldalhoz
document.addEventListener('DOMContentLoaded', function() {
  var userMenuToggle = document.getElementById('userMenuToggle');
  var userMenuDropdown = document.getElementById('userMenuDropdown');
  var loginSection = document.getElementById('loginSection');
  var registerSection = document.getElementById('registerSection');
  var switchToRegisterDropdown = document.getElementById('switchToRegisterDropdown');
  var switchToLoginDropdown = document.getElementById('switchToLoginDropdown');
  
  if (!userMenuToggle || !userMenuDropdown) {
    return; // Ha nincs profil dropdown az oldalon, kilépünk
  }
  
  var currentUser = JSON.parse(localStorage.getItem('currentUser'));
  var userInfoSection = document.getElementById('userInfoSection');
  var displayUsername = document.getElementById('displayUsername');
  var displayEmail = document.getElementById('displayEmail');
  var logoutBtn = document.getElementById('logoutBtn');
  var dropdownOpen = false;
  
  // Frissítjük a navbar linkeket a bejelentkezési állapot alapján
  function updateNavbarLinks() {
    var currentUser = JSON.parse(localStorage.getItem('currentUser'));
    var receptjeimNavItem = document.getElementById('receptjeimNavItem');
    var adminNavItem = document.getElementById('adminNavItem');
    
    if (receptjeimNavItem) {
      if (currentUser) {
        receptjeimNavItem.style.display = 'block';
      } else {
        receptjeimNavItem.style.display = 'none';
      }
    }

    if (adminNavItem) {
      if (currentUser && currentUser.role === 'admin') {
        adminNavItem.style.display = 'block';
      } else {
        adminNavItem.style.display = 'none';
      }
    }
  }
  
  // Frissítjük a profil információkat, ha be van jelentkezve
  function updateUserMenu() {
    currentUser = JSON.parse(localStorage.getItem('currentUser'));
    if (currentUser && !currentUser.token) {
      localStorage.removeItem('currentUser');
      currentUser = null;
    }
    var adminPanelButton = document.getElementById('adminPanelButton');

    // Profilkép megjelenítése a navbar gombon – bejelentkezésig vagy kijelentkezésig
    var toggleImgEl = userMenuToggle ? userMenuToggle.querySelector('img') : null;
    if (toggleImgEl) {
      var storedPreview = sessionStorage.getItem('profilKepElonezet');
      if (currentUser && currentUser.profilKep) {
        toggleImgEl.src = currentUser.profilKep;
        toggleImgEl.alt = currentUser.username || 'Profil';
      } else if (storedPreview) {
        toggleImgEl.src = storedPreview;
        toggleImgEl.alt = 'Profilkép';
      } else {
        toggleImgEl.src = (toggleImgEl.dataset && toggleImgEl.dataset.defaultSrc) || '../kepek/profil.png';
        toggleImgEl.alt = 'Profil';
      }
    }

    // Profilkép megjelenítése a dropdown profil szekcióban
    var userProfilKepEl = document.getElementById('userProfilKep');
    if (userInfoSection) {
      if (!userProfilKepEl) {
        userProfilKepEl = document.createElement('img');
        userProfilKepEl.id = 'userProfilKep';
        userProfilKepEl.className = 'rounded-circle mb-2';
        userProfilKepEl.style.cssText = 'width:48px;height:48px;object-fit:cover;display:block;';
        userProfilKepEl.alt = 'Profilkép';
        var userInfo = document.getElementById('userInfo');
        if (userInfo) userInfo.insertBefore(userProfilKepEl, userInfo.firstChild);
      }
      if (currentUser && currentUser.profilKep) {
        userProfilKepEl.src = currentUser.profilKep;
        userProfilKepEl.style.display = 'block';
      } else if (userProfilKepEl) {
        userProfilKepEl.style.display = 'none';
      }
    }
    
    if (currentUser && userInfoSection) {
      if (displayUsername) displayUsername.textContent = currentUser.username;
      if (displayEmail) displayEmail.textContent = currentUser.email;
      userInfoSection.style.display = 'block';
      if (loginSection) loginSection.style.display = 'none';
      if (registerSection) registerSection.style.display = 'none';
    } else {
      if (userInfoSection) userInfoSection.style.display = 'none';
      if (loginSection && registerSection) {
        loginSection.style.display = 'block';
        registerSection.style.display = 'none';
      }
    }
    
    if (adminPanelButton) {
      if (currentUser && currentUser.role === 'admin') {
        adminPanelButton.style.display = 'block';
      } else {
        adminPanelButton.style.display = 'none';
      }
    }
    
    updateNavbarLinks();
  }
  
  // Kijelentkezés gomb kezelése – profilkép előnézet törlése
  if (logoutBtn) {
    logoutBtn.addEventListener('click', function() {
      if (confirm('Biztosan ki szeretnél jelentkezni?')) {
        localStorage.removeItem('currentUser');
        sessionStorage.removeItem('profilKepElonezet');
        updateUserMenu();
        userMenuDropdown.style.display = 'none';
        window.location.reload();
      }
    });
  }
  
  // Kezdeti állapot beállítása
  updateUserMenu();
  
  // Toggle dropdown megjelenítése/elrejtése
  userMenuToggle.addEventListener('click', function(e) {
    e.stopPropagation();
    e.preventDefault();
    var isVisible = userMenuDropdown.style.display === 'block';
    userMenuDropdown.style.display = isVisible ? 'none' : 'block';
    dropdownOpen = !isVisible;
    
    if (!isVisible && userMenuToggle) {
      var toggleRect = userMenuToggle.getBoundingClientRect();
      userMenuDropdown.style.top = toggleRect.bottom + 8 + 'px';
      userMenuDropdown.style.right = (window.innerWidth - toggleRect.right) + 'px';
    }
    
    updateUserMenu();
  });
  
  // Váltás regisztrációra
  if (switchToRegisterDropdown && loginSection && registerSection) {
    switchToRegisterDropdown.addEventListener('click', function(e) {
      e.preventDefault();
      e.stopPropagation();
      loginSection.style.display = 'none';
      registerSection.style.display = 'block';
    });
  }
  
  // Váltás bejelentkezésre (profilikon visszaállítása)
  var defaultProfilSrc = '../kepek/profil.png';
  var toggleImg = userMenuToggle ? userMenuToggle.querySelector('img') : null;
  if (toggleImg && toggleImg.src && toggleImg.src.indexOf('profil.png') !== -1) {
    defaultProfilSrc = toggleImg.src;
  }

  if (switchToLoginDropdown && loginSection && registerSection) {
    switchToLoginDropdown.addEventListener('click', function(e) {
      e.preventDefault();
      e.stopPropagation();
      registerSection.style.display = 'none';
      loginSection.style.display = 'block';
      var pkInput = document.getElementById('registerProfilKepDropdown');
      if (pkInput) pkInput.value = '';
    });
  }

  // Profilkép előnézet – kiválasztáskor mentjük, addig látszik amíg ki nem jelentkezik
  var registerProfilKepInput = document.getElementById('registerProfilKepDropdown');
  if (registerProfilKepInput && toggleImg) {
    registerProfilKepInput.addEventListener('change', function() {
      var file = this.files[0];
      if (file && file.size < 512000) {
        var r = new FileReader();
        r.onload = function(ev) {
          var dataUrl = ev.target.result;
          sessionStorage.setItem('profilKepElonezet', dataUrl);
          toggleImg.src = dataUrl;
        };
        r.readAsDataURL(file);
      } else if (!file) {
        sessionStorage.removeItem('profilKepElonezet');
        toggleImg.src = defaultProfilSrc;
      } else {
        alert('A profilkép legfeljebb 500 KB lehet!');
        this.value = '';
      }
    });
  }
  
  // Bejelentkezés form kezelése
  var loginFormDropdown = document.getElementById('loginFormDropdown');
  var loginErrorMsg = document.getElementById('loginErrorMsg');
  
  if (loginFormDropdown) {
    loginFormDropdown.addEventListener('submit', function(e) {
      e.preventDefault();
      e.stopPropagation();
      
      var username = document.getElementById('loginUsernameDropdown').value;
      var password = document.getElementById('loginPasswordDropdown').value;
      
      if (!username || !password) {
        if (loginErrorMsg) {
          loginErrorMsg.textContent = 'Kérjük, töltsd ki az összes mezőt!';
          loginErrorMsg.classList.remove('d-none');
        }
        return;
      }

      if (loginErrorMsg) {
        loginErrorMsg.classList.add('d-none');
      }

      fetch('/api/login', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ username: username, password: password })
      })
      .then(function(resp) { return resp.json().then(function(d) { return { ok: resp.ok, data: d }; }); })
      .then(function(result) {
        if (!result.ok || !result.data || !result.data.success) {
          if (loginErrorMsg) {
            loginErrorMsg.textContent = 'Hibás felhasználónév vagy jelszó ❌';
            loginErrorMsg.classList.remove('d-none');
          }
          return;
        }
        if (result.data.user) {
          var user = result.data.user;
          if (!user.profilKep) {
            var storedPreview = sessionStorage.getItem('profilKepElonezet');
            if (storedPreview) user.profilKep = storedPreview;
          }
          localStorage.setItem('currentUser', JSON.stringify(user));
        }
        userMenuDropdown.style.display = 'none';
        loginFormDropdown.reset();
        window.location.href = 'receptjeim.html';
      })
      .catch(function() {
        if (loginErrorMsg) {
          loginErrorMsg.textContent = 'Nem sikerült kapcsolódni a szerverhez.';
          loginErrorMsg.classList.remove('d-none');
        }
      });
    });
  }
  
  // Regisztráció form kezelése
  var registerFormDropdown = document.getElementById('registerFormDropdown');
  
  if (registerFormDropdown) {
    registerFormDropdown.addEventListener('submit', function(e) {
      e.preventDefault();
      e.stopPropagation();
      
      var username = document.getElementById('registerUsernameDropdown').value;
      var email = document.getElementById('registerEmailDropdown').value;
      var password = document.getElementById('registerPasswordDropdown').value;
      var password2 = document.getElementById('registerPassword2Dropdown').value;
      var profilKepInput = document.getElementById('registerProfilKepDropdown');
      var profilKepFile = profilKepInput && profilKepInput.files[0];
      
      if (!username || !email || !password || !password2) {
        alert('Kérjük, töltsd ki az összes mezőt!');
        return;
      }
      
      if (password !== password2) {
        alert('A jelszavak nem egyeznek 😬');
        return;
      }
      
      if (password.length < 4) {
        alert('A jelszónak legalább 4 karakternek kell lennie!');
        return;
      }
      
      var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
      if (!emailRegex.test(email)) {
        alert('Kérjük, adj meg egy érvényes email címet!');
        return;
      }

      if (profilKepFile && profilKepFile.size >= 512000) {
        alert('A profilkép legfeljebb 500 KB lehet!');
        return;
      }

      function doRegister(profilKepBase64) {
        var body = { username: username, email: email, password: password };
        if (profilKepBase64 && profilKepBase64.length < 500000) body.profilKep = profilKepBase64;
        return fetch('/api/register', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify(body)
        });
      }

      function handleResult(result) {
        return result.json().then(function(d) { return { ok: result.ok, data: d }; });
      }

      function onSuccess(result) {
        if (!result.ok || !result.data || !result.data.success) {
          if (result.data && result.data.error === 'user_exists') {
            alert('Ez a felhasználónév vagy email már foglalt!');
          } else if (result.data && result.data.error === 'weak_password') {
            alert('A jelszónak legalább 4 karakternek kell lennie!');
          } else {
            alert('Hiba történt a regisztráció során.');
          }
          return;
        }
        alert('Sikeres regisztráció! Most már be tudsz jelentkezni. 🎉');
        registerFormDropdown.reset();
        loginSection.style.display = 'block';
        registerSection.style.display = 'none';
        if (document.getElementById('loginUsernameDropdown')) {
          document.getElementById('loginUsernameDropdown').value = username;
        }
      }

      if (profilKepFile && profilKepFile.size < 512000) {
        var reader = new FileReader();
        reader.onload = function(ev) {
          doRegister(ev.target.result).then(handleResult).then(onSuccess).catch(function() {
            alert('Nem sikerült kapcsolódni a szerverhez.');
          });
        };
        reader.readAsDataURL(profilKepFile);
      } else {
        doRegister(null).then(handleResult).then(onSuccess).catch(function() {
          alert('Nem sikerült kapcsolódni a szerverhez.');
        });
      }
    });
  }
  
  // Kattintás az oldalra - csak akkor zárjuk be, ha NEM a dropdown-on belül kattintanak
  setTimeout(function() {
    document.addEventListener('mousedown', function(e) {
      if (!dropdownOpen) return;
      
      var target = e.target;
      var clickedInDropdown = userMenuDropdown.contains(target);
      var clickedOnToggle = target === userMenuToggle || userMenuToggle.contains(target);
      
      var isInput = target.tagName === 'INPUT' || 
                    target.tagName === 'TEXTAREA' || 
                    target.tagName === 'SELECT' ||
                    target.tagName === 'LABEL' ||
                    target.tagName === 'BUTTON';
      
      var isInForm = target.closest('form') !== null;
      var isInDropdown = target.closest('.user-menu-dropdown') !== null;
      
      if (!clickedInDropdown && !clickedOnToggle && !isInput && !isInForm && !isInDropdown) {
        userMenuDropdown.style.display = 'none';
        dropdownOpen = false;
      }
    });
  }, 100);
  
  // Megakadályozzuk, hogy a dropdown-on belüli kattintások propagálódjanak
  if (userMenuDropdown) {
    userMenuDropdown.addEventListener('mousedown', function(e) {
      e.stopPropagation();
    });
    userMenuDropdown.addEventListener('click', function(e) {
      e.stopPropagation();
    });
    userMenuDropdown.addEventListener('focusin', function(e) {
      e.stopPropagation();
    });
  }
  
  // Input mezők eseménykezelői
  var inputs = userMenuDropdown.querySelectorAll('input, textarea, select, button, label');
  for (var i = 0; i < inputs.length; i++) {
    inputs[i].addEventListener('mousedown', function(e) {
      e.stopPropagation();
    });
    inputs[i].addEventListener('click', function(e) {
      e.stopPropagation();
    });
    inputs[i].addEventListener('focusin', function(e) {
      e.stopPropagation();
    });
  }
});
