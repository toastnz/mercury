<%----------------------------------------------------------------
Mobile Menu
----------------------------------------------------------------%>

<div class="mobileMenu" id="mobilemenu">

    <% loop $Menu(1) %>
        <div class="mobileMenu__group">
            <div class="mobileMenu__group__top {$LinkingMode} [ js-top-level ]">$MenuTitle.UpperCase.XML <a href="$Link">Visit</a></div>
            <% if $Children.Count %>
                <div class="mobileMenu__group__children [ js-second-level ]" style="display:none;">
                    <% loop $Children %>        
                        <a href="$Link" class="mobileMenu__group__children__item {$LinkingMode}">$MenuTitle.XML</a>
                    <% end_loop %>
                </div>
            <% end_if %>
        </div>
    <% end_loop %>

</div>
