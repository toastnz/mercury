
/*------------------------------------------------------------------
Helpers
------------------------------------------------------------------*/

const query = document.querySelector.bind(document);
const queryAll = document.querySelectorAll.bind(document);

/*------------------------------------------------------------------
Banner Video
------------------------------------------------------------------*/

import YouTubePlayer from 'youtube-player';
import Flickity from 'flickity';

let flkty;

const flickityOptions = {
    wrapAround: true,
    prevNextButtons: false
};

document.addEventListener('DOMContentLoaded', () => {

    const throttle = (callback, limit) => {
        var wait = false;
        return () => {
            if (!wait) {
                callback.call();
                wait = true;
                setTimeout(() => wait = false, limit);
            }
        }
    }

    const resizeVideo = () => {
        let bannerVideo = query('.js-banner-video');
        let banner = query('.js-banner');
        let bw = banner.clientWidth;
        let bh = banner.clientHeight;
        let ratio = 1920 / 1080;
        if (bw / bh < ratio) {
            bannerVideo.style.height = bh + 'px';
            bannerVideo.style.width = bh * ratio + 'px';
        } else {
            bannerVideo.style.height = bh * ratio + 'px';
            bannerVideo.style.width = bw + 'px';
        }
    }


    if (queryAll('#video-player').length) {
        let bannerVideo = query('.js-banner-video');

        let player = YouTubePlayer('video-player', {
            color: 'white',
            controls: 0,
            autoplay: 1,
            rel: 0,
            fs: 0,
            modestbranding: 1
        });

        player.loadVideoById(bannerVideo.dataset.videoId);
        player.mute();
        player.playVideo().then(() => { query('#video-player').style.opacity = 1 });
        window.addEventListener('resize', throttle(resizeVideo, 100));
        resizeVideo();
        player.on('stateChange', (e) => { if (e.data == YT.PlayerState.ENDED) player.playVideo() });
    }

    if (query('.js-banner-slider')) {
        flkty = new Flickity(query('.js-banner-slider'), flickityOptions);
    }

});
