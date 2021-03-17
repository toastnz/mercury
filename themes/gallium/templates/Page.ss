<!doctype html>
<html lang="en">
    <head>
        <% include Toast\Meta %>
    </head>

    <body class="$Classname $ClassNameForTemplate" <% if $GoogleMapsApiKey %>data-maps-api-key="$GoogleMapsApiKey" <% end_if %> data-classname="$Classname" data-title="$Title" data-url-segment="$URLSegment">

        <div class="body">
            <% include Toast\Header %>

            $Layout

            <% include Toast\Footer %>
        </div>

        <% require javascript("themes/gallium/dist/scripts/main.js") %>
    </body>
</html>