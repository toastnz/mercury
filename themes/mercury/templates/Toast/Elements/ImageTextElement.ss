<%-- -------------------------------------------- 
Image and text block
-------------------------------------------- --%>

<div class="image-element [ element {$Width} {$Alignment} ]">
    <div class="image-element__wrap">

        <% if $Image %>
            <div class="image-element__image">
                <img src="$Image.FocusFill(1200,800).URL" width="1200" height="800" loading="lazy">
            </div>
        <% end_if %>
        
        <div class="image-element__text">
            {$Content}
        </div>

    </div>
</div>