

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
                <h4>Lost your password?</h4>
                <p>
                    Enter your email andress and we will send you a link to reset it.
                    <br>
                    Head back to the <a href="{$BaseURL}Security/login">log in page</a>
                </p>
                $Form
            </div>

        </div>
    </div>

</div>