<%----------------------------------------------------------------
Video element
----------------------------------------------------------------%>

<div class="video-element [ element {$width} ]">
    <div class="video-element__wrap">

        <a href="#" class="video-element__thumbnail [ js-video-element ]" data-video-id="{$Video.VideoID}" data-video-source="$Video.Service.LowerCase" data-id="video-element--{$ID}">
            <% if $Thumbnail %>
                <img src="$Thumbnail.FocusFill(1920,1080).URL" width="1920" height="1080" loading="lazy">
            <% else %>
                <img src="$Video.ThumbnailURL" width="1920" height="1080" loading="lazy">
            <% end_if %>                
        </a>

        <div class="video-element__player" id="video-element--{$ID}"></div>

        <div class="video-element__icon">
            <svg xmlns="http://www.w3.org/2000/svg" height="100" width="100" xml:space="preserve"><path class="stroke-solid" fill="none" stroke="#fff" d="M49.9 2.5C23.6 2.8 2.1 24.4 2.5 50.4 2.9 76.5 24.7 98 50.3 97.5c26.4-.6 47.4-21.8 47.2-47.7-.2-26.1-21.8-47.5-47.6-47.3"/><path class="stroke-dotted" fill="none" stroke="#fff" d="M49.9 2.5C23.6 2.8 2.1 24.4 2.5 50.4 2.9 76.5 24.7 98 50.3 97.5c26.4-.6 47.4-21.8 47.2-47.7-.2-26.1-21.8-47.5-47.6-47.3"/><path class="icon" fill="#fff" d="M38 69c-1 .5-1.8 0-1.8-1.1V32.1c0-1.1.8-1.6 1.8-1.1l34 18c1 .5 1 1.4 0 1.9L38 69z"/></svg>
        </div>
        
    </div>
</div>
