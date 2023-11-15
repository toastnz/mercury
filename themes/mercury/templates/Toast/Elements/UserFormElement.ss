<section class="text-block">
	<div class="text-block__wrap text-block__wrap--{$Width}">

		<% if $IsFinished %>
			<div class="message success">
				$FormSuccessMessage
			</div>
		<% else %>
			$Form
		<% end_if %>
		
	</div>
</section>
