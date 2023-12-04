<%----------------------------------------------------------------
Download element
----------------------------------------------------------------%>
<% if $Items %>
    <div class="download-element [ element {$width} ]">
        <div class="download-element__wrap">

            <% loop $Items.Sort('SortOrder') %>

                <%----------------------------------------------------------------
                Item
                ----------------------------------------------------------------%>

                <% with $File %>
                
                    <a href="{$AbsoluteLink}" download class="download-element__item">

                        <div class="download-element__icon">
                            $SVG('download')
                        </div>

                        <div class="download-element__details">
                            <p class="no-margin">
                                <b class="h6">{$Title}</b><br>
                                {$Extension.upperCase} {$Size}
                            </p>
                        </div>
                            
                    </a>

                <% end_with %>

            <% end_loop %>

        </div>
    </div>
<% end_if %>
