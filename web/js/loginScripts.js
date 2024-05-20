const signupPasswordInput = document.getElementById('passwordSignup');
const confirmPasswordInput = document.getElementById('confirmPasswordSignup');
const loginPasswordInput = document.getElementById('passwordLogin')
const submitButtonSignup = document.getElementById('submitButtonSignup');
const submitButtonLogin = document.getElementById('submitButtonLogin');
const passwordErrorSpan = document.getElementById('passwordErrorSignup');

confirmPasswordInput.addEventListener('keyup', function () {
  const password = signupPasswordInput.value;
  const confirmPassword = this.value;

  if (password === "") {
    // Handle empty password case
    submitButtonSignup.disabled = true;
    passwordErrorSpan.hidden = true;
  } else {
    // Handle non-empty password case
    if (password === confirmPassword) {
      submitButtonSignup.disabled = false;
      passwordErrorSpan.hidden = true; // Hide error message
    } else {
      submitButtonSignup.disabled = true;
      passwordErrorSpan.hidden = false; // Make error message visible
    }
  }
});

const userNameSignup = document.getElementById('emailAddressSignup');
const userNameLogin = document.getElementById('emailAddressLogin');
const userNameErrorSignup = document.getElementById('emailErrorSignup');
const userNameErrorLogin = document.getElementById('emailErrorLogin');

userNameLogin.addEventListener('focusout', function () {
  const emailAddressCheck = this.value;

  if (emailAddressCheck !== '') {
    userNameErrorLogin.hidden = true; // Hide error message
    submitButtonLogin.disabled = false;
  } else {
    userNameErrorLogin.hidden = false; // Show error message
    submitButtonLogin.disabled = true;
  }
});
userNameSignup.addEventListener('focusout', function () {
  const emailAddressCheck = this.value;

  if (emailAddressCheck !== '') {
    userNameErrorSignup.hidden = true; // Hide error message
    submitButtonSignup.disabled = false;
  } else {
    userNameErrorSignup.hidden = false; // Show error message
    submitButtonSignup.disabled = true;
  }
});

// Show password button
const showPwBtn = document.querySelector('.icon-1');
const showCfPwBtn = document.querySelector('.icon-2');
const showLoginPwBtn = document.querySelector('.icon-3');

showPwBtn.addEventListener('click', function () {
  showPwBtn.classList.toggle('bi-eye-fill');
  showPwBtn.classList.toggle('bi-eye-slash-fill');
  signupPasswordInput.type = signupPasswordInput.type === 'password' ? 'text' : 'password';
});
showCfPwBtn.addEventListener('click', function () {
  this.classList.toggle('bi-eye-fill');
  this.classList.toggle('bi-eye-slash-fill');
  confirmPasswordInput.type = confirmPasswordInput.type === 'password' ? 'text' : 'password';
});
showLoginPwBtn.addEventListener('click', function () {
  this.classList.toggle('bi-eye-fill');
  this.classList.toggle('bi-eye-slash-fill');
  loginPasswordInput.type = loginPasswordInput.type === 'password' ? 'text' : 'password';
});

// Change login/signup
const toSignup = document.getElementById('toSignup');
const toLogin = document.getElementById('toLogin');
const signupForm = document.getElementById('signupForm');
const loginForm = document.getElementById('loginForm');

toSignup.addEventListener('click', function() {
  signupForm.classList.toggle('hidden');
  loginForm.classList.toggle('hidden');
  loginForm.reset();
});
toLogin.addEventListener('click', function() {
  signupForm.classList.toggle('hidden');
  loginForm.classList.toggle('hidden');
  signupForm.reset();
});

window.addEventListener('load', function() {
  submitButtonLogin.click();
  // Use setTimeout to delay the execution of your code by .5 sec
  setTimeout(function() {
    // This code will run .5 sec after the page loads
    if (userNameLogin.value !== '' || loginPasswordInput !== '') {
      submitButtonLogin.disabled = false;
    }
  }, 500);
}, false);
