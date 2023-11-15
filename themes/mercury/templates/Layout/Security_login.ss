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
            
                <h2>Login</h2>
                
                <p>Welcome back! Log in to access your site.</p>

                $Form

            </div>

        </div>
    </div>

    <div class="login__image">
        <img src="$ResourceURL('themes/mercury/dist/images/standard/placeholder.jpg')" loading="lazy">
    </div>

</div>