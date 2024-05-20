const themeToggle = document.getElementById("theme-toggle");

// Function to set the theme in localStorage
function setTheme(theme) {
  localStorage.setItem("theme", theme);
}

function setBackground() {
    // Toggle classes on other elements
  const navbar = document.querySelector(".navbar");
  navbar.classList.toggle("navbar-dark");
  navbar.classList.toggle("navbar-light");
  document.querySelectorAll(".navbar, .features-icons, .testimonials, .footer").forEach(element => {
    element.classList.toggle("bg-dark");
    element.classList.toggle("bg-light");
  });
}

function setIcon() {
  // Toggle icon and title
  const buttonIcon = themeToggle.querySelector("i");

  // themeToggle.classList.toggle("btn-outline-dark");
  // themeToggle.classList.toggle("btn-outline-light");
  buttonIcon.classList.toggle("bi-moon-fill");
  buttonIcon.classList.toggle("bi-brightness-high-fill");
  themeToggle.title = document.body.classList.contains("dark-theme") ? "Light Theme" : "Dark Theme";
}
function setOutline () {
  document.querySelectorAll(".btn").forEach((element) => {
    if (!element.classList.contains('remain-outline')) {
      element.classList.toggle("btn-outline-dark");
      element.classList.toggle("btn-outline-light");
    }
  });
}

// Function to apply the saved theme from localStorage
function applyTheme() {
  const savedTheme = localStorage.getItem("theme") || "light"; // Default to light theme if not saved
  document.body.classList.add(savedTheme + "-theme");
  if (savedTheme == "light") {
    document.body.classList.add(savedTheme + "-theme");
    document.body.classList.remove("dark-theme");
  } else {
    document.body.classList.add(savedTheme + "-theme");
    document.body.classList.remove("light-theme");
    
    setIcon();
    setBackground();
    setOutline();
  }
  
}

// Apply the saved theme on page load
applyTheme();

themeToggle.addEventListener("click", function () {
  document.body.classList.toggle("dark-theme");
  document.body.classList.toggle("light-theme");

  setBackground();
  setIcon();
  setOutline();

  // Save the current theme preference
  setTheme(document.body.classList.contains("dark-theme") ? "dark" : "light");
});
