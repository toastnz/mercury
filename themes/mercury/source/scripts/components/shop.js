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

        this.getCart(null, ['updateSideCart']);
        this.attachEventListeners();
    }

    attachEventListeners() {
        $(document).keyup((e) => { if (e.keyCode == 27) this.closeSideCart() });
        this.$shop.on('click', '.js-change-featured-image', (e) => { this.changeFeaturedImage(e) });
        this.$shop.on('click', '.js-close-side-cart', (e) => { this.closeSideCart(e) });
        this.$shop.on('click', '.js-open-side-cart', (e) => { this.openSideCart(e) });
        this.$shop.mouseup((e) => { if (!$('.sidecart__inner').is(e.target) && $('.sidecart__inner').has(e.target).length === 0) this.closeSideCart(e) });


        this.$shop.on('click', '.js-add-to-cart', (e) => { e.preventDefault(), this.addToCartForm(e) });
        this.$shop.on('click', '.js-remove-from-side-cart', (e) => { this.removeFromSidecart(e) });
    }


    removeFromSidecart(e) {
        e.preventDefault();
        let $this = $(e.currentTarget);
        this.sidecartLoading($('.sidecart__inner__list__item').length);
        $.getJSON($this.attr('href'), (cart) => {
            this.updateCartCount(cart.item_count);
            this.updateSideCart(cart.data);
            this.openSideCart();
        });
    }

    addToCartForm(e) {
        let $this = $(e.currentTarget);
        $this.addClass('busy');
        let product_id = $('.js-product-details').attr('data-product-id');
        let quantity = $('#AddProductForm_Form_Quantity').val();
        $.getJSON(`/shop-api/cart/add?product_id=${product_id}&quantity=${quantity}`, (cart) => {
            this.updateCartCount(cart.item_count);
            this.updateSideCart(cart.data);
            this.openSideCart();
            $this.removeClass('busy');
        });
    }

    sidecartLoading(count = 4) {
        this.$sideCartItems.empty();
        let html = ``;
        [...Array(count)].forEach(() => { html += templates.sidecartItemPlaceholder() });
        this.$sideCartItems.html(html);
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
            this.updateSideCart(cart.data);
            if (updates.includes('openSideCart')) this.openSideCart();
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
        if (cart.items) {
            cart.items.forEach((item, index) => this.$sideCartItems.append(templates.sidecartItem(item, index)));
            $('html').removeClass('side-cart-empty');
        } else {
            this.$sideCartItems.append(templates.emptySideCart());
            $('html').addClass('side-cart-empty');
        }
    }

    openSideCart(e) {
        if (e) e.preventDefault();
        setTimeout(() => this.$sideCartItems.css({ 'overflow': 'auto' }), 800);
        $('html').addClass('side-cart-open');
    }

    closeSideCart(e) {
        if (e) e.preventDefault();
        this.$sideCartItems.css({ 'overflow': 'hidden' });
        $('html').removeClass('side-cart-open');
    }


    updateItemQuantity() { }

    removeItem() { }

    updatePriceFromOptions() { }

}






