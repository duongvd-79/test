function scaleOnHover(element, targetElement) {
    element.addEventListener("mouseover", function () {
        targetElement.style.transform = "scale(1.2)";
    });

    element.addEventListener("mouseout", function () {
        targetElement.style.transform = "scale(1)";
    });
}

const cpuIcon = document.getElementById("cpu-icon");
const gpuIcon = document.getElementById("gpu-icon");

cpuIcon.style.transform = "scale(0.8)";
gpuIcon.style.transform = "scale(0.8)";
scaleOnHover(cpuIcon, cpuIcon.querySelector(".features-icons-item"));
scaleOnHover(gpuIcon, gpuIcon.querySelector(".features-icons-item"));

function redirect(url) {
    window.location.href = url;
}
