<%-- --------------------------------------------------------------
Meta
-------------------------------------------------------------- --%>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge">


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
Google tracking
-------------------------------------------------------------- --%>
<% if not $getDoNotTrack %>
    <% if $SiteConfig.GoogleAnalytics %>
        <!-- Global site tag (gtag.js) - Google Analytics -->
        <script async src="https://www.googletagmanager.com/gtag/js?id={$SiteConfig.GoogleAnalytics}"></script>
        <script>
            window.dataLayer = window.dataLayer || [];
            function gtag(){dataLayer.push(arguments);}
            gtag('js', new Date());

            gtag('config', '{$SiteConfig.GoogleAnalytics}');
        </script>
    <% end_if %>
<% else %>
    <script>
        // Avoid any errors
        window.dataLayer = [];
    </script>
<% end_if %>

<%-- --------------------------------------------------------------
Bugherd
-------------------------------------------------------------- --%>

<% if $SiteConfig.BugherdProjectKey %>
    <script type='text/javascript'>
        (function (d, t) {
            var bh  = d.createElement(t), s = d.getElementsByTagName(t)[0];
            bh.type = 'text/javascript';
            bh.src  = 'https://www.bugherd.com/sidebarv2.js?apikey={$SiteConfig.BugherdProjectKey}';
            s.parentNode.insertBefore(bh, s);
        })(document, 'script');
    </script>
<% end_if %>


<%-- --------------------------------------------------------------
Styles
-------------------------------------------------------------- --%>

<link rel="dns-prefetch" href="//fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<% require css("themes/mercury/dist/styles/main.css") %>

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


<%-- --------------------------------------------------------------
Head code injection
-------------------------------------------------------------- --%>

<% if $SiteConfig.HeadCodeInjection %>
    $SiteConfig.HeadCodeInjection
<% end_if %>