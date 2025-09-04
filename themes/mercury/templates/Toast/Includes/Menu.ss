<% loop $MenuItems %>
    <div class="header__wrap__menu__item">
        <a href="$Link" class="header__wrap__menu__item__link {$LinkingMode}">
            <p class="nav">$Title</p>
        </a>
        <% if $Children %>
            <div class="header__wrap__nav__link__subnav">
                <div class="header__wrap__nav__link__subnav__wrap">
                    <% loop $Children %>
                        <a href="{$Link}" class="header__wrap__nav__link__subnav__wrap__item {$LinkingMode}">
                            <p class="nav">{$MenuTitle}</p>
                        </a>
                    <% end_loop %>
                </div>
            </div>
        <% end_if %>
    </div>
<% end_loop %>