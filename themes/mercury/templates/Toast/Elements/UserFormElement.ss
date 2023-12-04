<section class="text-element [ element {$Width } ]">
	<div class="text-element__wrap">

		<% if $IsFinished %>
			<div class="message success">
				$FormSuccessMessage
			</div>
		<% else %>
			$Form
		<% end_if %>
		
	</div>
</section>
