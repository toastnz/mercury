
<script>
document.addEventListener("DOMContentLoaded", () => {
    /**
     * Get a cookie by name.
     * @param {string} name - The name of the cookie.
     * @returns {string | undefined} - The cookie value or undefined if not found.
     */
    const getCookie = (name) => {
        const match = document.cookie.match(new RegExp(`(?:^|; )${name}=([^;]*)`));
        return match ? decodeURIComponent(match[1]) : undefined;
    };

    /**
     * Show the newsletter popup.
     */
    const showNotification = () => {
        document.body.classList.add("notificationActive");
    };

    /**
     * Hide the newsletter popup and set a cookie to remember the action.
     */
    window.hideNotification = () => {
        document.body.classList.remove("notificationActive");
        document.cookie = `hasClosedNotification=true; max-age=${60 * 60 * 24 * 30}; path=/`;
    };

    // Check if the popup should be displayed
    if (getCookie("hasClosedNotification") !== "true") {
        showNotification();
    }
});
</script>

<%------------------------------------------------------------------
Notification
------------------------------------------------------------------%>

<section class="notification [ js-postload ]">
    <div class="notification__wrap">
        <div class="notification__wrap__content">
            <p class="colour--white">
                $Siteconfig.NotificationCopy
                <% if $SiteConfig.NotificationLink  %>
                <a $SiteConfig.NotificationLink.TargetAttr href="$SiteConfig.NotificationLink.LinkURL">$SiteConfig.NotificationLink.Title.XML </a>
                <% end_if %>
            </p>
        </div>
        <% if $NotificationCanBeClosed %>
            <div class="notification__wrap__close" onclick="hideNotification()">
                <svg xmlns="http://www.w3.org/2000/svg" width="36" height="36" viewBox="0 0 36 36">
                    <path fill-rule="evenodd" d="M8.18 0 0 8.18.82 9l9 8.988L0 27.807l.82.807 7.36 7.362 9.82-9.82 9.82 9.82 7.36-7.362.82-.807-9.82-9.82 9-8.987.82-.82L27.82 0 18 9.82 8.18 0Zm0 3.265 9.82 9.82 9.82-9.82 4.903 4.904-9.82 9.819.82.807 9 9-4.904 4.916L18 22.89l-9.82 9.82-4.903-4.916 9-9 .82-.807-9.82-9.82 4.904-4.903Z"/>
                </svg>
            </div>
        <% end_if %>
    </div>
</section>
