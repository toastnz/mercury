<% include Toast\BannerPush %>

$Breadcrumbs

<% loop $ContentBlocks.Sort('SortOrder') %>
    $ForTemplate
<% end_loop %>

<section class="productPage">
    <div class="productPage__wrap">

    <div class="productPage__wrap__gallery">
        <div class="productPage__wrap__gallery__inner">

            <div class="productPage__wrap__gallery__inner__tabs [ js-product-slider-navigation ]">

                <div class="productPage__wrap__gallery__inner__tabs__item active [ js-change-featured-image ]" data-image-url="$Image.FocusFill(800, 1200).url">
                    <img class="productPage__wrap__gallery__inner__tabs__item__image" src="$Image.FocusFill(400, 600).url" />
                </div>
                <% loop $AdditionalImages %>
                    <div class="productPage__wrap__gallery__inner__tabs__item [ js-change-featured-image ]" data-image-url="$FocusFill(800, 1200).url">
                        <img class="productPage__wrap__gallery__inner__tabs__item__image" src="$FocusFill(400, 600).url" />
                    </div>
                <% end_loop %>
            </div>

            <div class="productPage__wrap__gallery__inner__featured [ js-product-slider ]">
                <img src="$Image.FocusFill(800, 1200).url" />

                <% loop $AdditionalImages %>
                    <img src="$FocusFill(800, 1200).url" />
                <% end_loop %>
            </div>

            <span class="productPage__wrap__gallery__inner__progress">
                <span class="productPage__wrap__gallery__inner__progress__bar [ js-gallery-progress ]"></span>
            </span>

        </div>
    </div>

    <div class="productPage__wrap__details">
        <h3><strong>$Title</strong></h3>

        <% if $PriceRange %>
	        <h4 class="price">
	        	<strong class="value">$PriceRange.Min.Nice</strong>
	        	<% if $PriceRange.HasRange %>
	        		- <strong class="value">$PriceRange.Max.Nice</strong>
	        	<% end_if %>
	        	<span class="currency">$Price.Currency</span>
	        </h4>
        <% else_if $Price %>
        	<h4 class="price">
        		<strong class="value">$Price.Nice</strong> <span class="currency">$Price.Currency</span>
        	</h4>
        <% end_if %> 

        <hr>


        

        <div class="[ js-product-details ]" data-product-id="$ID">

        <button type="submit" class="button [ js-add-to-cart ]">
         Add to Cart
            <svg viewBox="-2000 -1000 4000 2000" class="svg-loader">
            <path id="inf" d="M354-354A500 500 0 1 1 354 354L-354-354A500 500 0 1 0-354 354z"></path>
            <use xlink:href="#inf" stroke-dasharray="1570 5143" stroke-dashoffset="6713px"></use>
            </svg>
        </button>



        <% if $Content %>
            <div class="productPage__wrap__details__description">
                $Content
            </div>
        <% end_if %>

    </div>

    </div>
</section>

