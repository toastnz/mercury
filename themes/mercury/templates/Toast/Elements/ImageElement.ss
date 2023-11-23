<%------------------------------------------------------------------
Image block
------------------------------------------------------------------%>
<% if $Image %>

<section class="element image-element">
    <div class="image-element__wrap image-element__wrap--{$Width}">

        <img src="$Image.FocusFill(960,540).URL" width="960" height="540" loading="lazy"  alt="$Image.Title">

        <% if $Caption %>
            <div class="image-element__wrap__caption ">
                <p>$Caption</p>
            </div>
        <% end_if %>
    </div>
</section>

<% end_if %>