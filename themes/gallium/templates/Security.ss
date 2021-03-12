<!doctype html>
<html lang="en">
    <head>
        <% include Toast\Meta %>
    </head>

    <body class="$Classname" <% if $GoogleMapsApiKey %>data-maps-api-key="$GoogleMapsApiKey" <% end_if %> data-classname="$Classname" data-title="$Title" data-url-segment="$URLSegment">
        $Layout

        <% require javascript("themes/mercury/dist/scripts/main.js") %>
    </body>
</html>