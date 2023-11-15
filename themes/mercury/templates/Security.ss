<!doctype html>
<html lang="en">

    <head>
        <% include Toast\Meta %>
    </head>

    <body class="$Classname">

        <% include Type %>

        <div class="type">

            $Layout

        </div>

        <% require javascript($ResourceURL('themes/mercury/dist/scripts/main.js')) %>

        <%-- --------------------------------------------------------------
        Footer code injection
        -------------------------------------------------------------- --%>

        <% if $SiteConfig.FooterCodeInjection %>
            $SiteConfig.FooterCodeInjection
        <% end_if %>
        
    </body>

</html>