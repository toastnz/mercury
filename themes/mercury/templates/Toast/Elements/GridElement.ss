<% if $Items %>
    <div class="grid-element [ element {$Width} {$Columns} ]">
        <div class="grid-element__wrap">
            
            <% loop $Items.Sort('SortOrder') %>
                <% if $Link %>
                    <a href="$Link.LinkURL" class="grid-element__item grid-element__item--{$Size}">
                <% else %>
                    <div class="grid-element__item grid-element__item--{$Size}">
                <% end_if %>

                    <div class="grid-element__image">
                        <% if $Size = 'large' %>
                            <img src="$Image.FocusFill(1000,600).URL" width="1000" height="600" loading="lazy" alt="$Image.title">
                        <% else_if $Size = 'medium' %>
                            <img src="$Image.FocusFill(500,800).URL" width="500" height="600" loading="lazy" alt="$Image.title">
                        <% else_if $Size = 'small' %>
                            <img src="$Image.FocusFill(500,400).URL" width="500" height="300" loading="lazy" alt="$Image.title">
                        <% end_if %>
                    </div>

                    <div class="grid-element__content">
                        <h5 class="colour--white no-margin"><b>$Title.XML</b></h5>
                        <p class="colour--white">$Summary.XML</p>
                    </div>

                <% if $Link %>
                    </a>
                <% else %>
                    </div>
                <% end_if %>

            <% end_loop %>

        </div>
    </div>
<% end_if %>