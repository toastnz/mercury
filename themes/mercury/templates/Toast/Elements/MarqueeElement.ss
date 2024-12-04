<% if $Content %>
	<div class="marquee-element">
    	<div class="marquee-element__track [ marquee_{$ID} ]">
      		<span><b>{$Content}</b></span>
      		<span><b>{$Content}</b></span>
      		<span aria-hidden="true"><b>{$Content}</b></span>
      		<span aria-hidden="true"><b>{$Content}</b></span>
    	</div>
		<style>
			.marquee_{$ID} {
				 animation: marquee-move-text {$Speed}s linear infinite <% if $Direction = "left" %>forwards<% else %>reverse<% end_if %>;
			}
			
		</style>
  	</div>
<% end_if %>