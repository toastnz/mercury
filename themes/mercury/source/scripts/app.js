/*------------------------------------------------------------------
Import styles
------------------------------------------------------------------*/

import './../styles/style.scss';

/*------------------------------------------------------------------
Import modules
------------------------------------------------------------------*/

import './components/videoModal';
import './components/accordionBlock';
import './components/imageText';
import './components/tabbed';
import './components/inview';
import './components/mobileMenu';
import './components/search';
import './components/grid';
import './components/banner';

/*------------------------------------------------------------------
Import external
------------------------------------------------------------------*/

import $ from 'jquery';
import Selector from 'simple-selector'

$(() => {

    /*------------------------------------------------------------------
    Select elements
    ------------------------------------------------------------------*/

    $('select.dropdown').each((index, element) => {
        element.SS = new Selector(element, {
            placeholder: element.querySelector('option').innerText,
        });
    });

    /*------------------------------------------------------------------
    Sticky header  
    ------------------------------------------------------------------*/


    let didScroll;
    let lastScrollTop = 0;
    let delta = 5;
    let navbarHeight = $('.header').outerHeight() / 3;

    const hasScrolled = () => {
        var st = $(window).scrollTop();
        if (Math.abs(lastScrollTop - st) <= delta) return;
        if (st === 0) {
            $('.header').removeClass('nav-down').removeClass('nav-up');
        } else if (st > lastScrollTop && st > navbarHeight) {
            $('.header').removeClass('nav-down').addClass('nav-up');
        } else {
            if (st + $(window).height() < $(document).height()) {
                $('.header').removeClass('nav-up').addClass('nav-down');
            }
        }
        lastScrollTop = st;
    }

    window.addEventListener('scroll', () => { didScroll = true, $('body').removeClass('nav-open') });

    setInterval(() => { if (didScroll) hasScrolled(), didScroll = false; }, 250);



});
