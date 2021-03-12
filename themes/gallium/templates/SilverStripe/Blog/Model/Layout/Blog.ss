<% include Toast\Banner %>

$Breadcrumbs

<div class="sidebarWrapper">
	<div class="sidebarWrapper__content">
		<div class="contentBlock textBlock">
			<div class="contentBlock__wrap  row">
				<div class="column">
					{$Content}
				</div>
			</div>
		</div>

		<%----------------------------------------------------------------
		Static Link Block
		----------------------------------------------------------------%>

		<section class="news">
			<div class="news__wrap">
				<div class="news__wrap__grid">
					<% loop $PaginatedList %>
					<a href="$Link" class="news__wrap__grid__item" data-aos="fade-up">
						<div class="news__wrap__grid__item__image" style="background-image:url('{$FeaturedImage.FocusFill(360, 360).URL}')"></div>
						<div class="news__wrap__grid__item__copy">
							<p class="datePublished">Posted $PublishDate.ago</p>
							<h5 class="news__wrap__grid__item__copy__title"><b>$Title
									$SVG('chevron-small-right-black')</b></h5>
							<% if $Summary %>
							$Summary
							<% else %>
							<p>$Excerpt</p>
							<% end_if %>
							<p class="news__wrap__grid__item__copy__tags">
								<% loop $Categories %>
								<span class="tag">$Title</span>
								<% end_loop %>
							</p>
						</div>
					</a>
					<% end_loop %>
				</div>
			</div>
		</section>



	</div>
	<div class="sidebarWrapper__sidebar sidebarWrapper__sidebar--no-padding [ js-sticky-sidebar ]">

		<div class="minorPadding">
			<h6>Categories</h6>
			<p>
				<a href="$Top.Link" class="tag ">All</a>
				<% loop $Categories %>
				$getCurrentCategory
				<a href="$Link" class="tag  <% if $Title = $Title %><% end_if %>">$Title</a>
				<% end_loop %>
			</p>
		</div>

	</div>
</div>
