<%-- -------------------------------------------- 
Image and text block
-------------------------------------------- --%>

<div class="element image-element <% if $ReverseLayout %>image-element--reversed<% end_if %>">
    <div class="image-element__wrap image-element__wrap--{$Width}">

        <% if $Image %>
            <div class="image-element__wrap__image">
                <img src="$Image.FocusFill(1200,800).URL" width="1200" height="800" loading="lazy">
            </div>
        <% end_if %>
        
        <div class="image-element__wrap__text">
            {$Content}
        </div>

    </div>
</div>