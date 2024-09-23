// Validation du form
document.getElementById('transactionForm').addEventListener('submit', function (event) {
    resetErrors(); // pour réinitialiser les erreurs

    let hasError = false;
    const name = document.getElementById('name').value;
    const amount = document.getElementById('amount').value;

    // Validation du nom
    if (name === '') {
        showError('nameError', 'Veuillez entrer un nom et un prénom.');
        hasError = true;
    }

    // Validation du montant
    if (amount <= 0 || amount > 5000) {
        showError('amountError', 'Le montant doit être compris entre 1 et 5000€.');
        hasError = true;
    }

    // Si des erreurs existent, je vais empêcher la soumission du form
    if (hasError) {
        event.preventDefault();  // Empêcher la soumission si la validation échoue
    }

    // Si tout est correct, soumettre le formulaire

});

// Message de succes
document.getElementById("transactionForm").addEventListener("submit", function(event) {

    var successMessage = document.getElementById("successMessage");
    successMessage.style.display = "block";

    // Reset le form
    document.getElementById("transactionForm").reset();

    // Refresh la page après soumission
    successMessage.addEventListener("click", function() {
        location.reload(); // Refresh the page when the message is clicked
    });

    // Timeout de 3s
    setTimeout(function() {
        successMessage.style.display = "none";
    }, 3000); // Adjust the time as needed
});

// Erreurs
function resetErrors() {
    document.querySelectorAll('.error').forEach(function (error) {
        error.style.display = 'none';
    });
}

function showError(id, message) {
    const errorElement = document.getElementById(id);
    errorElement.textContent = message;
    errorElement.style.display = 'block';
}

// Pays, Etat & Ville
var config = {
    cUrl: 'https://api.countrystatecity.in/v1/countries',
    ckey: 'NHhvOEcyWk50N2Vna3VFTE00bFp3MjFKR0ZEOUhkZlg4RTk1MlJlaA=='
}


var countrySelect = document.querySelector('.country'),
    stateSelect = document.querySelector('.state'),
    citySelect = document.querySelector('.city')


function loadCountries() {

    let apiEndPoint = config.cUrl

    fetch(apiEndPoint, {headers: {"X-CSCAPI-KEY": config.ckey}})
    .then(Response => Response.json())
    .then(data => {
        // console.log(data);

        data.forEach(country => {
            const option = document.createElement('option')
            option.value = country.iso2
            option.textContent = country.name 
            countrySelect.appendChild(option)
        })
    })
    .catch(error => console.error('Error loading countries:', error))

    stateSelect.disabled = true
    citySelect.disabled = true
    stateSelect.style.pointerEvents = 'none'
    citySelect.style.pointerEvents = 'none'
}


function loadStates() {
    stateSelect.disabled = false
    citySelect.disabled = true
    stateSelect.style.pointerEvents = 'auto'
    citySelect.style.pointerEvents = 'none'

    const selectedCountryCode = countrySelect.value
    // console.log(selectedCountryCode);
    stateSelect.innerHTML = '<option value="">Select State</option>'; // Pour clear les etats existant ds le champ
    citySelect.innerHTML = '<option value="">Select City</option>';

    fetch(`${config.cUrl}/${selectedCountryCode}/states`, {headers: {"X-CSCAPI-KEY": config.ckey}})
    .then(response => response.json())
    .then(data => {
        // console.log(data);

        data.forEach(state => {
            const option = document.createElement('option')
            option.value = state.iso2
            option.textContent = state.name 
            stateSelect.appendChild(option)
        })
    })
    .catch(error => console.error('Error loading countries:', error))
}

function loadCities() {
    citySelect.disabled = false;
    citySelect.style.pointerEvents = 'auto';

    const selectedCountryCode = countrySelect.value;
    const selectedStateCode = stateSelect.value;

    citySelect.innerHTML = '<option selected>Selectionnez une ville</option>'; // Pour vider l'option

    // Récupération des villes selon le pays et l'état
    fetch(`${config.cUrl}/${selectedCountryCode}/states/${selectedStateCode}/cities`, {
        headers: { "X-CSCAPI-KEY": config.ckey }
    })
    .then(response => response.json())
    .then(data => {
        data.forEach(city => {
            const option = document.createElement('option');
            option.value = city.name;
            option.textContent = city.name;
            citySelect.appendChild(option);
        });
    })
}


window.onload = loadCountries
