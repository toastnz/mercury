<%------------------------------------------------------------------
Header Search
------------------------------------------------------------------%>

<section class="search-pane [ js-postload ]">

    <div class="search-pane__wrap">

        <div class="search-pane__close"  onclick="document.body.classList.remove('searchActive');">
            <svg xmlns="http://www.w3.org/2000/svg" aria-hidden="true" focusable="false" class="icon icon-close icon--medium" fill="none" viewBox="0 0 24 24">
              <path d="M18.75 5.13496L5.25 18.8544" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
              <path d="M18.75 18.8544L5.25 5.13496" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
            </svg>
        </div>
        <div class="search-pane__form">
            $SearchForm
            <p class="search-pane__direction">Hit enter to search or ESC to close</p>
        </div>
    </div>

    <script>
        // Close the search pane when a user presses the escape key
        document.addEventListener('keydown', (event) => {
            if (event.key === 'Escape') {
                document.body.classList.remove('searchActive');
            }
        });
    </script>
    
</section>
