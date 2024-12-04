
<header class="header<% if $TransparentHeader %> header--transparent<% end_if %>">

    <%-- --------------------------------------------
    Show notification
    -------------------------------------------- --%>
    <% if $Siteconfig.ShowNotification %>
         <% include Toast\Includes\Notification %>
    <% end_if %>


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

            <% loop $MenuSet('Header').MenuItems %>
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

            <div class="header__wrap__menu__search">
                <a href="#" class="header__wrap__menu__search__link" title="Search" onclick="showSearchPane(event)">
                    <p>
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" width="24" height="24" viewBox="0 0 24 24"><path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M10.875 18.75a7.875 7.875 0 1 0 0-15.75 7.875 7.875 0 0 0 0 15.75ZM16.443 16.445 21 21.002"/></svg>
                    </p>
                </a>
            </div>

            <div class="header__wrap__navburger" onclick="document.body.classList.toggle('mobileMenuActive');">
                <div class="header__wrap__navburger__ring header__wrap__navburger__ring--1"></div>
                <div class="header__wrap__navburger__ring header__wrap__navburger__ring--2"></div>
                <div class="header__wrap__navburger__ring header__wrap__navburger__ring--3"></div>
            </div>

        </div>
    </div>

</header>

    <script>

        // Show the search pane
        let showSearchPane = (event) => {
        
            //Stop the link from forcing a page jump
            event.preventDefault();
        
            //Animate in the search pane
            document.body.classList.add('searchActive');
        
            // Change the placeholder and focus on the input
            if (document.getElementById('SearchForm_SearchForm_Search')) {
                setTimeout(() => {
                    document.getElementById('SearchForm_SearchForm_Search').focus();
                }, 100);
            }
        }

    </script>

 <% include Toast\Includes\MobileMenu %>

 <% include Toast\Includes\SearchPane %>
