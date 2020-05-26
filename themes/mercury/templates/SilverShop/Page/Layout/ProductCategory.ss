<% include Toast\Banner %>

$Breadcrumbs

<% loop $ContentBlocks.Sort('SortOrder') %>
    $ForTemplate
<% end_loop %>

<% if $Products %>
    <section class="productCategory">
        <div class="productCategory__grid">
            <% loop $Products %>
                <% include SilverShop\Includes\ProductGroupItem %>
            <% end_loop %>
            <% include SilverShop\Includes\ProductGroupPagination %>
        </div>
    </section>
<% end_if %>
