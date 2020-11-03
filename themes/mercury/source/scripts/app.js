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
import './components/grid';

/*------------------------------------------------------------------
Import external
------------------------------------------------------------------*/

import $ from 'jquery';
import Selector from 'simple-selector'


$(() => {
    
    /*------------------------------------------------------------------
    Menu toggle
    ------------------------------------------------------------------*/
    let $body = $('body');

    $body.on('click', '.js-toggle-menu', (e) => {
        e.preventDefault();
        $body.toggleClass('menuActive');
    });

    /*------------------------------------------------------------------
    Select elements
    ------------------------------------------------------------------*/

    $('select.dropdown').each((index, element) => {
        element.SS = new Selector(element, {
            placeholder: element.querySelector('option').innerText,
        });
    });
});
