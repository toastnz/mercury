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

			<% loop $PaginatedList %>
				<div class="blog-post">

					<a href="{$Link}" class="blog-post__image" style="background-image: url('$FeaturedImage.FocusFill(500, 500).URL');"></a>
					
					<div class="blog-post__content">
						<p class="colour--primary"><b><a href="{$Link}" class>$PublishDate.format('dd MMMM, YYYY')</a></b></p>
						<h4><a href="{$Link}" class>$Title</h4>
						
						<% if $Summary %>
							$Summary.limitCharacters(150)
						<% else %>
							<p>$Excerpt.limitCharacters(150)</p>
						<% end_if %>

						<% if $Tags %>
							<div class="blog-post__content__tags tags">
								<% loop $Tags %>
									<a href="{$Link}" class="blog-post__content__tags__tag">{$Title}</a>
								<% end_loop %>
							</div>
						<% end_if %>

					</div>
				</div>
			<% end_loop %>
			
		</div>

		<%-- -------------------------------------------- 
    	Sidebar
    	-------------------------------------------- --%>

		<div class="sidebar-wrap__sidebar">
			
			<%-- -------------------------------------------- 
			Categories
			-------------------------------------------- --%>

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
</section>