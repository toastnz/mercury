export class Video {

    /**
     * 
     * Constructor
     * 
     * @param {element} element video parent
     */
    constructor(element) {

        this.video = element;
        this.player = undefined;
        this.video_id = this.video.dataset.videoId;
        this.video_source = this.video.dataset.videoSource;
        window.loaded_scripts = window.loaded_scripts || [];
        this.script_src = (this.video_source === 'youtube') ? 'https://www.youtube.com/iframe_api' : 'https://player.vimeo.com/api/player.js';
        this.video_element = this.video.dataset.id;

        // Initialise the video
        this.init();
    }


    /**
     * 
     * Initialise the video item
     * 
     */
    init() {

        // Load the scripts
        this.loadScripts();

        // Attach the event listeners
        this.addEventListeners();

    }


    /**
     * 
     * Add the click event handler to the video
     * 
     */
    addEventListeners() {
        this.video.addEventListener('click', () => this.create());
    }


    /**
     * 
     * Load the scripts if they have not already been loaded
     * 
     */
    loadScripts() {

        // If the script has already been loaded, return
        if (window.loaded_scripts.includes(this.script_src)) return;

        // Add the script to the loaded scripts array
        window.loaded_scripts.push(this.script_src);

        // Create the script tag
        let script = document.createElement('script');

        // Set the script source
        script.src = this.script_src;

        // Append the script to the body
        document.body.appendChild(script);

    }


    /**
     * 
     * Youtube on player ready event handler
     * 
     */
    onPlayerReady() {

        // Show the video and hide the thumbnail
        this.show();

        // Play the youtube video
        this.player.playVideo();

    }


    /**
     * 
     * Youytube Player play state event handler
     * 
     * @param {event} event
     */
    onPlayerStateChange(event) {
        if (event.data == YT.PlayerState.ENDED) {

            // Reset the video to the start
            this.player.seekTo(0)

            // Pause the video
            this.player.pauseVideo();

            // Hide the video and show the thumbnail
            this.hide();
        }
    }


    /**
     * 
     * Create the video player instance
     * 
     */
    create() {

        // If the pkayer has already been created, then just hit play
        if (this.player) {
            this.play();
        }
        // Otherwise we will need to create the player first
        else {

            // Youtube specific video createion
            if (this.video_source === 'youtube') {
                this.player = new YT.Player(this.video_element, {
                    videoId: this.video_id,
                    events: {
                        onReady: this.onPlayerReady.bind(this),
                        onStateChange: this.onPlayerStateChange.bind(this)
                    }
                });
            }

            // Vimeo specific video creation
            if (this.video_source === 'vimeo') {
                this.player = new Vimeo.Player(this.video_element, {
                    id: this.video_id,
                    autopause: false
                });

                // Attach the event listeners
                this.player.on('play', () => this.show());
                this.player.on('ended', () => this.hide());

                // Show the video and hide the thumbnail
                this.show();

                // Play the vimeo video
                this.play();
            }
        }
    }

    /**
     * 
     * Play the video instance
     * 
     */
    play() {
        (this.video_source === 'youtube') ? this.player.playVideo() : this.player.play();
    }


    /**
     * 
     * Show the video and hide the thumbnail
     * 
     */
    show() {
        this.video.classList.add('playing');
    }


    /**
     * 
     * Hide the video and show the thumbnail
     * 
     */
    hide() {
        this.video.classList.remove('playing');
    }


}

