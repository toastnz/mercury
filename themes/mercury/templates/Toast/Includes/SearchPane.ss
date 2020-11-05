<%------------------------------------------------------------------
Header Search
------------------------------------------------------------------%>

<section class="searchPane">
    <div class="searchPane__wrap">
        <div class="searchPane__wrap__close [ js-close-search ]">
            $SVG('close')
        </div>
        <div class="searchPane__wrap__form">
            <form id="SearchForm_SearchForm" action="/search-results/SearchForm/" method="get" enctype="application/x-www-form-urlencoded">
                <fieldset>
                    <div id="SearchForm_SearchForm_Search_Holder" class="field input-wrap input-wrap--text text">
                        <label class="left" for="SearchForm_SearchForm_Search">Search</label>
                        <input type="text" name="Search" class="text" id="SearchForm_SearchForm_Search" placeholder="Looking for something?">
                    </div>
                    <button type="submit" name="action_results" value="Go" class="action" id="SearchForm_SearchForm_action_results">
                        <span>Go</span>
                    </button>
                </fieldset>
            </form>
            <p class="searchPane__wrap__form__direction">Hit enter to search or ESC to close</p>
        </div>
    </div>
</section>