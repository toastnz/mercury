<% if $Items.Count %>
    <div class="tabbed-element [ element {$Width} ] [ js-tabs ]">
        <div class="tabbed-element__wrap">

            <div class="tabbed-element__tabs">
                
                <div class="tabbed-element__tabs__indicator [ js-tabs-indicator ]"></div>
                
                <% loop $Items.Sort('SortOrder') %>
                    <a href="#" class="tabbed-element__tabs__item [ js-tabs-link ] <% if $FirstLast = 'first' %>active<% end_if %>">
                        <h6>$Title.XML</h6>
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

        <script>

            function updateTabbedContent(indicator, currentTab) {

                var parent = currentTab.parentNode;
                var grandparent = parent.parentNode;
                var index = Array.prototype.indexOf.call(parent.children, currentTab);

                currentTab.classList.add('active');

                document.querySelectorAll('.js-tabs-item', grandparent).forEach(function(tabbedContentItem){ tabbedContentItem.style.display = 'none'});

                grandparent.querySelector(`.js-tabs-item:nth-child(${index})`).style.display = 'block';

                var rect = currentTab.getBoundingClientRect();
                indicator.style.height = `${rect.height}px`;
                indicator.style.top = `${currentTab.offsetTop}px`;
            }

            document.querySelectorAll('.js-tabs').forEach(function(tabbedContent) {

                var indicator = tabbedContent.querySelector('.js-tabs-indicator');
                var currentTab = tabbedContent.querySelector('.js-tabs-link.active');

                document.querySelectorAll('.js-tabs-link', tabbedContent).forEach(function(tabbedContentLink) {

                    tabbedContentLink.addEventListener('click', function(e) {
                        e.preventDefault();
                        currentTab.classList.remove('active');
                        currentTab = tabbedContentLink;
                        updateTabbedContent(indicator, currentTab);
                    });

                });

                updateTabbedContent(indicator, currentTab);

                window.addEventListener('resize', function() {
                    updateTabbedContent(indicator, currentTab);
                });

            });

        </script>
    </div>

<% end_if %>
