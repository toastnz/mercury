<%------------------------------------------------------------------
Header Search
------------------------------------------------------------------%>

<section class="searchPane [ js-postload ]">
    <div class="searchPane__wrap">
        <div class="searchPane__wrap__close"  onclick="document.body.classList.remove('searchActive');">
            <svg xmlns="http://www.w3.org/2000/svg" width="36" height="36" viewBox="0 0 36 36">
                <path fill-rule="evenodd" d="M8.18 0 0 8.18.82 9l9 8.988L0 27.807l.82.807 7.36 7.362 9.82-9.82 9.82 9.82 7.36-7.362.82-.807-9.82-9.82 9-8.987.82-.82L27.82 0 18 9.82 8.18 0Zm0 3.265 9.82 9.82 9.82-9.82 4.903 4.904-9.82 9.819.82.807 9 9-4.904 4.916L18 22.89l-9.82 9.82-4.903-4.916 9-9 .82-.807-9.82-9.82 4.904-4.903Z"/>
            </svg>
        </div>
        <div class="searchPane__wrap__form">
            $SearchForm
            <p class="searchPane__wrap__form__direction">Hit enter to search or ESC to close</p>
        </div>
    </div>
</section>

<script>
    // Close the search pane when the user hits the escape key
    document.onkeydown = function(evt) {
        evt = evt || window.event;
        if (evt.keyCode == 27) {
            document.body.classList.remove('searchActive');
        }
    };
</script>