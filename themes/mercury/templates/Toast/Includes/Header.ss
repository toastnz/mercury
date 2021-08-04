<header class="header<% if $TransparentHeader %> header--transparent<% end_if %>">
    <div class="header__wrap <% if $Siteconfig.MakeHeaderFullWidth %>header__wrap--full<% end_if %>">

        <a href="{$BaseHref}" class="header__wrap__logo" title="$SiteConfig.Title">
            <% if $SiteConfig.Logo %>
                <img src="$SiteConfig.Logo.URL" alt="$SiteConfig.Title" />
            <% else %>
                $SVG('logo')
            <% end_if %>
        </a>

        <%----------------------------------------------------------------
        Menu
        ----------------------------------------------------------------%>
        <div class="header__wrap__menu">

            <% loop Menu(1) %>
            <div class="header__wrap__menu__item [ js-indicator-hover ]">
                <a href="$Link" class="header__wrap__menu__item__link {$LinkingMode}">
                    <p class="nav">$Title</p>
                </a>

                <% if $Children %>
                <div class="header__wrap__nav__link__subnav">
                    <% loop $Children %>

                    <div class="relative">
                        <a href="{$Link}" class="header__wrap__nav__link__subnav__item {$LinkingMode}">
                            <p class="nav">{$MenuTitle}</p>
                        </a>
                        <% if $Children %>
                        <div class="header__wrap__nav__link__subnav__item__third">
                            <% loop $Children %>
                            <a href="{$Link}" class="header__wrap__nav__link__subnav__item__third__item">
                                <p class="nav">{$MenuTitle}</p>
                            </a>
                            <% end_loop %>
                        </div>
                        <% end_if %>
                    </div>
                    <% end_loop %>
                </div>
                <% end_if %>

            </div>

            <% end_loop %>

            <div class="header__wrap__menu__item [ js-indicator-hover ]">
                <a href="#" class="header__wrap__menu__item__link [ js-toggle-search ]" title="Search">
                    <p>$SVG('search')</p>
                </a>
            </div>

            <div class="header__wrap__navburger [ js-toggle-menu ]">
                <div class="header__wrap__navburger__ring header__wrap__navburger__ring--1"></div>
                <div class="header__wrap__navburger__ring header__wrap__navburger__ring--2"></div>
                <div class="header__wrap__navburger__ring header__wrap__navburger__ring--3"></div>
            </div>

</header>

<% include Toast\Includes\MobileMenu %>

<% include Toast\Includes\SearchPane %>
