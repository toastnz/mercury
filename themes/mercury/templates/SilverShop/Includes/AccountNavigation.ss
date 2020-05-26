

<div class="accountnav">
    <div class="nav">
        <ul class="nav nav-list">
            <li>
                <p><a href="{$Link}" class="button">Past Orders</a></p>
            </li>
            <li>
                <p><a href="{$Link('editprofile')}" class="button">Edit Profile</a></p>
            </li>
            <li>
                <p><a href="{$Link('addressbook')}" class="button">Address Book</a></p>
            </li>
            <li>
                <p><a href="Security/logout" class="button">Log Out</a></p>
            </li>
        </ul>
    </div>
    <div class="memberdetails" style="display:none">
        <% with $CurrentMember %>
        <p>
            <dl>
                <dt><%t SilverShop\Page\AccountPage.MemberName 'Name' %></dt>
                <dd>$Name</dd>

                <dt><%t SilverShop\Page\AccountPage.MemberEmail 'Email' %></dt>
                <dd>$Email</dd>

                <dt><%t SilverShop\Page\AccountPage.MemberSince 'Member Since' %></dt>
                <dd>$Created.Nice</dd>

                <dt> <%t SilverShop\Page\AccountPage.NumberOfOrders 'Number of orders' %></dt>
                <dd><% if $PastOrders %>{$PastOrders.Count}<% else %>0<% end_if %></dd>
            </dl>
        </p>
        <% end_with %>
    </div>
</div>
