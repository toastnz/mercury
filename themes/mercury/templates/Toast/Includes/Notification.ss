
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
        <% if $$Siteconfig.NotificationCanBeClosed %>
            <div class="notification__wrap__close" onclick="hideNotification()">
                <svg xmlns="http://www.w3.org/2000/svg" aria-hidden="true" focusable="false" class="icon icon-close icon--medium" fill="none" viewBox="0 0 24 24">
                  <path d="M18.75 5.13496L5.25 18.8544" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                  <path d="M18.75 18.8544L5.25 5.13496" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                </svg>
            </div>
        <% end_if %>
    </div>
</section>
