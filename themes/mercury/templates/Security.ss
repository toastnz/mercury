<!doctype html>
<html lang="en">

    <head>
        <% include Toast\Meta %>
    </head>

    <body class="$Classname">
        <% if $SiteConfig.BodyCodeInjection %>
            $SiteConfig.BodyCodeInjection.RAW
        <% end_if %>

        $Layout

        <% if $SiteConfig.FooterCodeInjection %>
            $SiteConfig.FooterCodeInjection.RAW
        <% end_if %>
        
    </body>

</html>