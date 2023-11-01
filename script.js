const navSlide = () => {
    const burger = document.querySelector('.burger');
	const nav = document.querySelector('.list_nav');
	const navLinks = document.querySelectorAll('.list_nav li');

    burger.addEventListener('click', () => {
		nav.classList.toggle('nav-active');

		navLinks.forEach((link, index) => {
			if (link.getElementsByClassName.animation) {
				link.getElementsByClassName.animation = ''
			} else {
				link.style.animation = `navLinkFade 0.5s ease forwards ${index / 7}s`; 
			}
		});	
	});
	
}

navSlide();