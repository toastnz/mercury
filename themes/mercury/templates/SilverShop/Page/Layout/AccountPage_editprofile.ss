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
                   <h4>Edit Profile</h4>
    <hr>
				 $EditAccountForm
                    $ChangePasswordForm
			</div>
		</div>

        <% loop $ContentBlocks.Sort('SortOrder') %>
            $ForTemplate
        <% end_loop %>

	</div>
</div>
