<div class="banner__push"></div>

<section class="text-element text-element--off-white">
    <div class="text-element__wrap">
        <h1>$Title</h1>
        <%-- <% if $Query %> --%>
            <p>You searched for <span class="colour--primary">"{$Query}"</span>.</p>
        <%-- <% end_if %> --%>
        <% if $Results %>
            <% if $Results.Count == 1 %>
                <p>There is <span class="colour--primary">1</span> result.</p>
            <% else %>
                <p>
                    There are <span class="colour--primary">$Results.TotalItems</span> results.<% if $Results.MoreThanOnePage %> You are on page {$Results.CurrentPage} of {$Results.TotalPages}.<% end_if %>
                    <span onclick="showSearchPane(event);" class="colour--primary" style="cursor:pointer;">Search again</span>
                </p>
            <% end_if %>
        <% end_if %>
    </div>
</section>


<% if $Results.Count %>
    <section class="link-element block">

        <div class="link-element__wrap">
            
            <% loop $Results %>
                <a href="$Link.LinkURL" class="link-element__wrap__item <% if not $Icon && not $image %>bordered <% end_if %>">

                    <% if $Image %>
                        <img  class="link-element__wrap__item__image" src="$Image.FocusFill(600,300).URL" width="600" height="300" loading="lazy">
                    <% end_if %>

                    <div class="link-element__wrap__item__content">
                        <div class="link-element__wrap__item__content__heading">
                            <h6>$MenuTitle.XML</h6>
                        </div>
                        <p>$Content.Summary</p>
                        <p class="link-element__wrap__item__content__link arrow-link">
                            Read More 
                        </p>
                    </div>

                </a>
            <% end_loop %>

        </div>

    </section>

<% else %>
    <section class="text-element">
        <div class="text-element__wrap">
            <p>&nbsp;</p>
            <h5>Sorry there are no results for that query</h5>
            <p>Double check your search for any typos or spelling mistakes - or try a different <span onclick="showSearchPane(event);" class="colour--primary" style="cursor:pointer;">search term</span>.</p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
        </div>
    </section>
<% end_if %>


<% if $Results.MoreThanOnePage %>
    <div class="pagination wysiwyg">
        <div class="innerWrap">
            <% loop $Results.Pages %>
                <% if $CurrentBool %>
                    <span class="pagination__item pagination__item--current">$PageNum</span>
                <% else %>
                    <a href="$Link" class="pagination__item pagination__item--link">$PageNum</a>
                <% end_if %>
            <% end_loop %>
        </div>
    </div>
<% end_if %>



