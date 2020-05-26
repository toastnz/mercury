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
				{$Content}
             <h4>Past Orders</h4>
    <hr>
                <% with $Member %>
                    <% if $PastOrders %>
                        <% include SilverShop\Includes\OrderHistory %>
                    <% else %>
                        <p class="message warning"><%t SilverShop\Page\AccountPage.NoPastOrders 'No past orders found.' %></p>
                    <% end_if %>
                <% end_with %>
			</div>
		</div>

        <% loop $ContentBlocks.Sort('SortOrder') %>
            $ForTemplate
        <% end_loop %>

	</div>
</div>
