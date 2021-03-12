<%-- <% loop $Menu(1) %>
    {$LinkingMode}
    {$MenuTitle.XML}
    {$Link}
    
    <% if $Children.Count %>
        <% loop $Children %>
            {$LinkingMode}
            {$MenuTitle.XML}
            {$Link}
        <% end_loop %>
    <% end_if %>
<% end_loop %> --%>