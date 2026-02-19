<?php

namespace Toast\Extensions;
use SilverStripe\Core\Extension;
use Toast\Pages\SearchResultsPage;

class SearchFormExtension extends Extension
{
    public function updateForm($form)
    {
        if ($page = SearchResultsPage::get()->first()) {
            $form->setFormAction($page->Link('SearchForm'));
        }
    }
}
