<%-------------------------------------------------------%>
<%-- Bread Crumbs --%>
<%-------------------------------------------------------%>

<div class="breadcrumbs">
    <div class="breadcrumbs__wrap row">
        <div class="column">
            <a href="{$BaseHref}" class="breadcrumbs__wrap__item breadcrumbs__wrap__item--icon">
                <svg width="17" height="17" xmlns="http://www.w3.org/2000/svg">
                    <path d="M17 6.392v9.934c0 .37-.306.674-.693.674h-4.54a.686.686 0 01-.694-.674v-5.143H5.921v5.143c0 .37-.306.674-.693.674H.693A.686.686 0 010 16.326V6.392c0-.212.1-.407.275-.534L8.08.132a.72.72 0 01.831 0l7.807 5.726a.653.653 0 01.28.534H17z" fill="#231F20"/>
                </svg>
            </a>

            <% if $Pages %>
                <% loop $Pages %>
                    <div class="breadcrumbs__wrap__item breadcrumbs__wrap__item--divivder">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 20 20">
                            <polygon fill="#FFFFFF" points="11.911 9.756 6.667 15 7.845 16.179 14.268 9.756 7.845 3.333 6.667 4.512" />
                        </svg>
                    </div>
                    <% if $Last %>
                        <p class="breadcrumbs__wrap__item breadcrumbs__wrap__item--current breadcrumbs__wrap__item--current">{$MenuTitle.XML.LimitCharacters(30)}</p>
                    <% else %>
                        <a href="{$Link}" class="breadcrumbs__wrap__item breadcrumbs__wrap__item--link">
                            <p>{$MenuTitle.XML.LimitCharacters(30)}</p>
                        </a>
                    <% end_if %>
                <% end_loop %>
            <% end_if %>
        </div>
    </div>
</div>