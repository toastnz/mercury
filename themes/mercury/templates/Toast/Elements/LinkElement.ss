<% if $Items %>
    <div class="link-element [ element {$Width} {$Columns} ]">
        <div class="link-element__wrap">
            
            <% loop $Items.Sort('SortOrder') %>
                <a href="$Link.LinkURL" class="link-element__item <% if not $Icon && not $image %>bordered <% end_if %>">

                    <% if $Icon %>
                        <div class="link-element__icon">
                            <img src="$Icon.URL" loading="lazy" alt="$Icon.Title">
                        </div>
                    <% else_if $Image %>
                        <img  class="link-element__image" src="$Image.FocusFill(600,400).URL" width="600" height="300" loading="lazy">
                    <% end_if %>

                    <div class="link-element__content">
                        <h6>$Title.XML</h6>
                        <p>$Summary.XML</p>
                        <p class="arrow-link no-margin">Read More</p>
                    </div>

                </a>
            <% end_loop %>

        </div>
    </div>
<% end_if %>