<!doctype html>
<html lang="en">

    <head>
       <% include Toast\Meta %>
    </head>

    <body class="$Classname ">
        <% if $SiteConfig.BodyCodeInjection %>
            $SiteConfig.BodyCodeInjection.RAW
        <% end_if %>

        <%---------------------------------------------- 
        Show popup
        -------------------------------------------- --%>

        <% if $Siteconfig.ShowPopup %>
            <% include Toast\Includes\Popup %>
        <% end_if %>

        
        <% include Toast\Header %>

        $Layout

        <% include Toast\Footer %>

        <%-- --------------------------------------------------------------
        Footer code injection
        -------------------------------------------------------------- --%>

        <% if $SiteConfig.FooterCodeInjection %>
            $SiteConfig.FooterCodeInjection.RAW
        <% end_if %>

    </body>

</html>