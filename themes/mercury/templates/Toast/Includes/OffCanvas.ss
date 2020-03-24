<%----------------------------------------------------------------
Off Canvas Menu
----------------------------------------------------------------%>
<nav class="offCanvas">
    <ul class="offCanvas__menu unstyled">
        <% loop $Menu(1) %>

        <li class="offCanvas__menu__item">
            <a href="$Link" class="offCanvas__menu__item__link {$LinkingMode}">
                <b>{$MenuTitle.XML.UpperCase}</b>
                <% if $Children %>
                <span class="[ js-toggle-nav ]">$SVG('arrow-down')</span>
                <% end_if %>
            </a>

            <% if $Children %>
            <ul class="offCanvas__submenu unstyled">
                <% loop $Children %>
                <li class="offCanvas__submenu__item">
                    <a href="{$Link}" class="offCanvas__submenu__item__link">
                        {$MenuTitle.XML.UpperCase}
                    </a>
                </li>
                <% end_loop %>
            </ul>
            <% end_if %>

        </li>
        <% end_loop %>
    </ul>
</nav>