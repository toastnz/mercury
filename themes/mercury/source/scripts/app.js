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
import './components/inview';

import $ from 'jquery';
/*------------------------------------------------------------------
Mouse animation
------------------------------------------------------------------*/

let $indicator = $('.js-indicator');
let $megaMenuToggle = $('.js-mega-menu-toggle');
let hoverTimeout;


$megaMenuToggle.hover(function () {
    clearTimeout(hoverTimeout);
    if (!$body.hasClass('mobile-navigation-visible')) {
        let $this = $(this);
        $indicator.addClass('active').css({ 'left': `${$this.position().left}px`, 'width': `${$this.outerWidth()}px` });
    }
}, function () {
    hoverTimeout = setTimeout(() => {
        $indicator.removeClass('active');
    }, 500);
});

let $body = $('body');

$body.on('click', '.js-toggle-menu', (e) => {
    e.preventDefault();
    $body.toggleClass('menuActive');
});
