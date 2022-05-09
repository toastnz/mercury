<div class="login">

    <div class="login__image">

    </div>

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
                <h4>Login to your account</h4>
                <p>
                    Welcome back! Log in to access $SiteConfig.Title
                    <br>
                    Did you <a href="{$BaseURL}Security/lostpassword">forget your password?</a>
                </p>
                $Form
            </div>

        </div>
    </div>

</div>