<%------------------------------------------------------------------
Popup
------------------------------------------------------------------%>

<section class="popup [ js-postload ]">
    <div class="popup__wrap">
        <div class="popup__wrap__close" onclick="hidePopup()">
            <svg xmlns="http://www.w3.org/2000/svg" aria-hidden="true" focusable="false" class="icon icon-close icon--medium" fill="none" viewBox="0 0 24 24">
              <path d="M18.75 5.13496L5.25 18.8544" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
              <path d="M18.75 18.8544L5.25 5.13496" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
            </svg>
        </div>
        <div class="popup__wrap__content">
            <div class="popup__wrap__content__heading">
                <h2 class="colour--white">$Siteconfig.PopupHeading</h2>
            </div>
            <div class="popup__wrap__content__copy">
                $Siteconfig.PopupCopy
            </div>
        </div>
    </div>
</section>

<script>
document.addEventListener("DOMContentLoaded", function() {
    /**
     * Get a cookie by name
     * @param {string} name 
     * @returns {boolean}
     */
    function getCookie(name) {
      var value = `; ${document.cookie}`;
      var parts = value.split(`; ${name}=`);
      if (parts.length === 2) return parts.pop().split(';').shift();
    }


    /**
    * Show the newsletter popup
    */
    function showPopup() {
      document.body.classList.add('popupActive');
    } 


    /**
    * Check if the popup has been closed before
    */
    setTimeout(function () {
      if (getCookie('hasClosedPopup') !== 'true') {
          showPopup();
      }
    }, 3000);
    

    /**
    * Close the popup
    */
    window.hidePopup = function() {
      document.body.classList.remove('popupActive');
      document.cookie = 'hasClosedPopup=true; max-age=' + (60 * 60 * 24 * 30);
    }


    // Close the search pane when the user hits the escape key
    document.onkeydown = function(evt) {
        evt = evt || window.event;
        if (evt.keyCode == 27) {
            hidePopup();
        }
    };
});
</script>