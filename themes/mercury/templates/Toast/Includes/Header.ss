
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
            <div class="header__wrap__menu__item [ js-indicator-hover ]">
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

            <div class="header__wrap__menu__search [ js-indicator-hover ]">
                <a href="#" class="header__wrap__menu__search__link" title="Search" onclick="showSearchPane(event)">
                    <p>
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                            <path fill-rule="evenodd" d="M9.802 19.597a9.748 9.748 0 0 0 6.042-2.092L22.34 24 24 22.34l-6.495-6.496A9.796 9.796 0 1 0 .238 7.654a9.795 9.795 0 0 0 9.564 11.942Zm0-17.24c1.974 0 3.867.784 5.263 2.182a7.438 7.438 0 0 1 0 10.526 7.438 7.438 0 0 1-10.527 0 7.438 7.438 0 0 1 0-10.526 7.438 7.438 0 0 1 5.264-2.181Z"/>
                        </svg>
                    </p>
                </a>
            </div>

            <div class="header__wrap__navburger" onclick="document.body.classList.toggle('mobileMenuActive');">
                <div class="header__wrap__navburger__ring header__wrap__navburger__ring--1"></div>
                <div class="header__wrap__navburger__ring header__wrap__navburger__ring--2"></div>
                <div class="header__wrap__navburger__ring header__wrap__navburger__ring--3"></div>
            </div>

</header>

<script>

// Show the search pane
function showSearchPane(event){
    
    //Stop the link from forcing a page jump
    event.preventDefault();

    //Animate in the search pane
    document.body.classList.add('searchActive');

    // Change the placeholder and focus on the input
    setTimeout(function(){
        document.getElementById('SearchForm_SearchForm_Search').focus();
    }, 100);
}

</script>

 <% include Toast\Includes\MobileMenu %>
 
 <% include Toast\Includes\SearchPane %>
