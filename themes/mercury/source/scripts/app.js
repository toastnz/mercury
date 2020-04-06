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

/*------------------------------------------------------------------
Import external
------------------------------------------------------------------*/

import $ from 'jquery';
import Choices from 'choices.js';

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

$(function () {
    $('select.dropdown').each((index, select) => {
        new Choices(select, {
            itemSelectText: 'Select',
            searchPlaceholderValue: 'Type to search...'
        });
    });
});
