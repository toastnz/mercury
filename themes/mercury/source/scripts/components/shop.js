/*------------------------------------------------------------------
Newsletter Popup
------------------------------------------------------------------*/
import $ from 'jquery';
import * as templates from './templates';
import { Notyf } from 'notyf';
export default class Shop {
    constructor($el) {
        this.$shop = $el;

        this.$cartBubble = this.$shop.find('.js-cart-bubble');
        this.$cartCount = this.$shop.find('.js-cart-count');
        this.$sideCart = this.$shop.find('.js-side-cart');
        this.$sideCartItems = this.$shop.find('.js-side-cart-items');

        this.getCart(null, []);
        this.attachEventListeners();
    }

    attachEventListeners() {
        $(document).keyup((e) => { if (e.keyCode == 27) this.closeSideCart() });
        this.$shop.on('click', '#AddProductForm_Form_action_addtocart', (e) => { e.preventDefault(), this.addToCartForm(e) });
        this.$shop.on('click', '.js-change-featured-image', (e) => { e.preventDefault(), this.changeFeaturedImage(e) });
        this.$shop.on('click', '.js-close-side-cart', (e) => { e.preventDefault(), this.closeSideCart() });

        this.$shop.on('click', '.js-open-side-cart', (e) => { e.preventDefault(), this.openSideCart() });
        this.$shop.on('click', '.js-remove-from-side-cart', (e) => { this.removeFromSideCart(e) });
        this.$shop.on('click', '.js-side-cart', (e) => {
            if (!this.$shop.find('.sidecart__inner').is(e.target) && this.$shop.find('.sidecart__inner').has(e.target).length === 0) this.closeSideCart();
        });
    }

    addToCartForm(e) {
        let $this = $(e.currentTarget);
        let $form = $this.closest('form');
        $.ajax({
            dataType: 'json',
            url: $form.attr('action'),
            type: 'POST',
            data: $form.serialize(),
        })
            .fail(() => {
                this.showError();
            })
            .done((response) => {
                this.getCart(null, ['updateSideCart'])
            })
    }

    changeFeaturedImage(e) {
        let $this = $(e.currentTarget);
        $('.js-change-featured-image').removeClass('active');
        $this.addClass('active');
        $('.productPage__wrap__gallery__featured img').attr('src', $this.attr('data-image-url'));
    }

    getCart($button, updates = []) {
        $.getJSON('shop-api/cart/get', (cart) => {
            if ($button) $button.removeClass('busy');
            this.updateCartCount(cart.item_count);
            if (updates.includes('updateSideCart')) this.updateSideCart(cart)
        });
    }

    updateCartCount(count = 0) {
        if (count === 0) {
            this.$cartBubble.removeClass('active');
            this.$cartCount.text(0);
        } else {
            this.$cartBubble.addClass('active');
            this.$cartCount.text(count);
        }
    }

    addToCart(e) {
        e.preventDefault();

        let $this = $(e.currentTarget);
        let params = {
            url: 'shop-api/cart',
            data: $this.closest('form').serialize(),
            dataType: 'json'
        };

        $this.addClass('busy');

        $.getJSON(params, () => this.getCart($this, ['updateSideCart']));
    }

    removeFromSideCart(e) {
        e.preventDefault();
        let $this = $(e.currentTarget);

        let params = {
            url: 'cart/change.js',
            data: { quantity: 0, line: $this.attr('data-cart-item-index') },
            dataType: 'json'
        };

        $.getJSON(params, () => this.getCart($this, ['updateSideCart']));

    }

    showError(response) {
        this.$shop.find('.busy').removeClass('busy');
        let notyf = new Notyf();

        notyf.error({
            message: (response && response.description) ? response.description : 'Something went wrong',
            duration: 114000,
            dismissible: true,
            icon: false
        });
    }

    updateSideCart(cart) {
        this.$sideCartItems.empty();

        if (cart.item_count) {
            cart.items.forEach((item, index) => this.$sideCartItems.append(templates.sidecartItem(item, index)));
        } else {
            this.$sideCartItems.append(templates.emptySideCart());
        }

        this.openSideCart();
    }

    openSideCart() {
        $('html').addClass('side-cart-open');
    }

    closeSideCart() {
        $('html').removeClass('side-cart-open');
    }

    updateItemQuantity() { }

    removeItem() { }

    updatePriceFromOptions() { }

}

