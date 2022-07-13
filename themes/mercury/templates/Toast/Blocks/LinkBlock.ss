<% if $Items.Count %>
    <section class="link-block block">

        <div class="link-block__wrap link-block__wrap--{$Columns}">
            
            <% loop $Items.Sort('SortOrder') %>
                <a href="$Link.LinkURL" class="link-block__wrap__item <% if not $Icon && not $image %>bordered <% end_if %>[ js-in-view ]">

                    <% if $Icon %>
                        <div class="link-block__wrap__item__icon">
                            <img src="$Icon.URL">
                        </div>
                    <% else_if $Image %>
                        <img  class="link-block__wrap__item__image" src="$Image.FocusFill(600,300).URL" width="600" height="300" loading="lazy">
                    <% end_if %>

                    <div class="link-block__wrap__item__content">
                        <div class="link-block__wrap__item__content__heading">
                            <h6>$Title.XML</h6>
                        </div>
                        <p>$Summary.XML</p>
                        <p class="link-block__wrap__item__content__link">
                            Read More <svg xmlns="http://www.w3.org/2000/svg" width="14" height="10" viewBox="0 0 14 10"><path fill-rule="evenodd" d="M8.423.015 13.408 5 8.422 9.985 7.38 8.943l3.2-3.2H.09V4.257H10.58l-3.2-3.2L8.424.016Z"/></svg>
                        </p>
                    </div>

                </a>
            <% end_loop %>

        </div>

    </section>
<% end_if %>