/*------------------------------------------------------------------
Import styles
------------------------------------------------------------------*/

import './../styles/style.scss';

/*------------------------------------------------------------------
Import modules
------------------------------------------------------------------*/

import Breakpoint from './classes/breakpoint';
import VideoEmbed from './classes/video'; 
import Accordion from './classes/accordion';
import AccordionGrid from './classes/accordion-grid';
import Filters from './classes/filters';
import FormValidation from './classes/validation';
import Uploader from './classes/uploader';
import PlaceholderLabels from './classes/placeholder-labels';
import ScrollLocker from './classes/scroll-locker';
import ScrollController from './classes/scroll-control';

/*------------------------------------------------------------------
Import external modules
------------------------------------------------------------------*/

import { attach, offset, nodeArray } from '@meteora-digital/helpers';
import Gallery from '@meteora-digital/gallery';
import Equalizer from '@meteora-digital/equalizer';
import Lazy from '@meteora-digital/lazy';
import Parallax from 'background-parallax';
import Selector from 'simple-selector';
import Bowser from "bowser";
import ScrollDir from "scrolldir";

/*------------------------------------------------------------------
Helpers
------------------------------------------------------------------*/

// browser detection
const html = document.querySelector('html');
window.browser = Bowser.getParser(window.navigator.userAgent).parsedResult;
html.classList.add(window.browser.browser.name.toLowerCase().replace(' ', ''));

ScrollDir();

window.ScrollLocker = new ScrollLocker(document.querySelector('.body'));
window.ScrollController = new ScrollController;

/*------------------------------------------------------------------
Import components
------------------------------------------------------------------*/

import './components/maps';
import './components/sliders';
import './components/macy-layouts';
import './components/videos';

/*------------------------------------------------------------------
Helpers
------------------------------------------------------------------*/

import each from './functions/each';

/*------------------------------------------------------------------
Global
------------------------------------------------------------------*/

window.addEventListener('DOMContentLoaded', (event) => {

  // lazy load images (default selector is [data-src])
  window.Lazy = new Lazy('[data-src]', 1.4);

  // equal heights
  each('[data-equalize]', (el) => el.Equalizer = new Equalizer(el));

  // dynamic breakpoints
  each('[data-breakpoint]', (el) => new Breakpoint(el));

  // gallery items
  each('.js-gallery', (el) => new Gallery(el, {
    autoplay: false,
  }));

  // parallax items (change height of image in css to control scale of parallax);
  each('[data-parallax]', (el) => {
    const parallax = new Parallax(el);
  });

  // scroll to links
  each('[data-scroll-to]', (link) => {
    const target = document.querySelector(link.getAttribute('data-scroll-to')) || false;

    if (target) {
	    link.addEventListener('click', (e) => {
	    	e.preventDefault();
	    	window.ScrollController.scrollTo(offset(target).y);
	    })
    } else {
    	console.warn(`There is no element in the DOM found: target = ${target}`);
    }
  });

  // background videos
  each('.js-background-video', (video) => {
    let embed = new VideoEmbed(video.getAttribute('data-video'), { mute: 1, loop: 1,});
    let iframe;

    if (window.innerWidth >= 1024) {
      video.innerHTML = embed.render();

      iframe = video.querySelector('iframe');

      attach(window, 'resize', () => {
        if (iframe.clientHeight < iframe.parentNode.clientHeight) {
          iframe.style.width = '100%';
          iframe.style.height = `${Math.round(iframe.clientWidth * 0.5625)}px`;
        }else {
          iframe.style.height = '100%';
          iframe.style.width = `${Math.round(iframe.clientHeight * 1.7777777778)}px`;
        }
      }, 500);
    }
  });

  // videos
  each('.js-video', (video) => {
    const embed = new VideoEmbed(video.getAttribute('data-video'), { autoplay: 1, mute: 1, loop: 1,});
    let iframe = null;

    video.addEventListener('click', (e) => {
      e.preventDefault();
      video.innerHTML = embed.render();
      iframe = video.querySelector('iframe');
      setTimeout(() => iframe.classList.add('playing'), 1000);
    });
  })

  // selectors
  each('.js-filter--select', (select) => {
    select.SimpleSelector = new Selector(select, {
      search: false,
    });
  });

  // accordions
  each('.js-accordion', (el) => new Accordion(el));

  // accordion grids
  each('.js-accordion-grid', (el) => new AccordionGrid(el));

  // uploads
  each('.js-form input[type="file"]', (el) => new Uploader(el, 'No file selected'));

  // filters
  each('.js-filter', (el) => new Filters(el), {
    success: (r) => {
      console.log(r);
    }
  });

  // form validation
  each('.js-form form', (form) => {
    const validation = new FormValidation(form);
    const message = form.querySelector('.message');
    const selects = nodeArray(form.querySelectorAll('select'));

    new PlaceholderLabels(form);

    selects.forEach((select) => select.SimpleSelector = new Selector(select));

    form.querySelector('[type="submit"]').addEventListener('click', (e) => {
      e.preventDefault();

      validation.submit((e) => {
        let response = JSON.parse(e);

        message.innerHTML = response.message;
        message.classList.add('success');
      });
    });
  });
});
