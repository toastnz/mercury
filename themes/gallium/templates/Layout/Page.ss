<% include Toast\Banner %>

<% loop $ContentBlocks.Sort('SortOrder') %>
    $ForTemplate
<% end_loop %>