
 <% loop $Items %>
    <% if $ShowInTable %>
        <tr class="cart__wrap__form__table__body__row">

            <td class="cart__wrap__form__table__body__row__cell">
              <a href="{$Link}" class="cart__wrap__form__table__body__row__cell__image">
                <img src="$Image.setWidth(45).URL" alt="$TableTitle" />
              </a>
            </td>

            <td class="cart__wrap__form__table__body__row__cell cart__wrap__form__table__body__row__cell--details">
              <a href="{$Link}">
                <h5>$TableTitle</h5>
              </a>
              <% if $SubTitle %>
                <p>$SubTitle</p>
              <% end_if %>
            </td>

            <td class="cart__wrap__form__table__body__row__cell">
              <div class="quantity quantity--checkout">
              <% if $Up.Editable %>$QuantityField<% else %>$Quantity<% end_if %>
              </div>

            </td>

            <td class="cart__wrap__form__table__body__row__cell cart__wrap__form__table__body__row__cell--total">
              <h6>$Total.Nice</h6>
            </td>

            <td class="cart__wrap__form__table__body__row__cell">
              <a href="$removeallLink" class="[ js-remove-from-cart ]">
                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="25" viewBox="0 0 20 25">
                    <path fill-rule="evenodd" d="M5.48752834,0 L5.48752834,3.62811791 L0.0453514739,3.62811791 L0.0453514739,5.44217687 L1.85941043,5.44217687 L1.85941043,25.3968254 L18.185941,25.3968254 L18.185941,5.44217687 L20,5.44217687 L20,3.62811791 L14.5578231,3.62811791 L14.5578231,0 L5.48752834,0 Z M7.3015873,1.81405896 L12.7437642,1.81405896 L12.7437642,3.62811791 L7.3015873,3.62811791 L7.3015873,1.81405896 Z M3.67346939,5.44217687 L16.3718821,5.44217687 L16.3718821,23.5827664 L3.67346939,23.5827664 L3.67346939,5.44217687 Z M6.39455782,8.16326531 L6.39455782,20.861678 L8.20861678,20.861678 L8.20861678,8.16326531 L6.39455782,8.16326531 Z M11.8367347,8.16326531 L11.8367347,20.861678 L13.6507937,20.861678 L13.6507937,8.16326531 L11.8367347,8.16326531 Z" />
                </svg>
              </a>
            </td>

          </tr>
    <% end_if %> 
<% end_loop %>

<% if $Items %>
    <table style="display:none;"class="cart" summary="<%t SilverShop\Cart\ShoppingCart.TableSummary "Current contents of your cart." %>">
        <colgroup>
            <col class="image"/>
            <col class="product title"/>
            <col class="unitprice" />
            <col class="quantity" />
            <col class="total"/>
            <col class="remove"/>
        </colgroup>
        <thead>
            <tr>
                <th scope="col"></th>
                <th scope="col"><%t SilverShop\Page\Product.SINGULARNAME "Product" %></th>
                <th scope="col"><%t SilverShop\Model\Order.UnitPrice "Unit Price" %></th>
                <th scope="col"><%t SilverShop\Model\Order.Quantity "Quantity" %></th>
                <th scope="col"><%t SilverShop\Model\Order.TotalPriceWithCurrency "Total Price ({Currency})" Currency=$Currency %></th>
                <% if $Editable %>
                    <th scope="col"><%t SilverShop\Generic.Remove "Remove" %></th>
                <% end_if %>
            </tr>
        </thead>
        <tbody>
            <% loop $Items %><% if $ShowInTable %>
                <tr id="$TableID" class="$Classes $EvenOdd $FirstLast">
                    <td>
                        <% if $Image %>
                            <div class="image">
                                <a href="$Link" title="<%t SilverShop\Generic.ReadMoreTitle "Click here to read more on &quot;{Title}&quot;" Title=$TableTitle %>">
                                    $Image.setWidth(45)
                                </a>
                            </div>
                        <% end_if %>
                    </td>
                    <td id="$TableTitleID">
                        <h3>
                        <% if $Link %>
                            <a href="$Link" title="<%t SilverShop\Generic.ReadMoreTitle "Click here to read more on &quot;{Title}&quot;" Title=$TableTitle %>">$TableTitle</a>
                        <% else %>
                            $TableTitle
                        <% end_if %>
                        </h3>
                        <% if $SubTitle %><p class="subtitle">$SubTitle</p><% end_if %>
                        <% if $Product.Variations && $Up.Editable %>
                            <%t SilverShop\Generic.Change "Change" %>: $VariationField
                        <% end_if %>
                    </td>
                    <td>$UnitPrice.Nice</td>
                    <td><% if $Up.Editable %>$QuantityField<% else %>$Quantity<% end_if %></td>
                    <td id="$TableTotalID">$Total.Nice</td>
                    <% if $Up.Editable %>
                        <td>
                            <% if $RemoveField %>
                                $RemoveField
                            <% else %>
                                <a href="$removeallLink" title="<%t SilverShop\Cart\ShoppingCart.RemoveAllTitle "Remove all of &quot;{Title}&quot; from your cart" Title=$TableTitle %>">
                                    <img src="$resourceURL('silvershop/core:client/dist/images/remove.gif')" alt="x"/>
                                </a>
                            <% end_if %>

                        </td>
                    <% end_if %>
                </tr>
            <% end_if %><% end_loop %>
        </tbody>
        <tfoot>
            <tr class="subtotal">
                <th colspan="4" scope="row"><%t SilverShop\Model\Order.SubTotal "Sub-total" %></th>
                <td id="$TableSubTotalID">$SubTotal.Nice</td>
                <% if $Editable %><td>&nbsp;</td><% end_if %>
            </tr>
            <% if $ShowSubtotals %>
                <% if $Modifiers %>
                    <% loop $Modifiers %>
                        <% if $ShowInTable %>
                            <tr id="$TableID" class="$Classes">
                                <th id="$TableTitleID" colspan="4" scope="row">
                                    <% if $Link %>
                                        <a href="$Link" title="<%t SilverShop\Generic.ReadMoreTitle "Click here to read more on &quot;{Title}&quot;" Title=$TableTitle %>">$TableTitle</a>
                                    <% else %>
                                        $TableTitle
                                    <% end_if %>
                                </th>
                                <td id="$TableTotalID">$TableValue.Nice</td>
                                <% if $Up.Editable %>
                                    <td>
                                        <% if $CanRemove %>
                                            <strong>
                                                <a class="ajaxQuantityLink" href="$removeLink" title="<%t SilverShop\Cart\ShoppingCart.RemoveTitle "Remove &quot;{Title}&quot; from your cart." Title=$TableTitle %>">
                                                    <img src="$resourceURL('silvershop/core:client/dist/images/remove.gif')" alt="x"/>
                                                </a>
                                            </strong>
                                        <% end_if %>
                                    </td>
                                <% end_if %>
                            </tr>
                            <% if $Form %>
                                <tr>
                                    <td colspan="5">$Form</td><td colspan="10"></td>
                                </tr>
                            <% end_if %>
                        <% end_if %>
                    <% end_loop %>
                <% end_if %>
                <tr class="gap Total">
                    <th colspan="4" scope="row"><%t SilverShop\Model\Order.Total "Total" %></th>
                    <td id="$TableTotalID"><span class="value">$Total.Nice</span> <span class="currency">$Currency</span></td>
                    <% if $Editable %><td>&nbsp;</td><% end_if %>
                </tr>
            <% end_if %>
        </tfoot>
    </table>
<% else %>
    <p class="message warning">
        <%t SilverShop\Cart\ShoppingCart.NoItems "There are no items in your cart." %>
    </p>
<% end_if %>
