/*------------------------------------------------------------------ 
Import styles
------------------------------------------------------------------*/

import './../styles/style.scss';  
 
import { $, $$ } from './lib' 

/*------------------------------------------------------------------
Import external
------------------------------------------------------------------*/

document.addEventListener('DOMContentLoaded', () => {

    /*------------------------------------------------------------------
    Accordion Elements
    ------------------------------------------------------------------*/
    if ($('.js-accordion-element')) {
        import('./components/accordion').then(module => {
            $$('.js-accordion-element').forEach(element => new module.Accordion(element));
        });
    }

    /*------------------------------------------------------------------
    Video Elements
    ------------------------------------------------------------------*/
    if ($('.js-video-element')) {
        import('./components/video').then(module => {
            $$('.js-video-element').forEach(element => new module.Video(element));
        });
    }

    /*------------------------------------------------------------------
    Post Load classname removal
    ------------------------------------------------------------------*/

    $$('.js-postload').forEach(element => {
        element.classList.remove('js-postload');
    });


    /*------------------------------------------------------------------
    Sticky header  
    ------------------------------------------------------------------*/

    let previousScrollPosition = 0;
    let scrollDelta = 5;
    let header = $('.header');
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

});

