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



            <a href="" class="header__wrap__cart [ js-cart-bubble ][ js-open-side-cart ]">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                    <path fill-rule="evenodd" d="M17.1335394,5.06639055 C17.1335394,3.25593748 16.1678987,1.58393977 14.6001692,0.678859901 C13.0324396,-0.226219965 11.1011848,-0.2263533 9.53342861,0.678859901 C7.96567242,1.5840731 7.00005833,3.25599082 7.00005833,5.06639055 L7.00005833,6.93308444 L3,6.93308444 L3,24 L20.8669272,24 L20.8669272,6.93308444 L17.1335394,6.93308444 L17.1335394,5.06639055 Z M9.13342278,5.06639055 C9.13342278,3.44658026 10.4469886,2.13301444 12.0667989,2.13301444 C13.6866092,2.13301444 15.000175,3.44658026 15.000175,5.06639055 L15.000175,6.93308444 L9.13342278,6.93308444 L9.13342278,5.06639055 Z M18.7335628,9.06644889 L18.7335628,21.8666356 L5.13336444,21.8666356 L5.13336444,9.06644889 L7.00005833,9.06644889 L7.00005833,11.7331544 L9.13342278,11.7331544 L9.13342278,9.06644889 L15.000175,9.06644889 L15.000175,11.7331544 L17.1335394,11.7331544 L17.1335394,9.06644889 L18.7335628,9.06644889 Z" />
                </svg>
                <div class="header__wrap__cart__count">
                    <span class="[ js-cart-count ]">0</span>
                </div>
            </a>

            <div class="header__wrap__navburger [ js-toggle-menu ]">
                <div class="header__wrap__navburger__ring header__wrap__navburger__ring--1"></div>
                <div class="header__wrap__navburger__ring header__wrap__navburger__ring--2"></div>
                <div class="header__wrap__navburger__ring header__wrap__navburger__ring--3"></div>
            </div>

</header>

<% include Toast\Includes\OffCanvas %>