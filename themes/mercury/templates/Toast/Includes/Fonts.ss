<%-- --------------------------------------------------------------
Styles
-------------------------------------------------------------- --%>

<link rel="preload" crossorigin href="_resources/themes/mercury/dist/fonts/poppins-latin-ext-400.woff2?v=1.0.2" as="font" type="font/woff2">
<link rel="preload" crossorigin href="_resources/themes/mercury/dist/fonts/poppins-latin-ext-600.woff2?v=1.0.2" as="font" type="font/woff2">
<link rel="preload" crossorigin href="_resources/themes/mercury/dist/fonts/poppins-latin-ext-700.woff2?v=1.0.2" as="font" type="font/woff2">

<style> 

    @font-face {
      font-family: 'Poppins-Fallback';
      src: local("Arial");
      ascent-override: 105%; 
      descent-override: 35%;
      line-gap-override: 10%;
    } 

    @font-face {
      font-family: 'Poppins';
      font-style: normal;
      font-weight: 400;
      font-display: swap;
      src: local('Poppins'), url('_resources/themes/mercury/dist/fonts/poppins-latin-ext-400.woff2?v=1.0.2') format('woff2');
    }

    @font-face {
      font-family: 'Poppins';
      font-style: normal;
      font-weight: 600;
      font-display: swap;
      src: local('Poppins'), url('_resources/themes/mercury/dist/fonts/poppins-latin-ext-600.woff2?v=1.0.2') format('woff2');
    }

    @font-face {
      font-family: 'Poppins';
      font-style: normal;
      font-weight: 700;
      font-display: swap;
      src: local('Poppins'), url('_resources/themes/mercury/dist/fonts/poppins-latin-ext-700.woff2?v=1.0.2') format('woff2');
    } 

</style>


<style>
    html {
        font-size:10px;
        font-family: Poppins, sans-serif;
    }

    input,
    select,
    textarea {  
      font-family: Poppins, sans-serif;
    }

    .js-postload {
        display: none;
    }
</style>
