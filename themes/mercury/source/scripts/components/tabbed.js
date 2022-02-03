
/*------------------------------------------------------------------
Helpers
------------------------------------------------------------------*/

const query = document.querySelector.bind(document);
const queryAll = document.querySelectorAll.bind(document);

/*------------------------------------------------------------------
Tabbed Content
------------------------------------------------------------------*/

const updateTabbedContent = (indicator, currentTab) => {

    let parent = currentTab.parentNode;
    let grandparent = parent.parentNode;
    let index = Array.prototype.indexOf.call(parent.children, currentTab);

    currentTab.classList.add('active');

    [...queryAll('.js-tabs-item', grandparent)].forEach(tabbedContentItem => tabbedContentItem.style.display = 'none');

    grandparent.querySelector(`.js-tabs-item:nth-child(${index})`).style.display = 'block';

    let rect = currentTab.getBoundingClientRect();
    indicator.style.height = `${rect.height}px`;
    indicator.style.top = `${currentTab.offsetTop}px`;
}

[...queryAll('.js-tabs')].forEach(tabbedContent => {

    let indicator = tabbedContent.querySelector('.js-tabbed-indicator');
    let currentTab = tabbedContent.querySelector('.js-tabs-link.active');

    [...queryAll('.js-tabs-link', tabbedContent)].forEach(tabbedContentLink => {

        tabbedContentLink.addEventListener('click', (e) => {
            e.preventDefault();
            currentTab.classList.remove('active');
            currentTab = tabbedContentLink;
            updateTabbedContent(indicator, currentTab);
        });

    });

    updateTabbedContent(indicator, currentTab);

});

