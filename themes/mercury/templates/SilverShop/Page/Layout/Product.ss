<% include Toast\BannerPush %>

$Breadcrumbs

<% loop $ContentBlocks.Sort('SortOrder') %>
    $ForTemplate
<% end_loop %>

<section class="productPage">
    <div class="productPage__wrap">

    <div class="productPage__wrap__gallery">
        <div class="productPage__wrap__gallery__navigation">
            <div class="productPage__wrap__gallery__navigation__item active [ js-change-featured-image ]" data-image-url="$Image.FocusFill(800, 1200).url">
                <img src="$Image.FocusFill(400, 600).url" />
            </div>
            <% loop $AdditionalImages %>
                <div class="productPage__wrap__gallery__navigation__item [ js-change-featured-image ]" data-image-url="$FocusFill(800, 1200).url">
                    <img src="$FocusFill(400, 600).url" />
                </div>
            <% end_loop %>
        </div>

        <div class="productPage__wrap__gallery__featured">
            <img src="$Image.FocusFill(800, 1200).url" />
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

        <% if $Content %>
            <div class="productPage__wrap__details__description">
                $Content
            </div>
        <% end_if %>

        $Form
        

    </div>

    </div>
</section>

