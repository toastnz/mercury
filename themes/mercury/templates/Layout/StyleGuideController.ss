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
                <select name="EditableTextField_575eb" class="dropdown" id="UserForm_Form_6_EditableTextField_575eb" >

                    <option value="af">Afghanistan</option>
                
                    <option value="ax">Åland Islands</option>
                
                    <option value="al">Albania</option>
                
                    <option value="dz">Algeria</option>
                
                    <option value="as">American Samoa</option>
                
                    <option value="ad">Andorra</option>
                
                    <option value="ao">Angola</option>
                
                    <option value="ai">Anguilla</option>
                
                    <option value="aq">Antarctica</option>
                
                    <option value="ag">Antigua &amp; Barbuda</option>
                
                    <option value="ar">Argentina</option>
                
                    <option value="am">Armenia</option>
                
                    <option value="aw">Aruba</option>
                
                    <option value="au">Australia</option>
                
                    <option value="at">Austria</option>
                
                    <option value="az">Azerbaijan</option>
                
                    <option value="bs">Bahamas</option>
                
                    <option value="bh">Bahrain</option>
                
                    <option value="bd">Bangladesh</option>
                
                    <option value="bb">Barbados</option>
                
                    <option value="by">Belarus</option>
                
                    <option value="be">Belgium</option>
                
                    <option value="bz">Belize</option>
                
                    <option value="bj">Benin</option>
                
                    <option value="bm">Bermuda</option>
                
                    <option value="bt">Bhutan</option>
                
                    <option value="bo">Bolivia</option>
                
                    <option value="ba">Bosnia &amp; Herzegovina</option>
                
                    <option value="bw">Botswana</option>
                
                    <option value="bv">Bouvet Island</option>
                
                    <option value="br">Brazil</option>
                
                    <option value="io">British Indian Ocean Territory</option>
                
                    <option value="vg">British Virgin Islands</option>
                
                    <option value="bn">Brunei</option>
                
                    <option value="bg">Bulgaria</option>
                
                    <option value="bf">Burkina Faso</option>
                
                    <option value="bi">Burundi</option>
                
                    <option value="kh">Cambodia</option>
                
                    <option value="cm">Cameroon</option>
                
                    <option value="ca">Canada</option>
                
                    <option value="cv">Cape Verde</option>
                
                    <option value="bq">Caribbean Netherlands</option>
                
                    <option value="ky">Cayman Islands</option>
                
                    <option value="cf">Central African Republic</option>
                
                    <option value="td">Chad</option>
                
                    <option value="cl">Chile</option>
                
                    <option value="cn">China</option>
                
                    <option value="cx">Christmas Island</option>
                
                    <option value="cc">Cocos (Keeling) Islands</option>
                
                    <option value="co">Colombia</option>
                
                    <option value="km">Comoros</option>
                
                    <option value="cg">Congo - Brazzaville</option>
                
                    <option value="cd">Congo - Kinshasa</option>
                
                    <option value="ck">Cook Islands</option>
                
                    <option value="cr">Costa Rica</option>
                
                    <option value="ci">Côte d’Ivoire</option>
                
                    <option value="hr">Croatia</option>
                
                    <option value="cu">Cuba</option>
                
                    <option value="cy">Cyprus</option>
                
                    <option value="cz">Czech Republic</option>
                
                    <option value="dk">Denmark</option>
                
                    <option value="dj">Djibouti</option>
                
                    <option value="dm">Dominica</option>
                
                    <option value="do">Dominican Republic</option>
                
                    <option value="ec">Ecuador</option>
                
                    <option value="eg">Egypt</option>
                
                    <option value="sv">El Salvador</option>
                
                    <option value="gq">Equatorial Guinea</option>
                
                    <option value="er">Eritrea</option>
                
                    <option value="ee">Estonia</option>
                
                    <option value="et">Ethiopia</option>
                
                    <option value="fk">Falkland Islands</option>
                
                    <option value="fo">Faroe Islands</option>
                
                    <option value="fj">Fiji</option>
                
                    <option value="fi">Finland</option>
                
                    <option value="fr">France</option>
                
                    <option value="gf">French Guiana</option>
                
                    <option value="pf">French Polynesia</option>
                
                    <option value="tf">French Southern Territories</option>
                
                    <option value="ga">Gabon</option>
                
                    <option value="gm">Gambia</option>
                
                    <option value="ge">Georgia</option>
                
                    <option value="de">Germany</option>
                
                    <option value="gh">Ghana</option>
                
                    <option value="gi">Gibraltar</option>
                
                    <option value="gr">Greece</option>
                
                    <option value="gl">Greenland</option>
                
                    <option value="gd">Grenada</option>
                
                    <option value="gp">Guadeloupe</option>
                
                    <option value="gu">Guam</option>
                
                    <option value="gt">Guatemala</option>
                
                    <option value="gg">Guernsey</option>
                
                    <option value="gn">Guinea</option>
                
                    <option value="gw">Guinea-Bissau</option>
                
                    <option value="gy">Guyana</option>
                
                    <option value="ht">Haiti</option>
                
                    <option value="hm">Heard &amp; McDonald Islands</option>
                
                    <option value="hn">Honduras</option>
                
                    <option value="hk">Hong Kong SAR China</option>
                
                    <option value="hu">Hungary</option>
                
                    <option value="is">Iceland</option>
                
                    <option value="in">India</option>
                
                    <option value="id">Indonesia</option>
                
                    <option value="ir">Iran</option>
                
                    <option value="iq">Iraq</option>
                
                    <option value="ie">Ireland</option>
                
                    <option value="im">Isle of Man</option>
                
                    <option value="il">Israel</option>
                
                    <option value="it">Italy</option>
                
                    <option value="jm">Jamaica</option>
                
                    <option value="jp">Japan</option>
                
                    <option value="je">Jersey</option>
                
                    <option value="jo">Jordan</option>
                
                    <option value="kz">Kazakhstan</option>
                
                    <option value="ke">Kenya</option>
                
                    <option value="ki">Kiribati</option>
                
                    <option value="kw">Kuwait</option>
                
                    <option value="kg">Kyrgyzstan</option>
                
                    <option value="la">Laos</option>
                
                    <option value="lv">Latvia</option>
                
                    <option value="lb">Lebanon</option>
                
                    <option value="ls">Lesotho</option>
                
                    <option value="lr">Liberia</option>
                
                    <option value="ly">Libya</option>
                
                    <option value="li">Liechtenstein</option>
                
                    <option value="lt">Lithuania</option>
                
                    <option value="lu">Luxembourg</option>
                
                    <option value="mo">Macau SAR China</option>
                
                    <option value="mk">Macedonia</option>
                
                    <option value="mg">Madagascar</option>
                
                    <option value="mw">Malawi</option>
                
                    <option value="my">Malaysia</option>
                
                    <option value="mv">Maldives</option>
                
                    <option value="ml">Mali</option>
                
                    <option value="mt">Malta</option>
                
                    <option value="mh">Marshall Islands</option>
                
                    <option value="mq">Martinique</option>
                
                    <option value="mr">Mauritania</option>
                
                    <option value="mu">Mauritius</option>
                
                    <option value="yt">Mayotte</option>
                
                    <option value="mx">Mexico</option>
                
                    <option value="fm">Micronesia</option>
                
                    <option value="md">Moldova</option>
                
                    <option value="mc">Monaco</option>
                
                    <option value="mn">Mongolia</option>
                
                    <option value="me">Montenegro</option>
                
                    <option value="ms">Montserrat</option>
                
                    <option value="ma">Morocco</option>
                
                    <option value="mz">Mozambique</option>
                
                    <option value="mm">Myanmar (Burma)</option>
                
                    <option value="na">Namibia</option>
                
                    <option value="nr">Nauru</option>
                
                    <option value="np">Nepal</option>
                
                    <option value="nl">Netherlands</option>
                
                    <option value="an">Netherlands Antilles</option>
                
                    <option value="nc">New Caledonia</option>
                
                    <option value="nz">New Zealand</option>
                
                    <option value="ni">Nicaragua</option>
                
                    <option value="ne">Niger</option>
                
                    <option value="ng">Nigeria</option>
                
                    <option value="nu">Niue</option>
                
                    <option value="nf">Norfolk Island</option>
                
                    <option value="kp">North Korea</option>
                
                    <option value="mp">Northern Mariana Islands</option>
                
                    <option value="no">Norway</option>
                
                    <option value="om">Oman</option>
                
                    <option value="qo">Outlying Oceania</option>
                
                    <option value="pk">Pakistan</option>
                
                    <option value="pw">Palau</option>
                
                    <option value="ps">Palestinian Territories</option>
                
                    <option value="pa">Panama</option>
                
                    <option value="pg">Papua New Guinea</option>
                
                    <option value="py">Paraguay</option>
                
                    <option value="pe">Peru</option>
                
                    <option value="ph">Philippines</option>
                
                    <option value="pn">Pitcairn Islands</option>
                
                    <option value="pl">Poland</option>
                
                    <option value="pt">Portugal</option>
                
                    <option value="pr">Puerto Rico</option>
                
                    <option value="qa">Qatar</option>
                
                    <option value="re">Réunion</option>
                
                    <option value="ro">Romania</option>
                
                    <option value="ru">Russia</option>
                
                    <option value="rw">Rwanda</option>
                
                    <option value="ws">Samoa</option>
                
                    <option value="sm">San Marino</option>
                
                    <option value="st">São Tomé &amp; Príncipe</option>
                
                    <option value="sa">Saudi Arabia</option>
                
                    <option value="sn">Senegal</option>
                
                    <option value="rs">Serbia</option>
                
                    <option value="sc">Seychelles</option>
                
                    <option value="sl">Sierra Leone</option>
                
                    <option value="sg">Singapore</option>
                
                    <option value="sk">Slovakia</option>
                
                    <option value="si">Slovenia</option>
                
                    <option value="sb">Solomon Islands</option>
                
                    <option value="so">Somalia</option>
                
                    <option value="za">South Africa</option>
                
                    <option value="gs">South Georgia &amp; South Sandwich Islands</option>
                
                    <option value="kr">South Korea</option>
                
                    <option value="es">Spain</option>
                
                    <option value="lk">Sri Lanka</option>
                
                    <option value="bl">St. Barthélemy</option>
                
                    <option value="sh">St. Helena</option>
                
                    <option value="kn">St. Kitts &amp; Nevis</option>
                
                    <option value="lc">St. Lucia</option>
                
                    <option value="mf">St. Martin</option>
                
                    <option value="pm">St. Pierre &amp; Miquelon</option>
                
                    <option value="vc">St. Vincent &amp; Grenadines</option>
                
                    <option value="sd">Sudan</option>
                
                    <option value="sr">Suriname</option>
                
                    <option value="sj">Svalbard &amp; Jan Mayen</option>
                
                    <option value="sz">Swaziland</option>
                
                    <option value="se">Sweden</option>
                
                    <option value="ch">Switzerland</option>
                
                    <option value="sy">Syria</option>
                
                    <option value="tw">Taiwan</option>
                
                    <option value="tj">Tajikistan</option>
                
                    <option value="tz">Tanzania</option>
                
                    <option value="th">Thailand</option>
                
                    <option value="tl">Timor-Leste</option>
                
                    <option value="tg">Togo</option>
                
                    <option value="tk">Tokelau</option>
                
                    <option value="to">Tonga</option>
                
                    <option value="tt">Trinidad &amp; Tobago</option>
                
                    <option value="tn">Tunisia</option>
                
                    <option value="tr">Turkey</option>
                
                    <option value="tm">Turkmenistan</option>
                
                    <option value="tc">Turks &amp; Caicos Islands</option>
                
                    <option value="tv">Tuvalu</option>
                
                    <option value="um">U.S. Outlying Islands</option>
                
                    <option value="vi">U.S. Virgin Islands</option>
                
                    <option value="ug">Uganda</option>
                
                    <option value="ua">Ukraine</option>
                
                    <option value="ae">United Arab Emirates</option>
                
                    <option value="gb">United Kingdom</option>
                
                    <option value="us">United States</option>
                
                    <option value="uy">Uruguay</option>
                
                    <option value="uz">Uzbekistan</option>
                
                    <option value="vu">Vanuatu</option>
                
                    <option value="va">Vatican City</option>
                
                    <option value="ve">Venezuela</option>
                
                    <option value="vn">Vietnam</option>
                
                    <option value="wf">Wallis &amp; Futuna</option>
                
                    <option value="eh">Western Sahara</option>
                
                    <option value="ye">Yemen</option>
                
                    <option value="zm">Zambia</option>
                
                    <option value="zw">Zimbabwe</option>
                
                </select>
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