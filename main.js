
const body = document.querySelector('body');
const loginClose = document.querySelector('.login-close-btn');
const loginOpen = document.querySelector('.login-open');
const countryOpen = document.querySelector('.country-open');
const countryClose = document.querySelector('.country-close-btn');

loginOpen.addEventListener('click', function(){
	body.classList.add('open-login');
})
loginClose.addEventListener('click', function(){
	body.classList.remove('open-login');
})
countryOpen.addEventListener('click', function(){
	body.classList.add('open-country');
})
countryClose.addEventListener('click', function(){
	body.classList.remove('open-country');
})


/*---------------NAV-MODAL-----------------*/

const togglerOpen = document.querySelector('.toggler-open');
const navClose = document.querySelector('.nav-close');
togglerOpen.addEventListener('click', function(){
	body.classList.add('open-nav');
})
navClose.addEventListener('click', function(){
	body.classList.remove('open-nav');
})


const nafs = document.querySelectorAll('.naf');
nafs.forEach(function(naf){
	const btn = naf.querySelector('.naf-head')
	btn.addEventListener('click', function(){
        nafs.forEach(function(item){
        	if(item !== naf){
        		item.classList.remove('legal');
        	}
        })

		naf.classList.toggle('legal');
	})
})


/*==================HOTTEST-SLIDE=======================*/
/*const responsive = {
	0:{
		items:1
	},
	320:{
		items: 1
	},
	560:{
		items: 1
	},
	960:{
		items: 1
	}
}*/


function owlInitialize() {
   if ($(window).width() < 800) {
      $('.slide-inner').owlCarousel({
      	loop: true,
		autoplay: true,
		autoplayTimeout: 3000,
		dots: false,
		nav: false,
		responsive:{
        0:{
            items:1.2
        },
        600:{
            items:1.2
        },
        1000:{
            items:1
        }
    }
      });
   }else{
      $('.slide-inner').owlCarousel('destroy');
   }
}

$(document).ready(function(e) {
   owlInitialize();
});

$(window).resize(function() {
   owlInitialize();
});

/*==================END-OF-HOTTEST-SLIDE=======================*/


/*==================PREMIUM-SLIDE=======================*/

$('.premium-slide').owlCarousel({
    	loop: true,
		autoplay: true,
		autoplayTimeout: 3000,
		dots: false,
		nav: true,
		responsive: {
        0:{
            items:1.2
        },
        600:{
            items:1.2
        },
        1000:{
            items:3
        }
    }
});

/*==================END-OF-PREMIUM-SLIDE=======================*/


/*==================SELF-SERVICE-SLIDE=======================*/

$('.self-slide').owlCarousel({
    	loop: true,
		autoplay: true,
		autoplayTimeout: 3000,
		dots: false,
		nav: true,
		responsive: {
        0:{
            items:1.2
        },
        600:{
            items:1.2
        },
        1000:{
            items:4
        }
    }

});

/*==================END-OF-SELF-SERVICE-SLIDE=======================*/


/*==================INTERESTED-SLIDE=======================*/
function owlInitializ() {
   if ($(window).width() < 800) {
      $('.interest').owlCarousel({
      	loop: true,
		autoplay: true,
		autoplayTimeout: 3000,
		dots: false,
		nav: false,
		responsive:{
        0:{
            items:1.2
        },
        600:{
            items:1
        },
        1000:{
            items:1
        }
    }
      });
   }else{
      $('.interest').owlCarousel('destroy');
   }
}

$(document).ready(function(e) {
   owlInitializ();
});

$(window).resize(function() {
   owlInitializ();
});

/*==================END-OF-INTERESTED-SLIDE=======================*/

const navBar = document.querySelector('.navbar');
window.addEventListener('scroll', function(){
     let scrollTop = $(window).scrollTop();
	if(scrollTop > 50){
		navBar.classList.add('fixed-nav');
	}
	else{
		navBar.classList.remove('fixed-nav');
	}
}) 
	