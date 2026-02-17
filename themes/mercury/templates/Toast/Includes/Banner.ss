<% if $BannerSlides.count %>
    <div class="banner [ js-banner ] <% if $BannerSlides.count > 1 %>[ embla ] banner--slider [ js-embla-{$ID} ]<% end_if %> <% if $TransparentHeader %>has-transparent-header<% end_if %>">
    
        <% if $BannerSlides.count > 1 %>
            <button class="embla__prev" name="previous" aria-label="Slide left">
                <svg viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M12.75 16.2505L6.5 10.0005L12.75 3.75049" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                </svg>
            </button>
            <button class="embla__next" name="next" aria-label="Slide right">
                <svg viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M7.5 3.74121L13.75 9.99121L7.5 16.2412" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                </svg>
            </button>
            <b class="banner__count colour--white [ embla__count ]"></b>
            <div class="banner__dots [ embla__dots ]"></div>
        <% end_if %>

        <div class="banner__viewport [ embla__viewport ]">                
            <div class="banner__wrap [ embla__container ]">
                
                <% loop $BannerSlides.Sort('SortOrder') %>
                    <div class="banner__item [ embla__slide ]" data-position="{$Pos}">
                        <%-- Banner Background Image --%>
                        <% if $BackgroundImage %>
                            <link rel="preload" as="image" href="{$BackgroundImage.FocusFill(480,680).Convert('webp').URL}" />
                            <picture>
                                <source media="(max-width: 500px)" srcset="{$BackgroundImage.FocusFill(480,680).Convert('webp').URL}">
                                <source media="(min-width: 501px)" srcset="{$BackgroundImage.FocusFill(1900,600).Convert('webp').URL}">
                                <img loading="eager" 
                                class="banner__image"
                                alt="$BackgroundImage.AltText"
                                width="400" 
                                height="608" 
                                onerror="this.classList.add('broken')"  
                                src="{$BackgroundImage.FocusFill(480,680).Convert('webp').URL}">
                            </picture>
                        <% end_if %>
                        
                        <%-- Banner Background Video --%>
                        <% if $BannerVideo %>
                            <div 
                                class="banner__video [ js-banner-video ]" 
                                data-id="$BannerVideo.VideoID"
                                data-service="$BannerVideo.Service.LowerCase"
                            >
                                <div class="banner__iframe"></div>
                            </div>
                        <% end_if %>    
                    
                        <%-- Banner Overlay --%>
                        <% if $Overlay %>
                            <div class="banner__overlay"></div>
                        <% end_if %>    
                    
                        <%-- Banner Content --%>
                        <div class="banner__content">
                            <div class="banner__constraint">
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
    </div>
<% end_if %>

