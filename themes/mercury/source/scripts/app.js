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

/*------------------------------------------------------------------
Import external
------------------------------------------------------------------*/

import $ from 'jquery';

/*------------------------------------------------------------------
Mouse animation
------------------------------------------------------------------*/

let $body = $('body');

$body.on('click', '.js-toggle-menu', (e) => {
    e.preventDefault();
    $body.toggleClass('menuActive');
});

