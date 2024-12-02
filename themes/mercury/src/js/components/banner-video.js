import { $, $$, debounce } from '@/utilities/helpers';

let vimeoScriptLoaded = false;
let youtubeScriptLoaded = false;

const loadScript = (src, callback) => {
    const script = document.createElement('script');
    script.src = src;
    script.onload = () => callback && callback();
    document.body.appendChild(script);
};

const loadVimeoAPI = (callback) => {
    if (!vimeoScriptLoaded) {
        loadScript('https://player.vimeo.com/api/player.js', () => {
            vimeoScriptLoaded = true;
            callback && callback();
        });
    } else {
        callback && callback();
    }
};

const loadYouTubeAPI = () => {
    if (!youtubeScriptLoaded) {
        loadScript('https://www.youtube.com/iframe_api', () => {
            youtubeScriptLoaded = true;
        });
    }
};

const resizeVideos = () => {
    const $banner = $('.js-banner');
    const ASPECT_RATIO = 1920 / 1080;
    const bannerWidth = $banner.clientWidth;
    const bannerHeight = $banner.clientHeight;

    $$('.banner__iframe, .banner__iframe iframe').forEach(($iframe) => {
        if (bannerWidth / bannerHeight < ASPECT_RATIO) {
            $iframe.style.height = `${bannerHeight}px`;
            $iframe.style.width = `${bannerHeight * ASPECT_RATIO}px`;
        } else {
            $iframe.style.height = `${bannerWidth / ASPECT_RATIO}px`;
            $iframe.style.width = `${bannerWidth}px`;
        }
    });
};

const initializeVideos = () => {
    const $bannerVideos = $$('.js-banner-video');

    $bannerVideos.forEach(($bannerVideo, index) => {
        const videoId = $bannerVideo.getAttribute('data-id');
        const videoService = $bannerVideo.getAttribute('data-service');
        const $iframe = $bannerVideo.querySelector('.banner__iframe');

        if (!$iframe.id) {
            $iframe.id = `video-${index}-${videoService}-${videoId}`;
        }

        if (videoService === 'youtube') {
            loadYouTubeAPI();
            window.onYouTubeIframeAPIReady = () => {
                new YT.Player($iframe, {
                    videoId: videoId,
                    playerVars: {
                        autoplay: 1,
                        mute: 1,
                        controls: 0,
                        rel: 0,
                        modestbranding: 1,
                        loop: 1,
                        playlist: videoId
                    }
                });
                $bannerVideo.style.opacity = 1;
            };
        } else if (videoService === 'vimeo') {
            loadVimeoAPI(() => {
                new Vimeo.Player($iframe, {
                    id: videoId,
                    autoplay: true,
                    muted: true,
                    controls: false,
                    loop: true
                });
                $bannerVideo.style.opacity = 1;
            });
        }
    });
};

// Initialize videos and resize on window resize
initializeVideos();
resizeVideos();

window.addEventListener('resize', debounce(resizeVideos, 100));