<% include Toast\Banner %>

$Breadcrumbs

<div class="sidebarWrapper">
    <div class="sidebarWrapper__content">
        <div class="contentBlock image-block">
            <div class="contentBlock__wrap image-block__wrap row">
                <div class="column">

                    <picture>
                        <source media="(min-width: 1200px)" srcset="$FeaturedImage.FocusFill(1920,1080).URL">
                        <source media="(min-width: 800px)" srcset="$FeaturedImage.FocusFill(960,540).URL">
                        <source media="(min-width: 320px)" srcset="$FeaturedImage.FocusFill(480,270).URL">
                        <img src="$FeaturedImage.FocusFill(1920,1080).URL" alt="$FeaturedImage.Title">
                    </picture>
                </div>

            </div>
        </div>

        <% loop $ContentBlocks.Sort('SortOrder') %>
        $ForTemplate
        <% end_loop %>

    </div>
    <div class="sidebarWrapper__sidebar sidebarWrapper__sidebar--no-padding [ js-sticky-sidebar ]">

        <div class="minorPadding">
            <h6>Categories</h6>
            <p>
                <% loop $Parent.Categories %>
                $getCurrentCategory
                <a href="$Link" class="tag">$Title</a>
                <% end_loop %>
            </p>
        </div>

    </div>

</div>

<% include SilverStripe\Blog\BlogSideBar %>
