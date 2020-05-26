<% if $PriceRange %>
	<p class="price">
		<strong class="value">$PriceRange.Min.Nice</strong>
		<% if $PriceRange.HasRange %>
			- <strong class="value">$PriceRange.Max.Nice</strong>
		<% end_if %>
		<span class="currency">$Price.Currency</span>
	</p>
<% else_if $Price %>
	<p class="price">
		<strong class="value">$Price.Nice</strong> <span class="currency">$Price.Currency</span>
	</p>
<% end_if %> 