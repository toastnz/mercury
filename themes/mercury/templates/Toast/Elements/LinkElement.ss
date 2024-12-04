<% if $Items %>
    <div class="link-element <% if $FullSizeBackground %>link-element--full<% end_if %> [ element {$Width} ]">
        <div class="link-element__wrap link-element__wrap--{$Columns}">
            
            <% loop $Items.Sort('SortOrder') %>
                <a href="$Link.LinkURL" class="link-element__item <% if not $Icon && not $image %>bordered <% end_if %>">
                    <div class="link-element__image">
                        <% if $FullSizeBackground %>
                            <img src="$Image.FocusFill(600,700).URL" width="600" height="700" loading="lazy" alt="$Image.title">
                        <% else %>
                            <img src="$Image.FocusFill(600,500).URL" width="600" height="500" loading="lazy" alt="$Image.title">
                        <% end_if %>
                    </div>
                    <div class="link-element__content">
                        <h6 <% if $Top.FullSizeBackground %>class="colour--white"<% end_if %>>$Title.XML</h6>
                        <p <% if $Top.FullSizeBackground %>class="colour--white"<% end_if %>>$Summary.XML</p>
                        <p class="<% if $Top.FullSizeBackground %>colour--white<% end_if %> arrow-link no-margin"><b>Read more</b></p>
                    </div>
                </a>
            <% end_loop %>

        </div>
    </div>
<% end_if %>