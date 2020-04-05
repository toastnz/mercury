<% include Toast\Banner %>

<section class="textBlock block">
	<div class="textBlock__wrap row">
		<div class="column">
			$Content
            $Form
		</div>
	</div>
</section>

<% loop $ContentBlocks %>
    $ForTemplate
<% end_loop %>