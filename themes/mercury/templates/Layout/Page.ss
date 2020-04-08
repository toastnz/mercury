<% include Toast\Banner %>

$Breadcrumbs

<section class="textBlock block">
	<div class="textBlock__wrap row">
		<div class="column">
			$Form
		</div>
	</div>
</section>

<% loop $ContentBlocks.Sort('SortOrder') %>
    $ForTemplate
<% end_loop %>