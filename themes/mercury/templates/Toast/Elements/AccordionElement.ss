<%-- -------------------------------------------- 
Accordion element
-------------------------------------------- --%>

<section class="accordion-element [ element ]">

    <div class="accordion-element__wrap accordion-element__wrap--{$Width}">

        <% loop $Items %>

            <%-- -------------------------------------------- 
            Accordion element item
            -------------------------------------------- --%>

            <div class="accordion-element__item [ js-accordion-element ]" id="accordion_{$Pos}_{$ID}">

                <button class="accordion-element__trigger [ js-trigger ]" aria-expanded="false" aria-controls="accordion_section_{$Pos}_{$ID}">
                    <p class="h5 no-margin">{$Title}</p>
                </button>

                <div class="accordion-element__content [ js-content ]" role="region" aria-labelledby="accordion_{$Pos}_{$ID}">
                    <div class="accordion-element__inner">
                        {$Content}
                    </div>
                </div>

            </div>

        <% end_loop %>

    </div>
    
</section>