<%----------------------------------------------------------------
Download Block
----------------------------------------------------------------%>
<% if $Items %>
    <section class="element download-element">
        <div class="download-element__wrap download-element__wrap--{$Width}">

            <% loop $Items.Sort('SortOrder') %>

                <%----------------------------------------------------------------
                Download Block Item
                ----------------------------------------------------------------%>
                <% with $File %>
                    <a href="{$AbsoluteLink}" download class="download-element__item">

                        <div class="download-element__item__icon">
                            $SVG('download')
                        </div>

                        <div class="download-element__item__details">
                            <p class="no-margin">
                                <b class="h6">{$Title}</b><br>
                                {$Extension.upperCase} {$Size}
                            </p>
                        </div>
                            
                    </a>
                <% end_with %>
            <% end_loop %>

        </div>
    </section>
<% end_if %>
