/*------------------------------------------------------------------
Import styles
------------------------------------------------------------------*/

import './../styles/style.scss';

window.onload = () => {
    if ('serviceWorker' in navigator) {
        navigator.serviceWorker.register('./sw.js');
    }
}

/*------------------------------------------------------------------
Helpers
------------------------------------------------------------------*/

const query = document.querySelector.bind(document);
const queryAll = document.querySelectorAll.bind(document);

/*------------------------------------------------------------------
Import modules
------------------------------------------------------------------*/

import './components/imageText';
import './components/inview';
import './components/mobileMenu';
import './components/search';
import './components/grid';
import './components/banner';

/*------------------------------------------------------------------
Components
------------------------------------------------------------------*/

document.addEventListener('DOMContentLoaded', () => {
    if ([...queryAll('.js-video-modal')].length) import('./components/videoModal');
    if ([...queryAll('.js-accordion-trigger')].length) import('./components/accordionBlock');
    if ([...queryAll('.js-tabs')].length) import('./components/tabbed');
});

/*------------------------------------------------------------------
Import external
------------------------------------------------------------------*/


document.addEventListener('DOMContentLoaded', () => {

    /*------------------------------------------------------------------
    Sticky header  
    ------------------------------------------------------------------*/

    let previousScrollPosition = 0;
    let scrollDelta = 5;
    let header = query('.header');
    let headerHeight = (header) ? header.clientHeight / 3 : 0;

    const stickyHeader = () => {
        let st = window.scrollY;
        if (Math.abs(previousScrollPosition - st) <= scrollDelta) return;
        if (st === 0) {
            header.classList.remove('nav-down');
            header.classList.remove('nav-up');
        } else if (st > previousScrollPosition && st > headerHeight) {
            header.classList.remove('nav-down');
            header.classList.add('nav-up');
        } else {
            if (st + window.innerHeight < document.body.clientHeight) {
                header.classList.add('nav-down');
                header.classList.remove('nav-up');
            }
        }
        previousScrollPosition = st;
    }

    window.addEventListener('scroll', stickyHeader);




    [...queryAll('.js-hero-block')].forEach(heroBlock => {
        let speed = 7;
        let image = heroBlock.querySelector('.js-hero-block-image');
        let elementTop = heroBlock.getBoundingClientRect();
        window.addEventListener('scroll', () => {
            var scrolled = window.scrollY;
            var shiftDistance = (elementTop.top - scrolled) / speed;
            image.style.transform = `translate3d(0, ${shiftDistance}px, 0)`;
        });

    });

});

