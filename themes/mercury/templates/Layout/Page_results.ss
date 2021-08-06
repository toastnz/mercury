
<div class="banner__push"></div>

<section class="textBlock">
    <div class="textBlock__wrap">
        <h1>$Title</h1>
        <% if $Query %>
            <p>You searched for <span class="colour--primary">"{$Query}"</span></p>
        <% end_if %>
        <% if $Results %>
            <% if $Results.Count == 1 %>
                <p>There is <span class="colour--primary">1</span> result.</p>
            <% else %>
                <p>There are <span class="colour--primary">$Results.TotalItems</span> results.<% if $Results.MoreThanOnePage %> You are on page {$Results.CurrentPage} of {$Results.TotalPages}.<% end_if %></p>
            <% end_if %>
        <% end_if %>
    </div>
</section>

<% if $Results %>
<section class="linkBlock linkBlock--4">
    <div class="linkBlock__wrap">
        
        <a href="$Link" class="linkBlock__wrap__item [ js-in-view ]">

            <% if $Icon %>
                <div class="linkBlock__wrap__item__icon">
                    <img src="$Icon.URL">
                </div>
            <% else_if $Image %>
                
                <div class="linkBlock__wrap__item__image">
                    <img src="$Image.FocusFill(600,360).URL" />
                </div>
            <% end_if %>

            <div class="linkBlock__wrap__item__content">
                <div class="linkBlock__wrap__item__content__heading">
                    <h6>{$MenuTitle}</h6>
                </div>
                <p>{$Content.Summary}</p>
                <p class="linkBlock__wrap__item__content__link">Read More $SVG('arrow-right')</p>
            </div>

        </a>
         
    </div>
</section>
<% else %>
    <section class="textBlock">
        <div class="textBlock__wrap">
            <h5>Sorry there are no results for that query</h5>
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



