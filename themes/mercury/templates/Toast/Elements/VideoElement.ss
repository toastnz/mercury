<%----------------------------------------------------------------
Video Block
----------------------------------------------------------------%>

<div class="video-block video-block--{$Width} video-block--{$ID}">
    <div class="video-block__constraint">
        <div class="video-block__constraint__player" id="video-block--{$ID}"></div>
        <div class="video-block__constraint__thumbnail" onclick="playVideo('{$Video.VideoID}','video-block--{$ID}')">
        
        <% if $ThumbnailID %>
            <img src="$Thumbnail.FocusFill(1920,1080).URL" width="1920" height="1080" loading="lazy">
        <% else %>
            <img src="$Video.ThumbnailURL" width="1920" height="1080" loading="lazy">
        <% end_if %>
                
            </div>
        <div class="video-block__constraint__icon">
            <svg xmlns="http://www.w3.org/2000/svg" height="100" width="100" xml:space="preserve"><path class="stroke-solid" fill="none" stroke="#fff" d="M49.9 2.5C23.6 2.8 2.1 24.4 2.5 50.4 2.9 76.5 24.7 98 50.3 97.5c26.4-.6 47.4-21.8 47.2-47.7-.2-26.1-21.8-47.5-47.6-47.3"/><path class="stroke-dotted" fill="none" stroke="#fff" d="M49.9 2.5C23.6 2.8 2.1 24.4 2.5 50.4 2.9 76.5 24.7 98 50.3 97.5c26.4-.6 47.4-21.8 47.2-47.7-.2-26.1-21.8-47.5-47.6-47.3"/><path class="icon" fill="#fff" d="M38 69c-1 .5-1.8 0-1.8-1.1V32.1c0-1.1.8-1.6 1.8-1.1l34 18c1 .5 1 1.4 0 1.9L38 69z"/></svg>
        </div>
    </div>
</div>

<script>
    /*------------------------------------------------------------------
    Load in the api async
    ------------------------------------------------------------------*/
    var tag = document.createElement('script');
    tag.src = "https://www.youtube.com/iframe_api";

    var firstScriptTag = document.getElementsByTagName('script')[0];
    firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

    /**
     * Play video on click
     * @param {object} event 
     */
     function onPlayerReady(event) {
        event.target.playVideo();
    }

    /**
     * Show and hide video frame on interaction
     * @param {object} event 
     */
    function onPlayerStateChange(event) {
        if (event.data == YT.PlayerState.ENDED) {
            player.seekTo(0)
            player.pauseVideo();
            var video =  document.getElementById('video-block--{$ID}');
            video.classList.remove('playing');
            video.style.opacity = 0;
            video.style.zIndex = '-1';
        }
    }

    /**
     * Play video functionality using the youtube iframe API
     * @param {string} youtube_id 
     * @param {string} element 
     */
    function playVideo(youtube_id, element){

        // Update the video elements' visibility
        var video =  document.getElementById(element);
        video.style.opacity = 1;
        video.style.zIndex = 3;
        video.classList.add('playing');
       
        // If user has watched the video before play again
        if (typeof player !== 'undefined') {
            player.playVideo();
        }

        // If user has yet to pay the video load up the iframe
        else {
            player = new YT.Player(element, {
                height: '1080',
                width: '1920',
                videoId: youtube_id,
                playerVars: {
                    'playsinline': 1
                },
                events: {
                    'onReady': onPlayerReady,
                    'onStateChange': onPlayerStateChange
                }
            });
        }
    }

</script> 