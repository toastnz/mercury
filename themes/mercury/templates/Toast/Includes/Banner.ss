<div class="banner [ js-banner ][ embla ]<% if $BannerSlides.count > 1 %>[ js-embla-{$ID} ]<% end_if %> <% if $TransparentHeader %>has-transparent-header<% end_if %>">
    
    <button class="embla__prev">Prev</button>
    <button class="embla__next">Next</button>

    <b class="banner__count colour--white [ embla__count ]">-</b>

    <div class="banner__dots [ embla__dots ]"></div>
    
    <div class="banner__viewport [ embla__viewport ]">

      
        <div class="banner__wrap [ embla__container ]">

            <% loop $BannerSlides.Sort('SortOrder') %>

                <div class="banner__item [ embla__slide ]" data-position="{$Pos}">

                    <%-- Banner Background Image --%>
                    <% if $BackgroundImage %>
                        <link rel="preload" as="image" href="{$BackgroundImage.FocusFill(480,680).Convert('webp').URL}" />
                        <picture>
                            <source media="(max-width: 500px)" srcset="{$BackgroundImage.FocusFill(480,680).Convert('webp').URL}">
                            <source media="(min-width: 501px)" srcset="{$BackgroundImage.FocusFill(1900,600).Convert('webp').URL}">
                            <img loading="eager" 
                                class="banner__image"
                                alt="$BackgroundImage.AltText"
                                width="400" 
                                height="608" 
                                onerror="this.classList.add('broken')"  
                                src="{$BackgroundImage.FocusFill(480,680).Convert('webp').URL}">
                        </picture>
                    <% end_if %>

                    <%-- Banner Background Video --%>
                    <% if $BannerVideo %>
                        <div 
                            class="banner__video [ js-banner-video ]" 
                            data-id="$BannerVideo.VideoID"
                            data-service="$BannerVideo.Service.LowerCase">
                            <div class="banner__iframe"></div>
                        </div>
                    <% end_if %>    

                    <%-- Banner Overlay --%>
                    <% if $Overlay %>
                        <div class="banner__overlay"></div>
                    <% end_if %>    

                    <%-- Banner Content --%>
                    <div class="banner__content">
                        <div class="banner__constraint">
                        <% if $Content %>
                            $Content
                        <% else %>
                            <h1 class="colour--white">$Top.Title</h1>
                        <% end_if %>
                        </div>
                    </div>

                </div>

            <% end_loop %>

        </div>
    </div>
</div>


<% if $BannerSlides.count > 1 %>

<script src="https://unpkg.com/embla-carousel/embla-carousel.umd.js"></script>


<script type="text/javascript">
const rootNode = document.querySelector(`.js-embla-{$ID}`);
    const viewportNode = rootNode.querySelector('.embla__viewport');
const countNode = rootNode.querySelector('.embla__count');
const dotsNode = rootNode.querySelector('.embla__dots');
const prevButtonNode = rootNode.querySelector('.embla__prev');
const nextButtonNode = rootNode.querySelector('.embla__next');

// Initialize Embla carousel
const emblaCarousel = EmblaCarousel(viewportNode, { loop: true });

// Event handler to update count display
const updateCount = () => {
    const selectedSnap = emblaCarousel.selectedScrollSnap();
    const totalSnaps = emblaCarousel.scrollSnapList().length;
    countNode.textContent = `${selectedSnap + 1} / ${totalSnaps}`;
};

// Add navigation button event listeners
prevButtonNode?.addEventListener('click', () => emblaCarousel.scrollPrev());
nextButtonNode?.addEventListener('click', () => emblaCarousel.scrollNext());

// Autoplay functionality with progress reset
let autoplayInterval;
const autoplaySpeed = 3000; // Set autoplay interval (in ms)
let progressBarInterval;

// Start Autoplay
const startAutoplay = () => {
    autoplayInterval = setInterval(() => {
        emblaCarousel.scrollNext();
    }, autoplaySpeed);
};

// Stop Autoplay
const stopAutoplay = () => {
    clearInterval(autoplayInterval);
    clearInterval(progressBarInterval);
};

// Add dot controls with progress bar
const addDots = () => {
    const snapList = emblaCarousel.scrollSnapList();
    const dots = snapList.map((_, index) => {
        const dot = document.createElement('button');
        dot.className = 'embla__dot banner__dot';
        dot.setAttribute('aria-label', `Go to slide ${index + 1}`);

        // Create progress bar inside each dot
        const progressBar = document.createElement('div');
        progressBar.className = 'embla__progress';
        dot.appendChild(progressBar);

        dot.addEventListener('click', () => {
            stopAutoplay(); // Stop autoplay on user interaction
            emblaCarousel.scrollTo(index);
            startAutoplay(); // Restart autoplay after user interaction
        });

        dotsNode.appendChild(dot);
        return { dot, progressBar };
    });

    const updateDots = () => {
        const selectedSnap = emblaCarousel.selectedScrollSnap();
        dots.forEach(({ dot, progressBar }, index) => {
            dot.classList.toggle('is-selected', index === selectedSnap);

            // Reset progress bar for non-selected dots
            progressBar.style.width = index === selectedSnap ? '100%' : '0';
        });
    };

    emblaCarousel.on('select', updateDots);
    emblaCarousel.on('init', updateDots);
};

// Update progress bar for autoplay
const updateProgressBar = () => {
    const selectedSnap = emblaCarousel.selectedScrollSnap();
    const totalSnaps = emblaCarousel.scrollSnapList().length;
    const progressWidth = (100 / totalSnaps);
    const progressBar = dots[selectedSnap].progressBar;

    let currentProgress = 0;
    progressBarInterval = setInterval(() => {
        if (currentProgress < 100) {
            currentProgress += (100 / (autoplaySpeed / 100)); // Update speed to match autoplay speed
            progressBar.style.width = `${currentProgress}%`;
        } else {
            clearInterval(progressBarInterval); // Reset the progress once it reaches 100%
            progressBar.style.width = '0';
        }
    }, 100);
};

emblaCarousel.on('select', updateCount);
emblaCarousel.on('init', updateCount);

addDots();
startAutoplay(); // Start autoplay when initialization is complete

// Auto-play functionality
emblaCarousel.on('select', updateProgressBar);
emblaCarousel.on('init', updateProgressBar);

</script>

<% end_if %>
</div>


