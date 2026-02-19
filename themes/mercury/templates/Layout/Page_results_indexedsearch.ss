<div class="text-element [ element ]">
    <div class="text-element__wrap [ standard ]">
        
        <h1>$Title</h1>
        
        <% if $Query %>
            <p>You searched for "$Query"</p>
        <% end_if %>
        
        <% if not $Results %>
            <p class="searchNoResults">Sorry, your search query did not return any results.</p>
        <% end_if %>
        
    </div>
</div>

<div class="link-element [ element standard ]">
    <div class="link-element__wrap link-element__wrap--3">
        <% loop $Results %>
            <a href="$Link" class="link-element__item bordered ">
                <div class="link-element__image">
                    <img src="$ResourceURL('themes/mercury/dist/images/standard/placeholder.webp')" loading="lazy">
                </div>
                <div class="link-element__content">
                    <p class="h6">$Title.XML</p>
                    <p>$Summary.XML</p>
                    <p class="arrow-link no-margin"><b>Read more</b></p>
                </div>
            </a>
        <% end_loop %>
    </div>
</div>

<div class="text-element [ element ]">
    <div class="text-element__wrap [ standard ]">
        <% if $Results.MoreThanOnePage %>
            <div class="pagination">
                <% if $Results.NotFirstPage %>
                    <a class="prev" href="$Results.PrevLink">Previous</a>
                <% end_if %>
                <span>
                    <% loop $Results.Pages %>
                        <% if $CurrentBool %>
                            $PageNum
                        <% else %>
                            <a href="$Link" class="page-number">$PageNum</a>
                        <% end_if %>
                    <% end_loop %>
                </span>
                <% if $Results.NotLastPage %>
                    <a class="next" href="$Results.NextLink">Next</a>
                <% end_if %>            
            </div>
        <% end_if %>
    </div>
</div>


