<%-- <% if $BannerSlides.Count %>
    <% loop $BannerSlides %>
        <% if $BackgroundImage %>
            <div style="background-image:url({$BackgroundImage.URL}); background-position: $BackgroundImage.PercentageX% $BackgroundImage.PercentageY%;"></div>
        <% end_if %>

        <% if $BannerVideo %>
            $BannerVideo.IframeURL
        <% end_if %>

        <% if $Overlay %><% end_if %>

        <% if $Content %>
            $Content
        <% else %>
            $Title
        <% end_if %>
    <% end_loop %>
<% end_if %> --%>