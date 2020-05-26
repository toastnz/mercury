<a href="$Link" class="productCategory__grid__item [ js-in-view ]">
    
    <% if $Image %>
        <div class="productCategory__grid__item__thumbnail" href="$Link" title="<%t SilverShop\Generic.ReadMoreTitle "Click here to read more on &quot;{Title}&quot;" Title=$Title %>">
            <img src="$Image.FocusFill(600,500).URL" alt="<%t SilverShop\Page\Product.ImageAltText "{Title} image" Title=$Title %>" />
        </div>
    <% else %>
        <div class="productCategory__grid__item__thumbnail" href="$Link" title="<%t SilverShop\Generic.ReadMoreTitle "Click here to read more on &quot;{Title}&quot;" Title=$Title %>"></div>    
    <% end_if %>

    <div class="productCategory__grid__item__content">
        <div class="productCategory__grid__item__content__heading">
            <p>$Title</p>
        </div>
        <% include SilverShop\Includes\Price %>
        <p class="productCategory__grid__item__content__link">View Product $SVG('arrow-right')</p>
    </div>



</a>
