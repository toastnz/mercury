<!-- -----------------------------------------------------------------
Footer
------------------------------------------------------------------ -->
<footer class="footer">
    <div class="footer__wrap">
    
        
        <div class="footer__wrap__column footer__wrap__column--1">
            <a href="{$BaseHref}" class="footer__wrap__column__logo" title="$SiteConfig.Title" >
                <% if $SiteConfig.Logo %>
                    <img src="$SiteConfig.Logo.URL" alt="$SiteConfig.Title" />
                <% else %>
                    $SVG('logo')
                <% end_if %>
            </a>
        </div>
        
        <div class="footer__wrap__column footer__wrap__column--2">
            <% loop $MenuSet('FooterLeft').MenuItems %>
                <p class="footer__wrap__column__item"><a href="$Link" class="footer__wrap__column__item__link"><strong>$MenuTitle.XML</strong></a></p>
            <% end_loop %>
        </div>

        <div class="footer__wrap__column footer__wrap__column--3">
            <% loop $MenuSet('FooterRight').MenuItems %>
                <p class="footer__wrap__column__item"><a href="$Link" class="footer__wrap__column__item__link"><strong>$MenuTitle.XML</strong></a></p>
            <% end_loop %>
        </div>
      
        <div class="footer__wrap__copyright">
            <p class="smaller">
                © $SiteConfig.Title {$Now.Year}. 
                <% if $SiteConfig.PrivacyLink  %>
                    <a $SiteConfig.PrivacyLink.TargetAttr href="$SiteConfig.PrivacyLink.LinkURL">$SiteConfig.PrivacyLink.Title.XML </a>
                <% end_if %>
                <% if $SiteConfig.TermsLink  %>
                    <a $SiteConfig.TermsLink.TargetAttr href="$SiteConfig.TermsLink.LinkURL">$SiteConfig.TermsLink.Title.XML </a><br>
                <% end_if %>
            </p>
        </div>
    </div>
</footer>