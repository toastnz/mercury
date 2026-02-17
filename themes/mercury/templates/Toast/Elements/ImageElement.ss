<%------------------------------------------------------------------
Image element
------------------------------------------------------------------%>
<% if $Image %>
    <section class="image-element <% if $Caption %>image-element--caption<% end_if %> [ element {$Width} ]">
        <div class="image-element__wrap">
            <% include Toast/Includes/ResponsiveImage Width=$Width %>
            <% if $Caption %>
                <div class="image-element__caption ">
                    <p class="smaller no-margin">$Caption</p>
                </div>
            <% end_if %>
        </div>
    </section>
<% end_if %>