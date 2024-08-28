console.log("\n%c Mercury 2.0.0", "color:#fff;font-size:12px; padding:0.45rem 0.75rem; margin: 0rem auto 1rem auto; font-family: Metropolis, Helvetica, sans-serif; border: 2px solid #0dd8d8; border-radius: 4px;font-weight: 100;background-size: cover;background-repeat: no-repeat;border: double 1px transparent;background-image: linear-gradient(#282828, #282828), radial-gradient(circle at top left, #DF542F, #F2BAAB);background-origin: border-box;background-clip: padding-box, border-box;")

/*------------------------------------------------------------------ 
Import styles
------------------------------------------------------------------*/

import '../styles/main.scss';

/*------------------------------------------------------------------ 
Import scripts
------------------------------------------------------------------*/

import { $, $$ } from '@/utilities/helpers';

/*------------------------------------------------------------------
Start the app
------------------------------------------------------------------*/

document.addEventListener('DOMContentLoaded', () => {

    /*------------------------------------------------------------------
    Accordion Elements
    ------------------------------------------------------------------*/


    if ($('.js-accordion-element')) {
        import('@/components/accordion').then(module => {
            $$('.js-accordion-element').forEach(element => new module.Accordion(element));
        });
    }


    /*------------------------------------------------------------------
    Video Elements
    ------------------------------------------------------------------*/

    if ($('.js-video-element')) {
        import('@/components/video').then(module => {
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

