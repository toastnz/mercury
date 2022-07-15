<!-- -------------------------------------------- 
Banner
-------------------------------------------- -->


<div class="banner [ js-banner ] <% if $TransparentHeader %> hasTransparentHeader<% end_if %>">
    
    <!-- -------------------------------------------- 
    Progress bar
    -------------------------------------------- -->
    
    <div class="banner__progress">
        <div class="banner__progress__bar [ js-banner-progress ]"></div>
    </div>

    <!-- ----------------------------------------------------------------
    If more than one slide, let's make a slider
    ----------------------------------------------------------------- -->
    <div class="banner__wrap <% if $BannerSlides.count > 1 %>[ js-banner-slider-{$ID} ]<% end_if %>">

        <% loop $BannerSlides %>
    
            <div class="banner__wrap__item" data-position="{$Pos}">



                <!-- ----------------------------------------------------------------
                Banner Background Image
                ----------------------------------------------------------------- -->    
                <% if $BackgroundImage %>
                    <link rel="preload" href="$BackgroundImage.FocusFill(640,360).URL" as="image">
                    <img alt="$BackgroundImage.Title" width="640" height="360" src="$BackgroundImage.FocusFill(640,360).URL" srcset="$BackgroundImage.FocusFill(640,360).URL 640w, $BackgroundImage.FocusFill(1280,720).URL 1280w, $BackgroundImage.FocusFill(1920,1080).URL 1920w" class="banner__wrap__item__background">
                <% end_if %>

                <!-- ----------------------------------------------------------------
                Banner Background Video
                ----------------------------------------------------------------- -->    
                <% if $BannerVideo %>
                    <div class="banner__wrap__item__video [ js-banner-video ]" data-video-id="$BannerVideo.VideoID"><div id="video-player"></div></div>

                    <script>            
                    var throttle = function (callback, limit) {
                        var wait = false;
                        return function () {
                            if (!wait) {
                                callback.call();
                                wait = true;
                                setTimeout(function () { wait = false }, limit);
                            }
                        }
                    }

                    var resizeVideo = function () {
                        let bannerVideo = document.querySelector('.js-banner-video');
                        let banner = document.querySelector('.js-banner');
                        let bw = banner.clientWidth;
                        let bh = banner.clientHeight;
                        let ratio = 1920 / 1080;

                        console.log(bannerVideo);
                        if (bw / bh < ratio) {
                            bannerVideo.style.height = bh + 'px';
                            bannerVideo.style.width = bh * ratio + 'px';
                        } else {
                            bannerVideo.style.height = bh * ratio + 'px';
                            bannerVideo.style.width = bw + 'px';
                        }
                    }

                    var tag = document.createElement('script');
                    tag.src = "https://www.youtube.com/iframe_api";
                    var firstScriptTag = document.getElementsByTagName('script')[0];
                    firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

                    var player;

                    function onYouTubeIframeAPIReady() {
                        player = new YT.Player('video-player', {
                            color: 'white',
                            controls: 0,
                            videoId: '$BannerVideo.VideoID',
                            events: {
                              'onReady': onPlayerReady,
                              'onStateChange': onPlayerStateChange
                            }
                        });

                        function onPlayerReady(event) {
                            event.target.mute()
                            event.target.playVideo()
                        }

                        function onPlayerStateChange(event) {
                          if (event.data == YT.PlayerState.ENDED) {
                            setTimeout(player.playVideo(), 60);
                          }
                        }
                         
                        window.addEventListener('resize', throttle(resizeVideo, 100));
                        resizeVideo();
                    
                    }
                    
                </script>

                <% end_if %>    

                <!-- ----------------------------------------------------------------
                Banner Overlay
                ----------------------------------------------------------------- -->    
                <% if $Overlay %>
                    <div class="banner__wrap__item__overlay"></div>
                <% end_if %>    

                <!-- ----------------------------------------------------------------
                Banner Content
                ----------------------------------------------------------------- -->    
                <div class="banner__wrap__item__content">
                    <div class="banner__wrap__item__content__inner">
                    <% if $Content %>
                        $Content
                    <% else %>
                        <h1 class="colour--white">$Top.Title</h1>
                    <% end_if %>
                    </div>
                </div>

            </div>

        <% end_loop %>

    </div>
</div>


<% if $BannerSlides.count > 1 %>

<script defer async src="https://cdnjs.cloudflare.com/ajax/libs/tiny-slider/2.9.4/min/tiny-slider.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tiny-slider/2.9.4/tiny-slider.css" media="print" onload="this.media='all'">

<script>
document.addEventListener("DOMContentLoaded", function() {
    tns({
      container:".js-banner-slider-{$ID}" ,
      items: 1,
      mouseDrag: true,
      nav: true,
      controls: true,
      slideBy: 1,
      loop: true
    });
  });

</script>

<style> 
  .tns-slider {
      display: flex;
  }
</style>
<% end_if %>
