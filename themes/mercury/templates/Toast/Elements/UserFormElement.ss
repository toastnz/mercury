<section class="element text-element">
	<div class="text-element__wrap text-element__wrap--{$Width}">

		<% if $IsFinished %>
			<div class="message success">
				$FormSuccessMessage
			</div>
		<% else %>
			$Form
		<% end_if %>
		
	</div>
</section>
