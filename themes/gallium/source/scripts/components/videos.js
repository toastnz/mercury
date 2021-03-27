/*------------------------------------------------------------------
Import External modules
------------------------------------------------------------------*/

import { objectAssign, each } from 'meteora';

/*------------------------------------------------------------------
Import Internal modules
------------------------------------------------------------------*/

import Modal from '../classes/modal';
import VideoEmbed from '../classes/video';

/*------------------------------------------------------------------
Video Modals
------------------------------------------------------------------*/

each('.js-video--modal', (link) => {
	const video = new VideoEmbed(link.getAttribute('data-video'));
	const videoModal = new Modal(video.render(), {
		class: 'video-modal',
	});
	
	link.addEventListener('click', (e) => {
		e.preventDefault();
		videoModal.open();
	});
});