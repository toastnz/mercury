

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
                <h4>Lost your password?</h4>
                <p>
                    Enter your email andress to receive a reset link.
                </p>
                $Form
                    <a href="{$BaseURL}Security/login">log in page</a>
            </div>

        </div>
    </div>

      <div class="login__image">
        <img src="{$Themedir}/dist/images/standard/placeholder.jpg" loading="lazy">
    </div>

</div>