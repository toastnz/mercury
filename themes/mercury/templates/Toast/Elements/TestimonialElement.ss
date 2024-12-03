<%------------------------------------------------------------------
Testimonial element
------------------------------------------------------------------%>

<% if $Items.Count %>
    <div class="testimonial-element [ embla ][ element {$Width} ][ js-embla-{$ID} ]">
        
        <div class="testimonial-element__wrap">

            <button class="embla__prev" name="previous" aria-label="Slide left">
                <svg viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <path d="M12.75 16.2505L6.5 10.0005L12.75 3.75049" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                </svg>
            </button>

            <button class="embla__next" name="next" aria-label="Slide right">
                <svg viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <path d="M7.5 3.74121L13.75 9.99121L7.5 16.2412" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                </svg>
            </button>

            <b class="testimonial-element__count colour--white [ embla__count ]">-</b>

            <div class="testimonial-element__dots [ embla__dots ]"></div>

            <% if $Heading %>
                <div class="testimonial-element__heading">
                    <h3>$Heading.XML</h3>
                </div>
            <% end_if %>
            
            <div class="testimonial-element__viewport [ embla__viewport ]">

                <div class="testimonial-element__slider [ embla__container ]">

                    <% loop $Items.Sort('SortOrder') %>
                        <div class="testimonial-element__item [ embla__slide ]">

                            <img src="$ResourceURL('themes/mercury/dist/images/svg/quotes.svg')" width="88" height="72" loading="lazy" alt="quote marks">

                            <div class="testimonial-element__testimonial">
                                <h6 class="colour--white">$Testimonial.XML</h6>
                            </div>
    
                            <div class="testimonial-element__credit">

                                <% if $Attribution %>
                                    <p class="colour--white"><b>$Attribution.XML</b></p>
                                <% end_if %>

                                <% if $Description %>
                                    <p class="colour--white smaller no-margin">$Description.XML</p>
                                <% end_if %>

                            </div>

                        </div>
                    <% end_loop %>

                </div>
            </div>

        </div>

       
    </div>
<% end_if %>

