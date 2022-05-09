<!-- -----------------------------------------------------------------
MobileMenu Section
------------------------------------------------------------------ -->

<section class="mobileMenu [ js-postload ]">
    <div class="mobileMenu__wrap">
        <% loop $Menu(1) %>
            <div class="mobileMenu__wrap__item">
                <a class="mobileMenu__wrap__item__link {$LinkingMode}" href="$Link">$MenuTitle.UpperCase.XML</a>
            </div>
        <% end_loop %>
    </div>
</section>
