"use strict";
(self["webpackChunkmercury"] = self["webpackChunkmercury"] || []).push([["themes_mercury_source_scripts_components_video_js"],{

/***/ "./themes/mercury/source/scripts/components/video.js":
/*!***********************************************************!*\
  !*** ./themes/mercury/source/scripts/components/video.js ***!
  \***********************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   Video: () => (/* binding */ Video)
/* harmony export */ });
function _typeof(o) { "@babel/helpers - typeof"; return _typeof = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function (o) { return typeof o; } : function (o) { return o && "function" == typeof Symbol && o.constructor === Symbol && o !== Symbol.prototype ? "symbol" : typeof o; }, _typeof(o); }
function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }
function _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, _toPropertyKey(descriptor.key), descriptor); } }
function _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); Object.defineProperty(Constructor, "prototype", { writable: false }); return Constructor; }
function _toPropertyKey(arg) { var key = _toPrimitive(arg, "string"); return _typeof(key) === "symbol" ? key : String(key); }
function _toPrimitive(input, hint) { if (_typeof(input) !== "object" || input === null) return input; var prim = input[Symbol.toPrimitive]; if (prim !== undefined) { var res = prim.call(input, hint || "default"); if (_typeof(res) !== "object") return res; throw new TypeError("@@toPrimitive must return a primitive value."); } return (hint === "string" ? String : Number)(input); }
var Video = /*#__PURE__*/function () {
  /**
   * 
   * Constructor
   * 
   * @param {element} element video parent
   */
  function Video(element) {
    _classCallCheck(this, Video);
    this.video = element;
    this.player = undefined;
    this.video_id = this.video.dataset.videoId;
    this.video_source = this.video.dataset.videoSource;
    window.loaded_scripts = window.loaded_scripts || [];
    this.script_src = this.video_source === 'youtube' ? 'https://www.youtube.com/iframe_api' : 'https://player.vimeo.com/api/player.js';
    this.video_element = this.video.dataset.id;

    // Initialise the video
    this.init();
  }

  /**
   * 
   * Initialise the video item
   * 
   */
  _createClass(Video, [{
    key: "init",
    value: function init() {
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
  }, {
    key: "addEventListeners",
    value: function addEventListeners() {
      var _this = this;
      this.video.addEventListener('click', function () {
        return _this.create();
      });
    }

    /**
     * 
     * Load the scripts if they have not already been loaded
     * 
     */
  }, {
    key: "loadScripts",
    value: function loadScripts() {
      // If the script has already been loaded, return
      if (window.loaded_scripts.includes(this.script_src)) return;

      // Add the script to the loaded scripts array
      window.loaded_scripts.push(this.script_src);

      // Create the script tag
      var script = document.createElement('script');

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
  }, {
    key: "onPlayerReady",
    value: function onPlayerReady() {
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
  }, {
    key: "onPlayerStateChange",
    value: function onPlayerStateChange(event) {
      if (event.data == YT.PlayerState.ENDED) {
        // Reset the video to the start
        this.player.seekTo(0);

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
  }, {
    key: "create",
    value: function create() {
      var _this2 = this;
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
          this.player.on('play', function () {
            return _this2.show();
          });
          this.player.on('ended', function () {
            return _this2.hide();
          });

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
  }, {
    key: "play",
    value: function play() {
      this.video_source === 'youtube' ? this.player.playVideo() : this.player.play();
    }

    /**
     * 
     * Show the video and hide the thumbnail
     * 
     */
  }, {
    key: "show",
    value: function show() {
      this.video.classList.add('playing');
    }

    /**
     * 
     * Hide the video and show the thumbnail
     * 
     */
  }, {
    key: "hide",
    value: function hide() {
      this.video.classList.remove('playing');
    }
  }]);
  return Video;
}();

/***/ })

}]);
//# sourceMappingURL=themes_mercury_source_scripts_components_video_js.js.map