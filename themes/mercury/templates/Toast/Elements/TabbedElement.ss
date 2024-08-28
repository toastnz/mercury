<% if $Items.Count %>
    <div class="tabbed-element [ element {$Width} ] [ js-tabs ]">
        <div class="tabbed-element__wrap">

            <div class="tabbed-element__tabs">
                <% loop $Items.Sort('SortOrder') %>
                    <a href="#" class="tabbed-element__tab [ js-tabs-link ] <% if $FirstLast = 'first' %>active<% end_if %>" onclick="event.preventDefault(); changeTabs(event.currentTarget)">
                        <h6 class="no-margin">$Title.XML</h6>
                    </a>
                <% end_loop %>
            </div>

            <div class="tabbed-element__items">
                <% loop $Items.Sort('SortOrder') %>
                    <div class="tabbed-element__item [ js-tabs-item ] <% if $FirstLast = 'first' %>active<% end_if %>">
                        $Content
                    </div>
                <% end_loop %>
            </div>
        </div>

        <script>
            function changeTabs(element){
                let block = element.closest('.js-tabs');
                let tabs = block.querySelectorAll('.js-tabs-link');
                let items = block.querySelectorAll('.js-tabs-item');

                tabs.forEach(tab => tab.classList.remove('active'));
                items.forEach(item => item.classList.remove('active'));

                element.classList.add('active');
                items[Array.from(tabs).indexOf(element)].classList.add('active');
            }
        </script>
    </div>

<% end_if %>


