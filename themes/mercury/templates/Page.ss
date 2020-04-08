<!doctype html>
<html lang="en">

    <head>
       <% include Toast\Meta %>
    </head>

    <body class="$Classname" <% if $SiteConfig.GoogleMapsApiKey %>data-maps-api-key="$SiteConfig.GoogleMapsApiKey" <% end_if %> data-classname="$Classname" data-title="$Title" data-url-segment="$URLSegment">

        <div class="tingle-content-wrapper">

            <% include Type %>

            <div class="type">
                
                <% include Toast\Header %>
                
                <div class="blur">
                    $Layout
                    <% include Toast\Footer %>
                </div>
                
            </div>

            <% if $SiteConfig.GoogleTagManagerID %>
                <noscript>
                    <iframe src="https://www.googletagmanager.com/ns.html?id={$SiteConfig.GoogleTagManagerID}" height="0" width="0" style="display:none;visibility:hidden"></iframe>
                </noscript>
            <% end_if %>

            <% require javascript("themes/mercury/dist/scripts/main.js") %>

        </div>

        <% include Toast\Grid %>

    </body>

</html>