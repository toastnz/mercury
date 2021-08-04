import $ from 'jquery';
import Selector from 'simple-selector'

/*------------------------------------------------------------------
Import styles
------------------------------------------------------------------*/

import './../styles/style.scss';

window.onload = () => {
    'use strict';

    if ('serviceWorker' in navigator) {
        navigator.serviceWorker.register('./sw.js');
    }
}

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
    if ($('.js-video-modal').length) import('./components/videoModal');
    if ($('.js-accordion-trigger').length) import('./components/accordionBlock');
    if ($('.js-tabs').length) import('./components/tabbed');
});

/*------------------------------------------------------------------
Import external
------------------------------------------------------------------*/


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
