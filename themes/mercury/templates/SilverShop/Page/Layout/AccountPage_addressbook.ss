<% include Toast\BannerPush %>

$Breadcrumbs




<div class="account">
    <h1>Account</h1>
    <hr>
	<div class="account__sidebar">
        <% include SilverShop\Includes\AccountNavigation %>
    </div>

	<div class="account__content">

		<div class="contentBlock textBlock">
			<div class="contentBlock__wrap">

               <h4>Address Book</h4>
                <hr>

				<% if $CurrentMember.AddressBook %>
            <% loop $CurrentMember.AddressBook %>


                <div class="addresses $EvenOdd">
                    <div class="addresses__defaults">
                        <% if $ID == $CurrentMember.DefaultShippingAddressID %>
                            <span>Default Shipping Address</span>
                        <% end_if %>
                        <% if $ID == $CurrentMember.DefaultBillingAddressID %>
                            <span>Default Billing Address</span>
                        <% end_if %>
                    </div>
                    <p>
                    <% include SilverShop\Model\Address %>
</p>
                    <div class="flex">

                        <% if $ID != $CurrentMember.DefaultShippingAddressID %>
                            <a href="{$Top.Link}setdefaultshipping/{$ID}" class="button">
                                Make this my default shipping address
                            </a>
                        <% end_if %>

                        <% if $ID != $CurrentMember.DefaultBillingAddressID %>
                            <a href="{$Top.Link}setdefaultbilling/{$ID}" class="button">
                                Make this my default billing address
                            </a>
                        <% end_if %>

                        <a href="{$Top.Link}deleteaddress/{$ID}" class="button button--error">
                            Delete this address
                        </a>
                    </div>
                </div>
            <% end_loop %>
        <% else %>
            <p class="alert">
                <%t AccountPage_AddressBook.NoAddress 'No addresses found.' %>
            </p>
        <% end_if %>
    <h2>
        <%t SilverShop\Page\AccountPage_AddressBook.CreateNewTitle 'Create New Address' %>
    </h2>
    $CreateAddressForm
			</div>
		</div>

        <% loop $ContentBlocks.Sort('SortOrder') %>
            $ForTemplate
        <% end_loop %>

	</div>
</div>
