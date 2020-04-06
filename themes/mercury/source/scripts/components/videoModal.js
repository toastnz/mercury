/*------------------------------------------------------------------
Imports
------------------------------------------------------------------*/

import tingle from 'tingle.js';
import $ from 'jquery';

/*------------------------------------------------------------------
Templates
------------------------------------------------------------------*/

/**
* Vimeo Template
*/
const vimeo = (id) =>
/*html*/`<iframe src="https://player.vimeo.com/video/${id}?title=0&byline=0&portrait=0&autoplay=1" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>`;


/**
* Youtube Template
*/
const youtube = (id) =>
/*html*/`<iframe width="560" height="315" src="https://www.youtube.com/embed/${id}?controls=0&autoplay=1&rel=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>`;

/**
* Youtube Template
*/
const closeIcon = () =>
/*html*/`<svg xmlns="http://www.w3.org/2000/svg" width="86" height="85" viewBox="0 0 86 85" class="svg-close"><polygon fill="none" stroke="#704C99" stroke-width="3.78" points="840 88.29 824.516 73 799.999 97.207 775.484 73 760 88.29 784.515 112.499 760 136.708 775.484 152 799.999 127.789 824.516 152 840 136.708 815.483 112.499" transform="translate(-757 -70)"></polygon></svg>`;


/** 
 * Video modal template
 * @param {*} id 
 * @param {*} type (defaults to youtube)
 */
const videoModalTemplate = (id, type = 'youtube') =>
/*html*/`<div class="modal__close">
            <a href="#" class="modal__close__icon [ js-close-modal ]">
            ${closeIcon()}
            </a>
         </div>
         <div class="modal">
            <div class="embed-container">
            ${(type === 'youtube') ? youtube(id) : vimeo(id)}
            </div>
         </div>`;


/*------------------------------------------------------------------
Variables
------------------------------------------------------------------*/

let $body = $('body');
let modal;

$body.on('click', '.js-video-modal', (e) => { 
    e.preventDefault();

    let $this = $(e.currentTarget);

    modal = new tingle.modal({ onClose() { modal.destroy() } });

    modal.setContent(videoModalTemplate($this.attr('data-video-id'), $this.attr('data-video-type')));

    modal.open();

});


$body.on('click', '.js-close-modal', (e) => {
    e.preventDefault();
    modal.close();
});