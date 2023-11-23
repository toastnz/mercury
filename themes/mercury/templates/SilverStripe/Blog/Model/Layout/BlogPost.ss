<% include Toast\Banner %>

$Breadcrumbs

<%-- -------------------------------------------- 
Sidebar
-------------------------------------------- --%>

<section class="sidebar-wrap">

    <%-- -------------------------------------------- 
    Content
    -------------------------------------------- --%>
	<div class="sidebar-wrap__content">

		<% if $FeaturedImage %>
			<section class="image-element" style="margin:0 auto;">
				<div class="image-element__wrap">
					<img src="$FeaturedImage.FocusFill(940,540).URL" width="940" height="540" loading="lazy"  alt="$FeaturedImage.Title">
				</div>
			</section>
		<% end_if %>

		$ElementalArea

    </div>

    <%-- -------------------------------------------- 
    Sidebar
    -------------------------------------------- --%>
    <div class="sidebar-wrap__sidebar">
        
        <div class="sidebar-wrap__sidebar__categories">
			<div class="sidebar-wrap__sidebar__categories__heading">
				<h4>Tags</h4>
			</div>
			<% if $Categories %>
				<div class="sidebar-wrap__sidebar__categories__tags tags">
					<% loop $Categories %>
						<a href="{$Link}" class="sidebar-wrap__sidebar__categories__tags__tag tag">{$Title}</a>
					<% end_loop %>
				</div>
			<% end_if %>
		</div>

        <%-- -------------------------------------------- 
	    Recent posts
	    -------------------------------------------- --%>
    
	    <div class="sidebar-wrap__sidebar__recent">
	    	<div class="sidebar-wrap__sidebar__recent__heading">
	    		<h4>Recent Posts</h4>
	    	</div>
	    	<div class="sidebar-wrap__sidebar__recent__list">
	    		<% loop $LatestNews(3).Exclude('ID', $ID) %>
	    			<a href="{$Link}" class="sidebar-wrap__sidebar__recent__list__item">
	    				<h6><b>$Title</b>$SVG('arrow-right') </h6>
	    				<p class="colour--primary smaller">$PublishDate.format('dd MMMM, YYYY')</p>
	    			</a>
	    		<% end_loop %>
	    	</div>
	    </div>

    </div>

    

</div>

