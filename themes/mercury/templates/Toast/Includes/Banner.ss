<%------------------------------------------------------------------
Banner
------------------------------------------------------------------%>
<div class="banner banner--generic">

    <%------------------------------------------------------------------
    Wrap
    ------------------------------------------------------------------%>
    <div class="banner__wrap">

        <%------------------------------------------------------------------
        Overlay
        ------------------------------------------------------------------%>

        <div class="bannerBG"></div>

        <% if $BannerImage %>
            <div class="bannerImage" style="background-image:url({$BannerImage.URL});	background-position: $BannerImage.PercentageX% $BannerImage.PercentageY%;"></div>
        <% end_if %>

        <%------------------------------------------------------------------
        Content
        ------------------------------------------------------------------%>

        <div class="banner__wrap__content">
            <div class="[ js-fade-up ]">
                <h1>$Title</h1>
                <div class="line"></div>
            </div>
        </div>

    </div>
</div>