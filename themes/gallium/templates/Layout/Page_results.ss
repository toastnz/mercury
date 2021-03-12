$Title
<% if $Query %>
    <p>You searched for ‘{$Query}’</p>
<% end_if %>
<% if $Results %>
    <% if $Results.Count == 1 %>
        <p>There is 1 result.</p>
    <% else %>
        <p>There are $Results.TotalItems results.<% if $Results.MoreThanOnePage %> You are on page {$Results.CurrentPage} of {$Results.TotalPages}.<% end_if %></p>
    <% end_if %>
<% end_if %>

<% if $Results %>
    <% loop $Results %>
            <h6><a href="$Link">$MenuTitle</a></h6>
            <% if $Summary%>
                <p>$Summary</p>
            <% else %>
                <p>{$Content.Summary}</p>
            <% end_if %>
            <a href="$Link">READ MORE</a>
        </div>
    <% end_loop %>
<% else %>
    <h5>Sorry there are no results for that query</h5>
<% end_if %>

<% if $Results.MoreThanOnePage %>
    <% loop $Results.Pages %>
        <% if $CurrentBool %>
            <span>$PageNum</span>
        <% else %>
            <a href="$Link">$PageNum</a>
        <% end_if %>
    <% end_loop %>
<% end_if %>



