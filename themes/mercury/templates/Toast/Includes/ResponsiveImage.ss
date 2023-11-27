<% if $getSizes($Sizes) %>
<img 
    src="<% loop $getSizes($Sizes).Last %>$Up.Image.ScaleMaxWidth($Size).URL<% end_loop %>" 
    alt="$Image.Title.ATT" 
    srcset="<% loop $getSizes($Sizes) %>$Up.Image.ScaleMaxWidth($Size).URL {$Size}w,<% end_loop %>"
    loading="lazy" 
    width="<% loop $getSizes($Sizes).Last %>$Size<% end_loop %>"
    height="<% loop $getSizes($Sizes).Last %>$Up.Image.ScaleMaxWidth($Size).Height<% end_loop %>" 
    sizes="100vw" />
<% else %>
    <img src="$Image.URL" width="$Image.Width" height="$Image.Height" alt="$Image.Title.ATT" loading="lazy">
<% end_if %>