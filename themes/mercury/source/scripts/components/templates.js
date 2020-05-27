import numeral from 'numeral';

/**
* Return a template for a predictive search placeholder item
* @returns {string}
*/

export const searchPlaceholder = () =>
    `<div class="searchPane__wrapper__item searchPane__wrapper__item--placeholder">
        <div class="searchPane__wrapper__item__image"><span></span></div>
        <div class="searchPane__wrapper__item__details"><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
        </div>
    </div>`;

/**
* Return a template for a predictive search item
* @returns {string}
*/

export const searchItem = (product) =>
    `<a href="${product.url}" class="searchPane__wrapper__item">
        <div class="searchPane__wrapper__item__image">
            <img src="${product.image}">
        </div>
        <div class="searchPane__wrapper__item__details">
            <p><strong>${product.title}</strong></p>
            <p>${product.type}</p>
            <p><strong>$${product.price}</strong>${(product.compare_at_price_max !== "0.00") ? `<span class="strike">$${product.compare_at_price_max}</span>` : ``}</p>
        </div>
    </a>`;

/**
* Return a template for a sidecart item
* @returns {string}
*/

export const emptySideCart = () =>
    `<h2>Nothing in your cart yet</h2>`;

/**
* Return a template for a sidecart item
* @returns {string}
*/

export const sidecartItem = (product, index) =>
    `<div class="sidecart__inner__list__item">
        <a href="${product.url}" class="sidecart__inner__list__item__image"><span style="background-image:url('${product.image}')"></span></a>
        <a href="${product.url}" class="sidecart__inner__list__item__details">
            <p><strong>${product.title}</strong></p>
            ${(product.product_type) ? `<p>${product.product_type}</p>` : ``}
            <p><strong>${numeral(product.subtotal).format('$0,0.00')}</strong></p>
        </a>
        <a href="${product.url}" class="sidecart__inner__list__item__remove [ js-remove-from-side-cart ]" data-cart-item-index="${index}">
            <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 30 30">
                <polygon fill-rule="evenodd" points="29.854 25.3 19.482 14.927 29.854 4.553 25.3 0 14.928 10.374 4.555 0 .002 4.553 10.375 14.927 0 25.3 4.553 29.854 14.928 19.48 25.3 29.854" />
            </svg>
        </a>
    </div>`;

