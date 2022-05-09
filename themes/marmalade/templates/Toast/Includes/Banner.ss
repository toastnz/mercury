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
    <div class="banner__wrap <% if $BannerSlides.count > 1 %>[ js-banner-slider ]<% end_if %>">

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
                    <div class="banner__wrap__item__content__inner [ js-in-view ]">
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