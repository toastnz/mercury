<div class="styleguide type">

    <div class="styleguide__content">

        <div class="styleguide__content__section" id="Buttons">
            <h3 class="styleguide__content__section__heading">Text Block</h3>
            $TextBlock
        </div>

        <div class="styleguide__content__section" id="Buttons">
            <h3 class="styleguide__content__section__heading">Tabbed Content Block</h3>
            $TabbedContentBlock
        </div>

        <div class="styleguide__content__section" id="Buttons">
            <h3 class="styleguide__content__section__heading">Video Block</h3>
            $VideoBlock
        </div>

        <div class="styleguide__content__section" id="Buttons">
            <h3 class="styleguide__content__section__heading">Accordion Block</h3>
            $AccordionBlock
        </div>

        <div class="styleguide__content__section" id="Buttons">
            <h3 class="styleguide__content__section__heading">Link Block</h3>
            $LinkBlock
        </div>

        <div class="styleguide__content__section" id="Buttons">
            <h3 class="styleguide__content__section__heading">Image Block</h3>
            $ImageBlock
        </div>

        <div class="styleguide__content__section" id="Buttons">
            <h3 class="styleguide__content__section__heading">Download Block</h3>
            $DownloadBlock
        </div>

        <div class="styleguide__content__section" id="Buttons">
            <h3 class="styleguide__content__section__heading">Image Text Block</h3>
            $ImageTextBlock
            $ImageTextBlockReversed
        </div>

        <div class="styleguide__content__section" id="Buttons">
            <h3 class="styleguide__content__section__heading">Testimonial Block</h3>
            $TestimonialBlock
        </div>


        <%----------------------------------------------------------------
        Section
        ----------------------------------------------------------------%>

        <div class="styleguide__content__section" id="Typograhpy">
            <h3 class="styleguide__content__section__heading">Typograhpy</h3>
            <p class="styleguide__content__section__paragraph">Heading components without overrides</p>
            <div class="styleguide__content__section__sandbox">
                <div class="contentBlock">
                    <h1>This is an H1, the most important heading on a page</h1>
                    <h2>This is an H2, the second most important heading on a page</h2>
                    <h3>This is an H3, the third most important heading on a page</h3>
                    <h4>This is an H4, the fourth most important heading on a page</h4>
                    <h5>This is an H5, the fifth most important heading on a page</h5>
                    <h6>This is an H6, the sixth most important heading on a page</h6>
                    <p>
                        <strong>Pellentesque habitant morbi tristique</strong> senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper.
                        <em>Aenean ultricies mi vitae est.</em> Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed,
                        <code>commodo vitae</code>, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci, sagittis tempus lacus enim ac dui.
                        <a href="#">Donec non enim</a> in turpis pulvinar facilisis. Ut felis.</p>
                </div>
            </div>
        </div>

        <div class="styleguide__content__section" id="Buttons">
            <h3 class="styleguide__content__section__heading">Buttons</h3>
            <p class="styleguide__content__section__paragraph">A simple Button component.</p>
            <div class="styleguide__content__section__sandbox">
                <a href="#" onclick="event.preventDefault();" class="button">Normal Button</a>
                <a href="#" onclick="event.preventDefault();" class="button button--secondary">Secondary Button</a>
                <a href="#" onclick="event.preventDefault();" class="button button--outline">Outline Button</a>
            </div>
        </div>

        <div class="styleguide__content__section" id="Tables">
            <h3 class="styleguide__content__section__heading">Tables</h3>
            <p class="styleguide__content__section__paragraph">Table styles for the entire site.</p>

            <div class="styleguide__content__section__sandbox">
                <table>
                    <thead>
                        <tr>
                            <th>Table head th</th>
                            <th>Table head th</th>
                            <th>Table head th</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Table body td</td>
                            <td>Table body td</td>
                            <td>Table body td</td>
                        </tr>
                        <tr>
                            <td>Table body td</td>
                            <td>Table body td</td>
                            <td>Table body td</td>
                        </tr>
                        <tr>
                            <td>Table body td</td>
                            <td>Table body td</td>
                            <td>Table body td</td>
                        </tr>
                        <tr>
                            <td>Table body td</td>
                            <td>Table body td</td>
                            <td>Table body td</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <%----------------------------------------------------------------
        Section
        ----------------------------------------------------------------%>

        <div class="styleguide__content__section" id="Lists">
            <h3 class="styleguide__content__section__heading">Lists</h3>
            <p class="styleguide__content__section__paragraph">Ordered and unordered list components.</p>

            <div class="styleguide__content__section__sandbox">
                <ul>
                    <li>This is an unordered list item</li>
                    <li>This is an unordered list item that has a slightly longer amount of text that may run over more than one line</li>
                    <li>This is an unordered list item
                        <ul>
                            <li>This is an unordered list item</li>
                            <li>This is an unordered list item that has a slightly longer amount of text that may run over more than one line</li>
                            <li>This is an unordered list item</li>
                            <li>This is an unordered list item</li>
                        </ul>
                    </li>
                    <li>This is an unordered list item</li>
                </ul>

                <ol>
                    <li>This is an unordered list item</li>
                    <li>This is an unordered list item that has a slightly longer amount of text that may run over more than one line</li>
                    <li>This is an unordered list item
                        <ol>
                            <li>This is an unordered list item</li>
                            <li>This is an unordered list item that has a slightly longer amount of text that may run over more than one line</li>
                            <li>This is an unordered list item</li>
                            <li>This is an unordered list item</li>
                        </ol>
                    </li>
                    <li>This is an unordered list item</li>
                </ol>
            </div>
        </div>




        <section class="textBlock block">
            <div class="textBlock__wrap row">
                <div class="column">
                    <form id="UserForm_Form_6" action="/new-user-defined-form/Form?stage=Stage" method="post" enctype="multipart/form-data" class=" userform">
        
        
        
        
        
        
        
            <p id="UserForm_Form_6_error" class="message " aria-hidden="true" style="display: none;"></p>
        
        
        
            <div class="userform-fields">
                
            <div id="EditableFormStep_e46c4" class="form-step field CompositeField userformsstep" data-title="First Page">
            
        
            
                <div id="EditableTextField_16bae" class="field text half">
            <label class="left" for="UserForm_Form_6_EditableTextField_16bae">Text field</label>
            <div class="middleColumn">
                <input type="text" name="EditableTextField_16bae" class="text half" id="UserForm_Form_6_EditableTextField_16bae" autocomplete="off">
            </div>
            
            
        </div>
        
            
                <div id="EditableTextField_b06b5" class="field text half">
            <label class="left" for="UserForm_Form_6_EditableTextField_b06b5">Text field</label>
            <div class="middleColumn">
                <input type="text" name="EditableTextField_b06b5" class="text half" id="UserForm_Form_6_EditableTextField_b06b5" placeholder="Text placeholder" autocomplete="off">
            </div>
            
            
        </div>
        
            
                <fieldset id="EditableTextField_7c3de" class="field optionset checkboxset">
            <legend class="left">Checkbox group</legend>
        
            <div class="middleColumn">
                <div class="odd valOption_1">
                    <input id="UserForm_Form_6_EditableTextField_7c3de_Option_1" class="checkbox" name="EditableTextField_7c3de[]" type="checkbox" value="Option 1" checked="checked">
                    <label for="UserForm_Form_6_EditableTextField_7c3de_Option_1">Option 1</label>
                </div>
            
                <div class="even valOption_2">
                    <input id="UserForm_Form_6_EditableTextField_7c3de_Option_2" class="checkbox" name="EditableTextField_7c3de[]" type="checkbox" value="Option 2">
                    <label for="UserForm_Form_6_EditableTextField_7c3de_Option_2">Option 2</label>
                </div>
            </div>
        
            
            
        </fieldset>
        
            
                <div id="EditableTextField_575eb" class="field dropdown">
            <label class="left" for="UserForm_Form_6_EditableTextField_575eb">Country dropdown</label>
            <div class="middleColumn">
                
            </div>
            
            
        </div>
        
            
                <div id="EditableTextField_6208c" class="field numeric text number">
            <label class="left" for="UserForm_Form_6_EditableTextField_6208c">Numeric Field</label>
            <div class="middleColumn">
                <input type="text" name="EditableTextField_6208c" class="numeric text number" id="UserForm_Form_6_EditableTextField_6208c">
            </div>
            
            
        </div>
        
            
                <fieldset id="EditableTextField_49d39" class="field optionset">
            <legend class="left">Radio group</legend>
        
            <div class="middleColumn">
                <div class="odd valOption_1">
                <input id="UserForm_Form_6_EditableTextField_49d39_Option_1" class="radio" name="EditableTextField_49d39" type="radio" value="Option 1" checked="">
                <label for="UserForm_Form_6_EditableTextField_49d39_Option_1">Option 1</label>
            </div>
        
            <div class="even valOption_2">
                <input id="UserForm_Form_6_EditableTextField_49d39_Option_2" class="radio" name="EditableTextField_49d39" type="radio" value="Option 2">
                <label for="UserForm_Form_6_EditableTextField_49d39_Option_2">Option 2</label>
            </div>
            </div>
        
            
            
        </fieldset>
        
            
                <div id="EditableTextField_b64ce" class="field email text">
            <label class="left" for="UserForm_Form_6_EditableTextField_b64ce">Email</label>
            <div class="middleColumn">
                <input type="email" name="EditableTextField_b64ce" class="email text" id="UserForm_Form_6_EditableTextField_b64ce" data-rule-email="data-rule-email">
            </div>
            
            
        </div>
        
            
        
        </div>
        
            <input type="hidden" name="SecurityID" value="dfa5a3fc515d16a9a9ddaeaecec8be8339438c10" class="hidden" id="UserForm_Form_6_SecurityID">
        
        <div class="clear"><!-- --></div>
        
        
            </div>
        
        
        
            
        <nav class="btn-toolbar Actions">
            
                <input type="submit" name="action_process" value="Submit" class="action" id="UserForm_Form_6_action_process">
            
        </nav>
        
        
        
        
        </form>
        
                </div>
            </div>
        </section>








    </div>
</div>