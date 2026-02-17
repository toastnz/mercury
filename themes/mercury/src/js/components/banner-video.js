import { $, $$, debounce } from '@/utilities/helpers';

// TODO: BUG - For some reason the first youube video doesn't want to load but subsquent videos do.

let vimeoScriptLoaded = false;
let youtubeScriptLoaded = false;

/**
 * Dynamically loads a script and executes a callback function once the script is loaded.
 *
 * @param {string} src - The source URL of the script to load.
 * @param {Function} [callback] - The callback function to execute once the script is loaded.
 */
const loadScript = (src, callback) => {
    const script = document.createElement('script');
    script.src = src;
    script.onload = () => callback && callback();
    document.body.appendChild(script);
};


/**
 * Loads the Vimeo API script if it hasn't been loaded already.
 * 
 * @param {Function} callback - A callback function to be executed once the Vimeo API script is loaded.
 */
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


/**
 * Loads the YouTube IFrame Player API script if it hasn't been loaded yet.
 * 
 * This function checks if the YouTube API script has already been loaded by 
 * verifying the `youtubeScriptLoaded` flag. If the script is not loaded, it 
 * dynamically loads the YouTube IFrame Player API script and sets the 
 * `youtubeScriptLoaded` flag to true once the script is successfully loaded.
 */
const loadYouTubeAPI = () => {
    if (!youtubeScriptLoaded) {
        loadScript('https://www.youtube.com/iframe_api', () => {
            youtubeScriptLoaded = true;
        });
    }
};


/**
 * Adjusts the size of video iframes within a banner to maintain a specific aspect ratio.
 * 
 * This function selects elements with the class `js-banner` and calculates their width and height.
 * It then iterates over all elements with the class `banner__iframe` and their child iframes,
 * adjusting their dimensions to maintain an aspect ratio of 16:9 (1920x1080).
 * 
 * If the banner's aspect ratio is less than 16:9, the height of the iframes is set to the banner's height,
 * and the width is adjusted accordingly. Otherwise, the width of the iframes is set to the banner's width,
 * and the height is adjusted accordingly.
 */
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


/**
 * Initializes banner videos on the page.
 * 
 * This function selects all elements with the class `js-banner-video` and sets up
 * YouTube or Vimeo players for each video based on the data attributes `data-id` and `data-service`.
 * 
 * - For YouTube videos, it loads the YouTube Iframe API and creates a new `YT.Player` instance.
 * - For Vimeo videos, it loads the Vimeo API and creates a new `Vimeo.Player` instance.
 * 
 * Each video iframe is assigned a unique ID based on its index, service, and video ID.
 * The video elements are made visible by setting their opacity to 1 after the player is initialized.
 */
const initializeVideos = () => {
    const $bannerVideos = $$('.js-banner-video');

    $bannerVideos.forEach(($bannerVideo, index) => {

        const video_id = $bannerVideo.getAttribute('data-id');
        const video_service = $bannerVideo.getAttribute('data-service');
        const $iframe = $bannerVideo.querySelector('.banner__iframe');

        if (!$iframe.id) $iframe.id = `video-${index}-${video_service}-${video_id}`;

        if (video_service === 'youtube') {
            loadYouTubeAPI();
            window.onYouTubeIframeAPIReady = () => {
                new YT.Player($iframe, {
                    videoId: video_id,
                    playerVars: {
                        autoplay: 1,
                        mute: 1,
                        controls: 0,
                        rel: 0,
                        modestbranding: 1,
                        loop: 1,
                        playlist: video_id
                    }
                });

                $bannerVideo.style.opacity = 1;

            };
        } else if (video_service === 'vimeo') {
            loadVimeoAPI(() => {
                new Vimeo.Player($iframe, {
                    id: video_id,
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

// Resize videos when the window is resized
resizeVideos();

// Debounce the resize event to improve performance
window.addEventListener('resize', debounce(resizeVideos, 100));