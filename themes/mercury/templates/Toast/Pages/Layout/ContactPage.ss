<% include Toast\Banner %>

<section class="textBlock block">
	<div class="textBlock__wrap row">
		<div class="column">
			$Content
            <% if $ContactForm.Message %>
            <% with $ContactForm %>
                <p id="{$FormName}_error" class="message $MessageType">$Message</p>
            <% end_with %>
        <% else %>
            $ContactForm
        <% end_if %>
		</div>
	</div>
</section>