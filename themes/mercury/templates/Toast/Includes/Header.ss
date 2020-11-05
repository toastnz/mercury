<header class="header">
    <div class="header__wrap">

        <a href="{$BaseRef}" class="header__wrap__logo">
            $SVG('logo')
        </a>

        <%----------------------------------------------------------------
        Menu
        ----------------------------------------------------------------%>
        <div class="header__wrap__menu">

            <% loop Menu(1) %>
            <div class="header__wrap__menu__item [ js-indicator-hover ]">
                <a href="$Link" class="header__wrap__menu__item__link {$LinkingMode}">
                    <p>$Title</p>
                </a>

                <% if $Children %>
                <div class="header__wrap__nav__link__subnav">
                    <% loop $Children %>

                    <div class="relative">
                        <a href="{$Link}" class="header__wrap__nav__link__subnav__item {$LinkingMode}">
                            <p>{$MenuTitle}</p>
                        </a>
                        <% if $Children %>
                        <div class="header__wrap__nav__link__subnav__item__third">
                            <% loop $Children %>
                            <a href="{$Link}" class="header__wrap__nav__link__subnav__item__third__item">
                                <p>{$MenuTitle}</p>
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
                <a href="#" class="header__wrap__menu__item__link [ js-toggle-search ]">
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



<%------------------------------------------------------------------
Header Search
------------------------------------------------------------------%>

<section class="searchPane">
    <div class="searchPane__wrap">
        <div class="searchPane__wrap__close [ js-close-search ]">
            $SVG('close')
        </div>
        <div class="searchPane__wrap__form">

            <form id="SearchForm_SearchForm" action="/search-results/SearchForm/" method="get" enctype="application/x-www-form-urlencoded">
                <fieldset>
                    <div id="SearchForm_SearchForm_Search_Holder" class="field input-wrap input-wrap--text text">
                        <label class="left" for="SearchForm_SearchForm_Search">Search</label>
                        <input type="text" name="Search" class="text" id="SearchForm_SearchForm_Search" placeholder="What are you looking for?">
                    </div>
                    <button type="submit" name="action_results" value="Go" class="action" id="SearchForm_SearchForm_action_results">
                        <span>Go</span>
                    </button>
                </fieldset>
            </form>

            <p class="searchPane__wrap__form__direction">Hit enter to search or ESC to close</p>
        </div>
    </div>
</section>