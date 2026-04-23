var modal = document.getElementById('surveyModal');
var form = document.getElementById('surveyForm');
var skipBtn = document.getElementById('skipBtn');
var recipeGrid = document.getElementById('recipeGrid');
var resultMsg = document.getElementById('resultMsg');

var timeInput = document.getElementById('time');
if (timeInput) timeInput.focus();

if (skipBtn) {
  skipBtn.addEventListener('click', function() {
    if (modal) modal.style.display = 'none';
    if (resultMsg) {
      resultMsg.style.display = 'block';
      resultMsg.textContent = 'Kihagytad a kérdőívet — az összes recept megjelenik.';
    }
  });
}

if (form) {
  form.addEventListener('submit', function(e) {
    e.preventDefault();
    var maxTime = Number(document.getElementById('time').value) || 9999;
    var serves = Number(document.getElementById('serves').value) || 1;
    var meal = document.getElementById('meal').value;
    var checked = [];
    var inputs = document.querySelectorAll('#allergies input:checked');
    for (var i = 0; i < inputs.length; i++) {
      if (inputs[i].value !== 'none') checked.push(inputs[i].value);
    }
    var cards = recipeGrid ? Array.from(recipeGrid.querySelectorAll('.card')) : [];
    var visibleCount = 0;
    for (var j = 0; j < cards.length; j++) {
      var card = cards[j];
      var cardTime = Number(card.dataset.time) || 9999;
      var cardServes = Number(card.dataset.serves) || 1;
      var allergens = (card.dataset.allergens || '').split(',');
      var cardMeal = card.dataset.meal || '';
      var cardType = card.dataset.type || '';
      var ok = (cardTime <= maxTime) && (cardServes <= serves);
      for (var k = 0; k < checked.length; k++) {
        if (allergens.indexOf(checked[k]) !== -1) {
          ok = false;
          break;
        }
      }
      if (meal === 'proteindús' || meal === 'kalóriaszegény') {
        if (cardType !== meal) ok = false;
      } else {
        if (cardMeal !== meal) ok = false;
      }
      card.style.display = ok ? 'flex' : 'none';
      if (ok) visibleCount++;
    }
    if (modal) modal.style.display = 'none';
    if (resultMsg) {
      resultMsg.style.display = 'block';
      resultMsg.textContent = visibleCount === 0 
        ? 'Sajnos nincs pontos találat — próbálj meg több időt, kevesebb allérgiát vagy hagyd ki a szűkítő kritériumot.'
        : 'Találatok: ' + visibleCount + ' recept. Görgess le a javaslatokhoz!';
    }
  });
}

function closeModal() {
  if (modal) modal.style.display = 'none';
}

document.addEventListener('keydown', function(e) {
  if (e.key === 'Escape') closeModal();
});

var allergyMap = {
  'tojás': ['Tükörtojás avokádóval-pirítóssal', 'Gombás tojásrántotta', 'Palacsinta friss gyümölcsökkel', 'Tojásos avokádó tál', 'Toast avokádóval és tojással'],
  'tej': ['Túrós gyümölcsös tál', 'Görög joghurtos magvak mézzel', 'Joghurt müzlivel és gyümölcsökkel', 'Joghurt granolával', 'Sült alma fahéjjal és joghurttal', 'Almás joghurt mézzel és fahéjjal'],
  'gluten': ['Palacsinta friss gyümölcsökkel', 'Túró strudel', 'Toast avokádóval és tojással', 'Sonkás-sajtos szendvics', 'Sajtos sonkás szendvics'],
  'nuts': ['Görög joghurtos magvak mézzel', 'Alma mandulával és mézzel', 'Granola gyümölccsel és joghurttal'],
  'egg': ['Tükörtojás avokádóval-pirítóssal', 'Gombás tojásrántotta', 'Palacsinta friss gyümölcsökkel', 'Tojásos avokádó tál', 'Toast avokádóval és tojással']
};

function renderRecipes(recipes) {
  var grid = document.getElementById('recipeGrid');
  if (!grid || !recipes || recipes.length === 0) return;
  grid.innerHTML = '';
  function slugify(s) {
    return String(s).toLowerCase().replace(/[^a-z0-9 -]+/g, '-').replace(/--+/g, '-').replace(/(^-|-$)/g, '');
  }
  for (var i = 0; i < recipes.length; i++) {
    var r = recipes[i];
    var col = document.createElement('div');
    col.className = 'col-md-4';
    var card = document.createElement('div');
    card.className = 'card';
    var media = document.createElement('div');
    media.className = 'card-media';
    var img = document.createElement('img');
    img.className = 'card-img-top';
    img.src = r.image || '';
    img.alt = r.title || '';
    img.onerror = function() { this.style.background = '#e9ecef'; this.src = 'data:image/svg+xml,' + encodeURIComponent('<svg xmlns="http://www.w3.org/2000/svg" width="200" height="150" viewBox="0 0 200 150"><rect fill="#dee2e6" width="200" height="150"/><text fill="#6c757d" x="100" y="80" text-anchor="middle" font-size="14" font-family="sans-serif">Nincs kép</text></svg>'); };
    media.appendChild(img);
    var saveBtn = document.createElement('button');
    saveBtn.className = 'save-btn';
    saveBtn.setAttribute('aria-label', 'Mentés');
    saveBtn.dataset.id = slugify(r.title || '');
    saveBtn.dataset.recipeId = r.id || slugify(r.title || '');
    saveBtn.dataset.recipeTitle = r.title || '';
    
    // Ellenőrizzük, hogy már kedvelt-e ez a recept
    var currentUser = JSON.parse(localStorage.getItem('currentUser'));
    if (currentUser) {
      var favoriteRecipes = JSON.parse(localStorage.getItem('favoriteRecipes_' + currentUser.username)) || [];
      var recipeId = r.id || slugify(r.title || '');
      if (favoriteRecipes.indexOf(recipeId) !== -1) {
        saveBtn.textContent = '♥';
        saveBtn.classList.add('saved');
      } else {
        saveBtn.textContent = '♡';
      }
    } else {
      saveBtn.textContent = '♡';
    }
    
    // Event listener a szív gombhoz
    (function(recipe, btn) {
      btn.addEventListener('click', function(e) {
        e.stopPropagation();
        var currentUser = JSON.parse(localStorage.getItem('currentUser'));
        if (!currentUser) {
          alert('Kérjük, jelentkezz be a recept kedveléséhez!');
          return;
        }
        
        var favoriteRecipes = JSON.parse(localStorage.getItem('favoriteRecipes_' + currentUser.username)) || [];
        var recipeId = recipe.id || slugify(recipe.title || '');
        var index = favoriteRecipes.indexOf(recipeId);
        
        if (index === -1) {
          // Hozzáadjuk a kedvencekhez
          favoriteRecipes.push(recipeId);
          btn.textContent = '♥';
          btn.classList.add('saved');
        } else {
          // Eltávolítjuk a kedvencekből
          favoriteRecipes.splice(index, 1);
          btn.textContent = '♡';
          btn.classList.remove('saved');
        }
        
        localStorage.setItem('favoriteRecipes_' + currentUser.username, JSON.stringify(favoriteRecipes));
        
        // Szinkronizálás az adatbázissal
        fetch('/api/user/favorites', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
            'X-Auth-User': currentUser.id,
            'X-Auth-Token': currentUser.token
          },
          body: JSON.stringify({ favoriteRecipes: favoriteRecipes })
        }).catch(function(err) {
          console.error('Hiba a kedvelt receptek mentésekor:', err);
        });
      });
    })(r, saveBtn);
    
    media.appendChild(saveBtn);
    var preview = document.createElement('div');
    preview.className = 'preview';
    var pbtn = document.createElement('button');
    pbtn.className = 'btn btn-sm';
    pbtn.textContent = 'Megnézem';
    (function(recipe) {
      pbtn.addEventListener('click', function() {
        openRecipeModal(recipe);
      });
    })(r);
    preview.appendChild(pbtn);
    media.appendChild(preview);
    card.appendChild(media);
    // Adatattribútumok a card elemre a szűréshez
    card.dataset.id = slugify(r.title || '');
    if (r.time) card.dataset.time = r.time;
    if (r.meal) card.dataset.meal = r.meal;
    if (r.type) card.dataset.type = r.type;
    if (r.allergens) card.dataset.allergens = r.allergens;
    var body = document.createElement('div');
    body.className = 'card-body';
    body.dataset.id = slugify(r.title || '');
    var h5 = document.createElement('h5');
    h5.className = 'card-title';
    h5.textContent = r.title || '';
    body.appendChild(h5);
    var badgeWrap = document.createElement('div');
    badgeWrap.className = 'd-flex justify-content-center gap-2 mt-2 flex-wrap';
    var timeBadge = document.createElement('span');
    timeBadge.className = 'badge badge-soft';
    timeBadge.textContent = r.time ? ('⏱️ ' + r.time + ' min') : '';
    badgeWrap.appendChild(timeBadge);
    var typeBadge = document.createElement('span');
    typeBadge.className = 'badge badge-accent';
    if (r.type) typeBadge.textContent = r.type.charAt(0).toUpperCase() + r.type.slice(1);
    badgeWrap.appendChild(typeBadge);
    var mealBadge = document.createElement('span');
    mealBadge.className = 'badge badge-muted';
    if (r.meal) mealBadge.textContent = r.meal.charAt(0).toUpperCase() + r.meal.slice(1);
    badgeWrap.appendChild(mealBadge);
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
  }
  
  // Frissítjük a szív ikonokat a renderelés után
  setTimeout(function() {
    var currentUser = JSON.parse(localStorage.getItem('currentUser'));
    if (currentUser) {
      var favoriteRecipes = JSON.parse(localStorage.getItem('favoriteRecipes_' + currentUser.username)) || [];
      var saveButtons = document.querySelectorAll('.save-btn');
      
      for (var i = 0; i < saveButtons.length; i++) {
        var btn = saveButtons[i];
        var recipeId = btn.dataset.recipeId || btn.dataset.id;
        
        if (favoriteRecipes.indexOf(recipeId) !== -1) {
          btn.textContent = '♥';
          btn.classList.add('saved');
        }
      }
    }
  }, 100);
}

// Betöltjük az összes receptet az oldal betöltésekor
document.addEventListener('DOMContentLoaded', function() {
  fetch('/api/recipes')
    .then(function(response) {
      if (!response.ok) throw new Error('hiba');
      return response.json();
    })
    .then(function(recipes) {
      if (recipes && recipes.length > 0) {
        var dedup = [];
        var seen = {};
        for (var i = 0; i < recipes.length; i++) {
          var r = recipes[i];
          var key = (r.id != null ? 'id_' + r.id : '') || ('t_' + (r.title || '') + '|' + (r.time || '') + '|' + (r.meal || ''));
          if (!seen[key]) { seen[key] = true; dedup.push(r); }
        }
        renderRecipes(dedup);
        console.log('Betöltve: ' + dedup.length + ' recept az adatbázisból');
      } else {
        var grid = document.getElementById('recipeGrid');
        if (grid) grid.innerHTML = '<div class="col-12"><div class="alert alert-info">Jelenleg nincs elérhető recept az adatbázisban.</div></div>';
      }
    })
    .catch(function(error) {
      console.error('hiba:', error);
      var grid = document.getElementById('recipeGrid');
      if (grid) grid.innerHTML = '<div class="col-12"><p class="text-danger">Hiba történt a receptek betöltésekor. Frissítsd az oldalt.</p></div>';
    });
});

document.addEventListener('DOMContentLoaded', function() {
  var surveyForm = document.getElementById('surveyForm');
  var skipBtn = document.getElementById('skipBtn');
  var surveyModal = document.getElementById('surveyModal');
  if (skipBtn) {
    skipBtn.addEventListener('click', function() {
      var modal = bootstrap.Modal.getInstance(surveyModal);
      if (modal) modal.hide();
    });
  }
  if (surveyForm) {
    surveyForm.addEventListener('submit', function(e) {
      e.preventDefault();
      var timeInput = parseInt(document.getElementById('time').value) || 20;
      var mealInput = document.getElementById('meal').value;
      var allergiesChecked = [];
      var allergiesInputs = document.querySelectorAll('#allergies input[type="checkbox"]:checked');
      for (var i = 0; i < allergiesInputs.length; i++) {
        allergiesChecked.push(allergiesInputs[i].value);
      }
      fetch('/api/recipes')
        .then(function(response) {
          if (!response.ok) throw new Error('hiba');
          return response.json();
        })
        .then(function(allRecipes) {
          var seenIds = {};
          var uniq = [];
          for (var u = 0; u < allRecipes.length; u++) {
            var ru = allRecipes[u];
            var k = ru.id != null ? ru.id : ((ru.title || '') + '|' + (ru.time || '') + '|' + (ru.meal || ''));
            if (!seenIds[k]) { seenIds[k] = true; uniq.push(ru); }
          }
          allRecipes = uniq;
          var filtered = [];
          for (var j = 0; j < allRecipes.length; j++) {
            var recipe = allRecipes[j];
            var match = true;
            if (recipe.meal !== mealInput) match = false;
            if (parseInt(recipe.time) > timeInput) match = false;
            for (var k = 0; k < allergiesChecked.length; k++) {
              var allergen = allergiesChecked[k];
              if (allergen === 'none') continue;
              if (allergyMap[allergen] && allergyMap[allergen].indexOf(recipe.title) !== -1) {
                match = false;
                break;
              }
            }
            if (match) filtered.push(recipe);
          }
          var modal = bootstrap.Modal.getInstance(surveyModal);
          if (modal) modal.hide();
          var resultMsg = document.getElementById('resultMsg');
          if (resultMsg) {
            if (filtered.length === 0) {
              resultMsg.textContent = 'Sajnos nem találtunk olyan receptet, amely megfelel a kritériumaidnak.';
              resultMsg.className = 'alert alert-warning shadow-sm';
            } else {
              resultMsg.textContent = filtered.length + ' recept talált, amely megfelel az igényeidnek:';
              resultMsg.className = 'alert alert-success shadow-sm';
            }
            resultMsg.style.display = 'block';
          }
          renderRecipes(filtered);
          setTimeout(function() {
            var grid = document.getElementById('recipeGrid');
            if (grid) grid.scrollIntoView({ behavior: 'smooth', block: 'start' });
          }, 100);
        })
        .catch(function(error) {
          console.error('hiba:', error);
        });
    });
  }
});

document.addEventListener('DOMContentLoaded', function() {
  var themeToggle = document.getElementById('themeToggle');
  if (!themeToggle) return;
  var savedTheme = localStorage.getItem('theme');
  if (savedTheme === 'dark') {
    document.body.classList.add('dark-mode');
    themeToggle.setAttribute('aria-pressed', true);
    themeToggle.textContent = '☀️';
  }
  themeToggle.addEventListener('click', function() {
    document.body.classList.toggle('dark-mode');
    var isDarkMode = document.body.classList.contains('dark-mode');
    localStorage.setItem('theme', isDarkMode ? 'dark' : 'light');
    this.setAttribute('aria-pressed', isDarkMode);
    this.textContent = isDarkMode ? '☀️' : '🌙';
  });
});

document.addEventListener('DOMContentLoaded', function() {
  var loginForm = document.getElementById('loginForm');
  if (!loginForm) return;
  loginForm.addEventListener('submit', function(e) {
    e.preventDefault();
    var username = document.getElementById('username').value;
    var password = document.getElementById('password').value;
    if (username === 'admin' && password === 'password') {
      alert('Sikeres bejelentkezés!');
    } else {
      alert('Hibás felhasználónév vagy jelszó!');
    }
  });
});

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

// A profil menüt minden oldalon a userMenu.js kezeli.
