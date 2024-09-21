// Dynamic Year in Footer
const yearSpan = document.getElementById('year');
yearSpan.textContent = new Date().getFullYear();

// Back to Top Button
const backToTopBtn = document.getElementById('backToTopBtn');

// Show/Hide Back to Top Button
window.onscroll = function() {
    if (document.body.scrollTop > 100 || document.documentElement.scrollTop > 100) {
        backToTopBtn.style.display = "block";
    } else {
        backToTopBtn.style.display = "none";
    }
};

// Scroll to Top when Button is Clicked
backToTopBtn.addEventListener('click', function() {
    window.scrollTo({ top: 0, behavior: 'smooth' });
});
