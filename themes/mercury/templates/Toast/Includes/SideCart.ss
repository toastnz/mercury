<section class="sidecart [ js-side-cart ]">
    <div class="sidecart__inner">

        <button type="button" class="sidecart__inner__close [ js-close-side-cart ]">
            <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 30 30">
                <polygon fill-rule="evenodd" points="29.854 25.3 19.482 14.927 29.854 4.553 25.3 0 14.928 10.374 4.555 0 .002 4.553 10.375 14.927 0 25.3 4.553 29.854 14.928 19.48 25.3 29.854" />
            </svg>
        </button>

        <div class="sidecart__inner__title">
            <p><span>My Items</span></p>
        </div>

        <div class="sidecart__inner__list [ js-side-cart-items ]">
            <% if $Cart %>
                <% with $Cart %>
                    <% loop $Items %>

                        <div class="sidecart__inner__list__item">

                            <a href="$Link" class="sidecart__inner__list__item__image">
                                <img src="$Image.setWidth(400).url"/>
                            </a>

                            <a href="$Link" class="sidecart__inner__list__item__details">
                                <p><strong>$TableTitle</strong></p>
                                <% if $SubTitle %><p>$SubTitle</p><% end_if %>
                                <p><strong>$Total.Nice</strong></p>
                            </a>
                            <a href="$Link" class="sidecart__inner__list__item__remove [ js-remove-from-side-cart ]" data-cart-item-index="$ID">
                                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 30 30">
                                    <polygon fill-rule="evenodd" points="29.854 25.3 19.482 14.927 29.854 4.553 25.3 0 14.928 10.374 4.555 0 .002 4.553 10.375 14.927 0 25.3 4.553 29.854 14.928 19.48 25.3 29.854" />
                                </svg>
                            </a>
                        </div>
                    <% end_loop %>
                <% end_with %>
            <% end_if %>
        </div>

        <div class="sidecart__inner__actions">
            <% if $Cart %>
                <% with $Cart %>
                    <div class="sidecart__inner__actions__total">
                        <h5><strong>SUBTOTAL</strong> <span>$$Subtotal</span></h5>
                    </div>
                <% end_with %>
            <% end_if %>
            <p class="small">Shipping, taxes, and discounts codes calculated at checkout.</p>

            <a href="$CheckoutLink" class="button">
                Checkout
            </a>
        </div>

    </div>
</section>