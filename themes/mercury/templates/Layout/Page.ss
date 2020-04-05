<% include Toast\Banner %>

<section class="textBlock block">
	<div class="textBlock__wrap row">
		<div class="column">
			$Form
		</div>
	</div>
</section>

<% loop $ContentBlocks %>
    $ForTemplate
<% end_loop %>