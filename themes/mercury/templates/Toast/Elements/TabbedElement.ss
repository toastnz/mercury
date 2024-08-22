<% if $Items.Count %>
    <div class="tabbed-element [ element {$Width} ] [ js-tabs ]">
        <div class="tabbed-element__wrap">

            <div class="tabbed-element__tabs">
                <% loop $Items.Sort('SortOrder') %>
                    <a href="#" class="tabbed-element__tabs__item [ js-tabs-link ] <% if $FirstLast = 'first' %>active<% end_if %>" onclick="event.preventDefault(); (function() { var tabs = document.querySelectorAll('.js-tabs-link'); var contents = document.querySelectorAll('.js-tabs-item'); tabs.forEach(function(tab, index) { tab.addEventListener('click', function() { tabs.forEach(function(t) { t.classList.remove('active'); }); tab.classList.add('active'); contents.forEach(function(content) { content.classList.remove('active'); }); contents[index].classList.add('active'); }); }); })()">
                        <h6 class="no-margin">$Title.XML</h6>
                    </a>
                <% end_loop %>
            </div>

            <div class="tabbed-element__content">
                <% loop $Items.Sort('SortOrder') %>
                    <div class="tabbed-element__content__item [ js-tabs-item ] <% if $FirstLast = 'first' %>active<% end_if %>">
                        $Content
                    </div>
                <% end_loop %>
            </div>
        </div>
    </div>

<% end_if %>


