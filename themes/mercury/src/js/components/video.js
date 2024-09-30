/**
 * Video class for managing YouTube and Vimeo video players.
 * 
 * This class handles video initialization, player creation, event listeners, 
 * and interactions for YouTube and Vimeo videos embedded in a webpage.
 */
export class Video {

    /**
     * Constructor for the Video class.
     * 
     * Initializes the video player by detecting the source (YouTube or Vimeo),
     * loading the necessary API scripts, and attaching event listeners.
     * 
     * @param {HTMLElement} element - The HTML element representing the video.
     */
    constructor(element) {
        this.video = element;
        this.video_id = this.video.dataset.videoId;
        this.video_element = this.video.dataset.id;
        this.video_source = this.video.dataset.videoSource;
        window.loaded_scripts = window.loaded_scripts || [];
        this.script_src = (this.video_source === 'youtube')
            ? 'https://www.youtube.com/iframe_api'
            : 'https://player.vimeo.com/api/player.js';

        // Initialize the video setup
        this.init();
    }

    /**
     * Initialize the video player.
     * 
     * Loads necessary scripts based on the video source and sets up event listeners.
     */
    init() {
        this.loadScripts();
        this.addEventListeners();
    }

    /**
     * Add event listeners to handle video interaction.
     * 
     * A click event listener is attached to trigger video creation and play.
     */
    addEventListeners() {
        this.video.addEventListener('click', (event) => {
            event.preventDefault();
            this.create();
        });
    }

    /**
     * Load the required scripts (YouTube or Vimeo) if not already loaded.
     * 
     * This ensures that the API script for the respective video service is 
     * only loaded once.
     */
    loadScripts() {
        if (window.loaded_scripts.includes(this.script_src)) return;

        window.loaded_scripts.push(this.script_src);
        let script = document.createElement('script');
        script.src = this.script_src;
        document.body.appendChild(script);
    }

    /**
     * Handle YouTube player 'onReady' event.
     * 
     * This method is called when the YouTube player is ready. It hides the 
     * thumbnail and starts playing the video.
     */
    onPlayerReady() {
        this.show();
        this.player.playVideo();
    }

    /**
     * Handle YouTube player state change event.
     * 
     * If the video has ended, this method resets the video to the start and pauses it,
     * while showing the thumbnail again.
     * 
     * @param {Object} event - The event object passed by the YouTube API.
     */
    onPlayerStateChange(event) {
        if (event.data == YT.PlayerState.ENDED) {
            this.player.seekTo(0);
            this.player.pauseVideo();
            this.hide();
        }
    }

    /**
     * Create the video player instance.
     * 
     * Depending on the video source (YouTube or Vimeo), this method either creates a new
     * player or plays the existing one.
     */
    create() {
        if (this.player) {
            this.play();
        } else {
            if (this.video_source === 'youtube') {
                this.player = new YT.Player(this.video_element, {
                    videoId: this.video_id,
                    events: {
                        onReady: this.onPlayerReady.bind(this),
                        onStateChange: this.onPlayerStateChange.bind(this)
                    }
                });
            } else if (this.video_source === 'vimeo') {
                this.player = new Vimeo.Player(this.video_element, {
                    id: this.video_id,
                    autopause: false
                });

                this.player.on('play', () => this.show());
                this.player.on('ended', () => this.hide());
                this.show();
                this.play();
            }
        }
    }

    /**
     * Play the video.
     * 
     * This method shows the video and hides the thumbnail, then plays the video
     * using the appropriate method depending on the video source.
     */
    play() {
        this.show();
        (this.video_source === 'youtube')
            ? this.player.playVideo()
            : this.player.play();
    }

    /**
     * Show the video and hide the thumbnail.
     * 
     * Adds the 'playing' class to the video element to display the video.
     */
    show() {
        this.video.classList.add('playing');
    }

    /**
     * Hide the video and show the thumbnail.
     * 
     * Removes the 'playing' class from the video element to hide the video.
     */
    hide() {
        this.video.classList.remove('playing');
    }
}
