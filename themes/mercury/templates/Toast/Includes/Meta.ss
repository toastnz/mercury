<%-- --------------------------------------------------------------
Meta
-------------------------------------------------------------- --%>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<%-- --------------------------------------------------------------
Base Tag
-------------------------------------------------------------- --%>

<% base_tag %>

<%-- --------------------------------------------------------------
Meta tags
-------------------------------------------------------------- --%>

$MetaTags('false')


<%-- --------------------------------------------------------------
Found Tags
-------------------------------------------------------------- --%>

$FoundTags

<%-- --------------------------------------------------------------
Favicons Template
-------------------------------------------------------------- --%>

$FaviconMetaTags

<%-- --------------------------------------------------------------
Fonts
-------------------------------------------------------------- --%>

<% include Toast/Fonts %>

<%-- --------------------------------------------------------------
Styles
-------------------------------------------------------------- --%>

<% if $IsDevHot %>
<script type="module" nonce="{$Nonce}" src="{$ViteBaseHref}/@vite/client"></script>
<script type="module" nonce="{$Nonce}" src="{$ViteBaseHref}/themes/mercury/src/js/main.js"></script>
<% if $URLSegment != 'home' %>
    <script type="module" nonce="{$Nonce}" src="{$ViteBaseHref}/themes/mercury/src/js/extended.js"></script>
<% end_if %>
<% end_if %>

<%-- --------------------------------------------------------------
Head code injection
-------------------------------------------------------------- --%>

<% if $SiteConfig.HeadCodeInjection %>
    $SiteConfig.HeadCodeInjection.RAW
<% end_if %>

<%-- --------------------------------------------------------------
Postload 
-------------------------------------------------------------- --%>

<style>
    html {
        font-size:10px;
        font-family: Verdana, sans-serif;
    }

    .js-postload {
        display: none;
    }
</style>

<script>
    // Remove a class on all elements to make them visible
    // This avoids a flash of unstyled content
    document.addEventListener('DOMContentLoaded', function () {

        // Find all elements with the class 'js-postload'
        var elements = document.querySelectorAll('.js-postload');

        // Loop through all elements and remove the class
        for (var i = 0; i < elements.length; i++) {
            elements[i].classList.remove('js-postload');
        }
    });
</script>


 <% include Toast\Includes\Fonts %> 

