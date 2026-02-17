<% if $Image %>
    <picture>
        <source media="(max-width: 320px)" srcset="$Image.ScaleMaxWidth(320).Convert('webp').URL">
        <% if $Width != 'tiny' %>
            <source media="(max-width: 480px)" srcset="$Image.ScaleMaxWidth(480).Convert('webp').URL">
        <% end_if %>
        <% if $Width != 'tiny' && $Width != 'narrow' %>
            <source media="(max-width: 768px)" srcset="$Image.ScaleMaxWidth(768).Convert('webp').URL">
        <% end_if %>
        <% if $Width = 'full' || $Width = 'wide' || $Width = 'standard' || $Width = '' %>
            <source media="(max-width: 984px)" srcset="$Image.ScaleMaxWidth(984).Convert('webp').URL">
        <% end_if %>
        <% if $Width = 'full' || $Width = 'wide' %>
            <source media="(max-width: 1280px)" srcset="$Image.ScaleMaxWidth(1280).Convert('webp').URL">
        <% end_if %>
        <% if $Width = 'full' %>
            <source media="(max-width: 1920px)" srcset="$Image.ScaleMaxWidth(1920).Convert('webp').URL">
        <% end_if %>
        <img src="<% if $Width = 'full' %>$Image.ScaleMaxWidth(1920).Convert('webp').URL<% else_if $Width = 'wide' %>$Image.ScaleMaxWidth(1280).Convert('webp').URL<% else_if $Width = 'narrow' %>$Image.ScaleMaxWidth(768).Convert('webp').URL<% else_if $Width = 'tiny' %>$Image.ScaleMaxWidth(320).Convert('webp').URL<% else %>$Image.ScaleMaxWidth(984).Convert('webp').URL<% end_if %>" alt="$Image.AltText" loading="lazy">
    </picture>
<% end_if %>