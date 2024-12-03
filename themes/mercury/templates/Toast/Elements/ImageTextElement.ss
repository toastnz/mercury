<%-- -------------------------------------------- 
Image and text block
-------------------------------------------- --%>

<div class="image-text-element [ element {$Width} {$Alignment} ]">
    <div class="image-text-element__wrap">

        <% if $Image %>
            <div class="image-text-element__image">
                <img src="$Image.FocusFill(1200,1200).URL" width="1200" height="1200" loading="lazy" alt="$Image.title">
            </div>
        <% end_if %>
        
        <div class="image-text-element__text">
            <div class="image-text-element__constraint [ js-inview ]">
                {$Content}
            </div>
        </div>

    </div>
</div>