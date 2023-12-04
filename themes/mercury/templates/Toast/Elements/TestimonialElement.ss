<%------------------------------------------------------------------
Testimonial element
------------------------------------------------------------------%>

<% if $Items.Count %>
    <div class="testimonial-element [ element {$Width} ]">
        
        <div class="testimonial-element__wrap">

            <% if $Heading %>
                <div class="testimonial-element__heading">
                    <h3>$Heading.XML</h3>
                </div>
            <% end_if %>
            
            <%------------------------------------------------------------------
            Slider
            ------------------------------------------------------------------%>
            <div class="testimonial-element__slider [ js-slider-testimonial-{$ID} ]">
                <% loop $Items.Sort('SortOrder') %>
                    <%------------------------------------------------------------------
                    Item
                    ------------------------------------------------------------------%>
                    <div class="testimonial-element__item">

                        <img src="$ResourceURL('themes/mercury/dist/images/svg/quotes.svg')" width="88" height="72" loading="lazy">

                        <div class="testimonial-element__testimonial">
                            <h6 class="colour--white">$Testimonial.XML</h6>
                        </div>
    
                        <div class="testimonial-element__credit">
                            
                            <% if $Attribution %>
                                <p class="colour--white"><b>$Attribution.XML</b></p>
                            <% end_if %>

                            <% if $Description %>
                                <p class="colour--white smaller">$Description.XML</p>
                            <% end_if %>

                        </div>

                    </div>
                <% end_loop %>

            </div>

        </div>

        <script defer async src="https://cdnjs.cloudflare.com/ajax/libs/tiny-slider/2.9.4/min/tiny-slider.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tiny-slider/2.9.4/tiny-slider.css" media="print" onload="this.media='all'">

        <script>
        document.addEventListener('DOMContentLoaded', function() {
            tns({
              container:'.js-slider-testimonial-{$ID}' ,
              items: 1,
              mouseDrag: true,
              nav: true,
              controls: true,
              slideBy: 1,
              loop: true
            });
          });

        </script>

        <style> 
          .tns-slider {
              display: flex;
          }
        </style>
    </div>
<% end_if %>

