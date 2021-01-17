<!-- --------------------------------------------------------------
Meta
-------------------------------------------------------------- -->

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- --------------------------------------------------------------
Base Tag
-------------------------------------------------------------- -->

<% base_tag %>

<!-- --------------------------------------------------------------
Meta tags
-------------------------------------------------------------- -->

$MetaTags('false')

<!-- --------------------------------------------------------------
Page Title
-------------------------------------------------------------- -->

<title>{$Title} | {$SiteConfig.Title}</title>

<!-- --------------------------------------------------------------
Found Tags
-------------------------------------------------------------- -->

$FoundTags

<!-- --------------------------------------------------------------
Favicons Template
-------------------------------------------------------------- -->

<% include Toast\Favicons %>

<!-- --------------------------------------------------------------
Google Tag manager
-------------------------------------------------------------- -->

<% if $SiteConfig.GoogleTagManagerID %>
    <script>(function (w, d, s, l, i) {
        w[l] = w[l] || [];
        w[l].push({
            'gtm.start': new Date().getTime(), event: 'gtm.js'
        });
        var f                          = d.getElementsByTagName(s)[0],
            j = d.createElement(s), dl = l != 'dataLayer' ? '&l=' + l : '';
        j.async                        = true;
        j.src                          =
                '//www.googletagmanager.com/gtm.js?id=' + i + dl;
        f.parentNode.insertBefore(j, f);
    })(window, document, 'script', 'dataLayer', '{$SiteConfig.GoogleTagManagerID}');</script>
<% end_if %>

<!-- --------------------------------------------------------------
Bugherd
-------------------------------------------------------------- -->

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

<!-- --------------------------------------------------------------
Google tracking
-------------------------------------------------------------- -->

<% if $SiteConfig.GoogleAnalytics %>
    <script>
        if (! (navigator.doNotTrack && navigator.doNotTrack == "1" || window.doNotTrack && window.doNotTrack == "1")) {
        (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r;
            i[r] = i[r] || function () {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date();
            a = s.createElement(o),
                    m = s.getElementsByTagName(o)[0];
            a.async = 1;
            a.src   = g;
            m.parentNode.insertBefore(a, m)
        })(window, document, 'script', 'https://www.google-analytics.com/analytics.js', 'ga');
        ga('create', '{$SiteConfig.GoogleAnalytics}', 'auto');
        ga('send', 'pageview');
        } else {
            console.warn('Google Analytics was blocked because Do Not Track is enabled.');
        }
    </script>

<% end_if %>

<!-- --------------------------------------------------------------
Styles
-------------------------------------------------------------- -->

<% require themedCSS("dist/styles/main.css") %>
