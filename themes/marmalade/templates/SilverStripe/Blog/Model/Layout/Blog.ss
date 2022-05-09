<% include Toast\Banner %>

$Breadcrumbs

<!-- -----------------------------------------------------------------
Blog Section
------------------------------------------------------------------ -->
<section class="blog">
	<div class="blog__wrap">

		<div class="blog__wrap__filter">
			
		</div>

		<div class="blog__wrap__grid">

			<% loop $PaginatedList %>
				<div class="blog__wrap__grid__item">

					<a href="{$Link}" class="blog__wrap__grid__item__image" style="background-image: url('$FeaturedImage.FocusFill(500, 500).URL');">
					</a>

					<div class="blog__wrap__grid__item__content">
						<p class="colour--primary"><b><a href="{$Link}" class>$PublishDate.format('dd MMMM, YYYY')</a></b></p>
						<h4><a href="{$Link}" class>$Title</h4>
						<% if $Summary %>
							$Summary.limitCharacters(150)
						<% else %>
							<p>$Excerpt.limitCharacters(150)</p>
						<% end_if %>

						<% if $Tags %>
							<div class="blog__wrap__grid__item__content__tags tags">
								<% loop $Tags %>
									<a href="{$Link}" class="blog__wrap__grid__item__content__tags__tag tag">{$Title}</a>
								<% end_loop %>
							</div>
						<% end_if %>
						

					</div>
				</div>
			<% end_loop %>
			
		</div>

		<div class="blog__wrap__sidebar">
			
			<!-- -----------------------------------------------------------------
			Categories
			------------------------------------------------------------------ -->

			<div class="blog__wrap__sidebar__categories">
				<div class="blog__wrap__sidebar__categories__heading">
					<h4>Tags</h4>
				</div>
				<% if $Tags %>
					<div class="blog__wrap__sidebar__categories__tags tags">
						<% loop $Tags %>
							<a href="{$Link}" class="blog__wrap__sidebar__categories__tags__tag tag">{$Title}</a>
						<% end_loop %>
					</div>
				<% end_if %>
			</div>

			<!-- -----------------------------------------------------------------
			Recent Posts
			------------------------------------------------------------------ -->

			<div class="blog__wrap__sidebar__recent">
				<div class="blog__wrap__sidebar__recent__heading">
					<h4>Recent Posts</h4>
				</div>
				<div class="blog__wrap__sidebar__recent__list">
					<% loop $LatestNews(3).Exclude('ID', $ID) %>
						<a href="{$Link}" class="blog__wrap__sidebar__recent__list__item">
							<h6><b>$Title</b>$SVG('arrow-right') </h6>
							<p class="colour--primary smaller">$PublishDate.format('dd MMMM, YYYY')</p>
						</a>
					<% end_loop %>
				</div>
			</div>

		</div>

	</div>
</section>



<div class="blog" style="display:none;">
	<div class="blog__wrap">


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
	<div class="blog__sidebar blog__sidebar--no-padding [ js-sticky-sidebar ]">

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
