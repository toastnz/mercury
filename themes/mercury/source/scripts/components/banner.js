
/*------------------------------------------------------------------
Banner Video
------------------------------------------------------------------*/
import $ from 'jquery';
import YouTubePlayer from 'youtube-player';
import slick from 'slick-carousel';

$(() => {

    let $body = $('body');

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
        let bw = $('.js-banner').outerWidth();
        let bh = $('.js-banner').outerHeight();
        let ratio = 1920 / 1080;
        if (bw / bh < ratio) {
            $('.js-banner-video').css({ height: bh, width: bh * ratio });
        } else {
            $('.js-banner-video').css({ height: bh * ratio, width: bw });
        }
    }

    if ($('#video-player').length) {
        let player = YouTubePlayer('video-player', {
            color: 'white',
            controls: 0,
            autoplay: 1,
            rel: 0,
            fs: 0,
            modestbranding: 1
        });
        player.loadVideoById($('.js-banner-video').attr('data-video-id'));
        player.mute();
        player.playVideo().then(() => { $('#video-player').css({ opacity: 1 }) });
        window.addEventListener('resize', throttle(resizeVideo, 100));
        resizeVideo();
        player.on('stateChange', (e) => { if (e.data == YT.PlayerState.ENDED) player.playVideo() });
    }

    if ($('.js-banner-slider').length) {
        $('.js-banner-slider').slick({
            slidesToShow: 1,
            slidesToScroll: 1,
            arrows: false,
            dots: true,
            autoplaySpeed: 5000,
            autoplay: true,
            customPaging() {
                return '<span></span>';
            },
        });
    }

});
