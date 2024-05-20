document.addEventListener("DOMContentLoaded", function () {
    setInterval(adjustMarginTop, 5);
});

function adjustMarginTop() {
  var firstHeight = document.querySelector(".navbar").offsetHeight;
  var secondHeight = document.querySelector(".account-detail").offsetHeight;
  var totalHeight = firstHeight + secondHeight;
  var maxHeight = window.innerHeight;
  var footerHeight = document.querySelector(".footer-container").offsetHeight;

  if ((totalHeight + footerHeight) < maxHeight) {
    var marginTop = maxHeight - totalHeight - footerHeight;
    document.querySelector(".footer-container").style.marginTop = marginTop + "px";
  } else {
    document.querySelector(".footer-container").style.marginTop = "0";
  }
}

document.addEventListener("click", function (event) {
    adjustMarginTop();
});

