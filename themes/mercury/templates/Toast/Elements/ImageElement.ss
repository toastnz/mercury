<%------------------------------------------------------------------
Image block
------------------------------------------------------------------%>
<% if $Image %>

<section class="element image-element">
    <div class="image-element__wrap image-element__wrap--$Width">

        <% if $Width = 'full' %>
            <% include Toast/Includes/ResponsiveImage Sizes="320,480,768,1024,1280,1920" %>
        <% else_if $Width = 'wide' %>
            <% include Toast/Includes/ResponsiveImage Sizes="320,480,768,1024,1280" %>
        <% else_if $Width = 'standard' %>
            <% include Toast/Includes/ResponsiveImage Sizes="320,480,768,1024" %>
        <% else_if $Width = 'narrow' %>
            <% include Toast/Includes/ResponsiveImage Sizes="320,480,768" %>
        <% else_if $Width = 'tiny' %>
            <% include Toast/Includes/ResponsiveImage Sizes="320,480" %>
        <% end_if %>

        <% if $Caption %>
            <div class="image-element__wrap__caption ">
                <p>$Caption</p>
            </div>
        <% end_if %>

    </div>
</section>

<% end_if %>