<%-------------------------------------------------------%>
<%-- Bread Crumbs --%>
<%-------------------------------------------------------%>

<div class="breadCrumbs">
    <div class="breadCrumbs__wrap">
        <a href="{$BaseHref}" class="breadCrumbs__wrap__item breadCrumbs__wrap__item--icon"><svg
                xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 20 20">
                <path fill="#67809F" fill-rule="evenodd"
                    d="M17.7857371,9.43179644 L17.7857371,18 L10.8652796,18 L10.8652796,13.5881111 L9.13456307,13.5881111 L9.13456307,18 L2.21410554,18 L2.21410554,9.42925552 L2.06244387,9.550015 L1,8.15714459 L10.0178557,1 L19,8.15947376 L17.9351274,9.54986678 L17.7857371,9.43179644 Z M16.0558303,8.05216 L10.015275,3.23753459 L3.94399153,8.05639487 L3.94399153,16.2349905 L7.40463554,16.2349905 L7.40463554,11.8239483 L12.5951863,11.8239483 L12.5951863,16.2349905 L16.0558303,16.2349905 L16.0558303,8.05216 Z" />
            </svg>
        </a>

        <% if $Pages %>
        <% loop $Pages %>
        <div class="breadCrumbs__wrap__item breadCrumbs__wrap__item--divivder"><svg xmlns="http://www.w3.org/2000/svg"
                width="20" height="20" viewBox="0 0 20 20">
                <polygon fill="#67809F"
                    points="11.911 9.756 6.667 15 7.845 16.179 14.268 9.756 7.845 3.333 6.667 4.512" />
            </svg>
        </div>
        <% if $Last %>
        <p class="breadCrumbs__wrap__item breadCrumbs__wrap__item--current breadCrumbs__wrap__item--link">
            {$MenuTitle.XML.LimitCharacters(30)}</p>
        <% else %>
            <a href="{$Link}"
                class="breadCrumbs__wrap__item breadCrumbs__wrap__item--link">
                <p>{$MenuTitle.XML.LimitCharacters(30)}</p>
            </a>
        <% end_if %>
        <% end_loop %>
        <% end_if %>

        <% with $Top %>

        <div class="breadCrumbs__wrap__social">
            <p class="breadCrumbs__wrap__social__text"><%t Common.SHAREWITH 'Share with' %></p>
            <a href="https://www.facebook.com/sharer.php?u=$AbsoluteLink" target="_blank"
                class="breadCrumbs__wrap__social__link [ js-share-facebook ]">$SVG('facebook')</a>
            <a href="https://twitter.com/intent/tweet?text={$Title}&url=$AbsoluteLink" target="_blank"
                class="breadCrumbs__wrap__social__link [ js-share-twitter ]">$SVG('twitter')</a>
        </div>
        <% end_with %>
    </div>
</div>