<% include Toast\Banner %>

$Breadcrumbs

<% loop $ContentBlocks.Sort('SortOrder') %>
    $ForTemplate
<% end_loop %>

<div class="cart">
    
    <a href="{$BaseHref}" class="cart__continue">
      <div class="cart__continue__wrap">
        <svg xmlns="http://www.w3.org/2000/svg" width="22" height="16" viewBox="0 0 22 16">
            <polygon fill="#FFF" fill-rule="evenodd" points="8.118 .023 .143 8 8.118 15.977 9.786 14.309 4.666 9.189 21.452 9.19 21.452 6.809 4.667 6.808 9.786 1.691" />
        </svg>
        <h6>Continue Shopping</h6>
      </div>
    </a>

    <div class="cart__wrap">

    <table class="cart__wrap__form__table">

        <thead class="cart__wrap__form__table__head">
          <tr>
            <th>
              <h6>Product</h6>
            </th>

            <th>
              <h6>&nbsp;</h6>
            </th>

            <th>
              <h6>Quantity</h6>
            </th>

            <th>
              <h6>Total</h6>
            </th>

            <th>
              <h6>&nbsp;</h6>
            </th>
          </tr>
        </thead>

        <tbody class="cart__wrap__form__table__body [ js-cart-items ]">
            <% if $Cart %>
                <% if $CartForm %>
                    $CartForm
                <% else %>
                    <% with $Cart %><% include SilverShop\Cart\Cart Editable=true %><% end_with %>
                <% end_if %>
            
            <% else %>
                <p class="message warning"><%t SilverShop\Cart\ShoppingCart.NoItems "There are no items in your cart." %></p>
            <% end_if %>
        </tbody>
    </table>

  </form>
  
    </div>



</div>  

<section class="cartPage">
    <div class="cartPage__wrap">

<%-- <% if $Cart %>
    <% if $CartForm %>
        $CartForm
    <% else %>
        <% with $Cart %><% include SilverShop\Cart\Cart Editable=true %><% end_with %>
    <% end_if %>

<% else %>
    <p class="message warning"><%t SilverShop\Cart\ShoppingCart.NoItems "There are no items in your cart." %></p>
<% end_if %> --%>


<div class="cartfooter">
    <% if $ContinueLink %>
        <a class="continuelink button" href="$ContinueLink">
            <%t SilverShop\Cart\ShoppingCart.ContinueShopping 'Continue Shopping' %>
        </a>
    <% end_if %>
    <% if $Cart %>
        <% if $CheckoutLink %>
            <a class="checkoutlink button" href="$CheckoutLink">
                <%t SilverShop\Cart\ShoppingCart.ProceedToCheckout 'Proceed to Checkout' %>
            </a>
        <% end_if %>
    <% end_if %>
</div>
