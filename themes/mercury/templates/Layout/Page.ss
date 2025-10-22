
<%-- <% include Toast\Banner %> --%>

<%-- $ElementalArea --%>

<style>
    .header,
    .footer{
        display:none;
    }

    .app {
        width: 100%;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        background-color: #f0f0f0;
    }
</style>
<div class="app" id="root"></div>

<script>
    window.PRELOADED_PAGES = $getPagesDataAsJSON.RAW;
</script>
