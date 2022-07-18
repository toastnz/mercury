<!doctype html>
<html lang="en">

    <head>
       <% include Toast\Meta %>
    </head>

    <body class="$Classname ">

        
        <%-- -------------------------------------------- 
        Type settings (Module)
        -------------------------------------------- --%>
        <% include Type %>

        <div class="type">

            <%---------------------------------------------- 
            Show popup
            -------------------------------------------- --%>

            <% if $Siteconfig.ShowPopup %>
                <% include Toast\Includes\Popup %>
            <% end_if %>

            
            <% include Toast\Header %>

            $Layout

            <% include Toast\Footer %>

        </div>

        <% require javascript("themes/mercury/dist/scripts/main.js") %>

        <%-- --------------------------------------------------------------
        Footer code injection
        -------------------------------------------------------------- --%>

        <% if $SiteConfig.FooterCodeInjection %>
            $SiteConfig.FooterCodeInjection
        <% end_if %>

    </body>

</html>