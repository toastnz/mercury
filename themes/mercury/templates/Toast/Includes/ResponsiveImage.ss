<% if $getSizes($Sizes) %>

<picture>
    <% loop $getSizes($Sizes) %>
        <% if $Pos = 1 %>
            <source media="(max-width: {$Size}px)" srcset="$Up.Image.ScaleMaxWidth($Size).Convert('webp').URL">
        <% else %>
            <source media="(min-width: {$Size}px)" srcset="$Up.Image.ScaleMaxWidth($Size).Convert('webp').URL">
        <% end_if %>
    <% end_loop %>
    <img loading="lazy" 
        alt="$Image.AltText"
        width="<% loop $getSizes($Sizes).Last %>$Size<% end_loop %>"
        height="<% loop $getSizes($Sizes).Last %>$Up.Image.ScaleMaxWidth($Size).Convert('webp').Height<% end_loop %>" 
        onerror="this.classList.add('broken')"  
        src="<% loop $getSizes($Sizes).Last %>$Up.Image.ScaleMaxWidth($Size).Convert('webp').URL<% end_loop %>">
</picture>
<% else %>
    <img src="$Image.URL" width="$Image.Width" height="$Image.Height" alt="$Image.Title.ATT" loading="lazy">
<% end_if %>