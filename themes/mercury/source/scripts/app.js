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
Shop 
------------------------------------------------------------------*/

import Shop from './components/shop';
import slick from 'slick-carousel';

$(() => {
    new Shop($('body'));

    let tick;
    let hovered = false;
    let percent = 0;

    const startProgressbar = () => {
        resetProgressbar();
        hovered = false;
        percent = 0;
        tick = setInterval(interval, 10);
    };

    const interval = () => {
        if (!hovered) percent += .19;
        $('.js-gallery-progress').css({ width: percent + "%" });
    };

    const resetProgressbar = () => {
        $('.js-gallery-progress').css({ width: 0 + '%' });
        clearInterval(tick);
    };

    $('.js-product-slider').hover(
        () => hovered = true,
        () => startProgressbar());

    $('.js-product-slider,.js-product-slider').hover(
        () => hovered = true,
        () => hovered = false, resetProgressbar());

    $('.js-product-slider').on('init', () => startProgressbar());

    $('.js-product-slider').on('beforeChange', () => startProgressbar());

    $('.js-choices').each((index, select) => {
        new Choices(select, {
            searchEnabled: false,
            itemSelectText: 'Select',
            searchPlaceholderValue: 'Type to search...'
        });
    });

    $('.js-product-slider').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        arrows: false,
        asNavFor: '.js-product-slider-navigation',
        autoplay: true,
        autoplaySpeed: 5000
    });

    $('.js-product-slider-navigation').slick({
        slidesToShow: $('.js-change-featured-image').length,
        slidesToScroll: 1,
        asNavFor: '.js-product-slider',
        dots: false,
        arrow: false,
        focusOnSelect: true,
        vertical: true
    });

});

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

import { attach } from '@meteora-digital/helpers';

console.log(attach); 

