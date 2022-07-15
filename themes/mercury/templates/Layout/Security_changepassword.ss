<div class="login">

    <div class="login__form">
        <div class="login__form__wrap">

            <div class="login__form__wrap__logo">
                <% if $SiteConfig.Logo %>
                    <img src="$SiteConfig.Logo.URL" alt="$SiteConfig.Title" />
                <% else %>
                    $SVG('logo')
                <% end_if %>
            </div>

            <div class="login__form__wrap__copy">
               
                <h2>Reset</h2>
                
                <p>Reset your password by using the form below</p>

                $Form

            </div>

        </div>
    </div>

    <div class="login__image">
        <img src="{$Themedir}/dist/images/standard/placeholder.jpg" loading="lazy">
    </div>

</div>