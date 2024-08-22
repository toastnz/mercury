<!doctype html>
<html lang="en">

    <head>
        <% include Toast\Meta %>
    </head>

    <body class="$Classname">

        $Layout

        <% if $SiteConfig.FooterCodeInjection %>
            $SiteConfig.FooterCodeInjection
        <% end_if %>
        
    </body>

</html>