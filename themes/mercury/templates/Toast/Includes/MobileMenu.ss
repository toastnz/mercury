<%-- -----------------------------------------------------------------
Mobile Menu
------------------------------------------------------------------ --%>

<section class="mobile-menu [ js-postload ]">
    <div class="mobile-menu__wrap">
        <% loop $MenuSet('Header').MenuItems %>
            <div class="mobile-menu__wrap__item">
                <a class="mobile-menu__wrap__item__link {$LinkingMode}" href="$Link">
                    $MenuTitle.UpperCase.XML
                </a>
                <% if $Children %>

                    <span class="mobile-menu__wrap__item__arrow" onclick="toggleMenu(event.currentTarget)">
                        <svg width="10" height="6" viewBox="0 0 10 6" xmlns="http://www.w3.org/2000/svg">
                            <path d="M5 6 0 1.082 1.1 0 5 3.836 8.9 0 10 1.082z" fill="#000" fill-rule="evenodd"/>
                        </svg>
                    </span>

                    <div class="mobile-menu__wrap__item__group" data-id=="{$ID}">
                        <div class="mobile-menu__wrap__item__group__items">
                            <% loop $Children %>
                                <a class="mobile-menu__wrap__item__group__link {$LinkingMode}" href="$Link">
                                    $MenuTitle.UpperCase.XML
                                </a>
                            <% end_loop %>
                        </div>  
                    </div>  
                <% end_if %>
            </div>
        <% end_loop %>
    </div>
</section>

<script>

// Default animation state
let animating = false;

// Animate menu slide up
const slideMenuUp = (container) => {
    container.style.height = "0px"

    container.addEventListener('transitionend', () => {
        container.classList.remove('active');
        animating = false;
    }, { once: true });

};

// Animate menu slide down
const slideMenuDown = (container) => {

    container.classList.add('active')
    container.style.height = 'auto'

    let height = container.clientHeight + 'px'
    container.style.height = '0px'

    setTimeout(() => container.style.height = height, 0);

    container.addEventListener('transitionend', () => {
        animating = false;
    }, { once: true })
};


// Toggle menu item
function toggleMenu(element) {
    
    if (animating) return;
    
    animating = true;

    var menu = element.closest('.mobile-menu__wrap__item');

    if (menu.classList.contains('active')) {
        menu.classList.remove('active');
        slideMenuUp(menu.querySelector('.mobile-menu__wrap__item__group'));
    } else {
        menu.classList.add('active');
        slideMenuDown(menu.querySelector('.mobile-menu__wrap__item__group'));
    }
}

</script>
