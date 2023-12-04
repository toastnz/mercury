<%-- -------------------------------------------- 
Hero element
-------------------------------------------- --%>

<div class="hero-element [ element {$Width} ]">
    <div class="hero-element__wrap">

        <% if $BackgroundImage %>
            <div class="hero-element__background">
                <img src="$BackgroundImage.FocusFill(1920,700).URL" width="1920" height="700" loading="lazy" alt="$BackgroundImage.alt">
            </div>
        <% end_if %>

        <div class="hero-element__content">
            <div class="hero-element__constraint">
                $Content
            </div>
        </div>

    </div>
</div>
