*** Keyword ***

Open Chrome With Blank Page
# =====================================
    Run Keyword If  '${headless}' == 'n'  Open Normal Chrome
    Run Keyword If  '${headless}' == 'y'  Open Headless Chrome

Open Chrome And Change Language To EN
    Set Selenium Timeout  30s
    Open Chrome With Blank Page
    Go To And Change Language  ${SITE_URL}  En
    # Go To And Change Language  https://dtaconline-test.dtac.co.th/smartphones-tablets/apple.html  En

Open Normal Chrome
    Open Browser  data:,  browser=chrome
    Delete All Cookies


Open Headless Chrome
    ${chrome_options}=    Set Chrome Options
    Create Webdriver    Chrome    chrome_options=${chrome_options}
    Set Window Size    1024    720
    Set Window Position    0    0
    Go To  data:,
    Delete All Cookies


Set Chrome Options
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    : FOR  ${option}  IN  --disable-infobars  --headless  --no-sandbox --disable-gpu  --allow-insecure-localhost
    \    Call Method    ${options}    add_argument    ${option}
    [Return]    ${options}

Open Checkout Page
#    Open Browser    ${URL}/smartphones-tablets/mnp-packet-test.html    chrome
    Go to    ${URL}/smartphones-tablets/mnp-packet-test.html

Open Landing Page
    [Arguments]     ${page}
    Go To               ${SITE_URL}/${page}        
    Wait Until Element Is Visible               css:#page-title-heading > span

Select MNP Package
    [Arguments]     ${packageName}
    Scroll And Click Link           ${packageName}
    Wait Until Page Contains        dtac
    
Click Add To Cart Button
    Scroll To ID  product-addtocart-button
    Click Button                id:product-addtocart-button
    Page Should Not Contain  This is a required field.
Input Birthday
    Click Button    css:#personal-information-form div:nth-child(4) button
    Click Link      css:#ui-datepicker-div a.ui-datepicker-prev.ui-corner-all
    Click Link      css:#ui-datepicker-div table > tbody > tr:nth-child(3) > td:nth-child(2) > a
Input Personal Detail
    [Arguments]     ${firstName}    ${lastName}    ${emailAddress}     ${contactNumber}     ${idCard}
    Wait Until Page Contains                ข้อมูลส่วนตัว
    Wait Loading Invisible
    Input Text                              firstname         ${firstName}
    Input Text                              lastname          ${lastName}
    Input Text                              email             ${emailAddress}
    Input Text                              mobile            0893030109
    Input Birthday                          
    Input Text                              id_card_number    ${idCard}

Input ID Card Image
    Upload ID Card Photo                    ${CURDIR}/images/id_card.jpg
    Wait Loading Invisible

Input Shipping Address
    [Arguments]     ${titlePage}  ${address}    ${subdistrict}    ${district}     ${province}     ${postcode}
    Wait Until Page Contains                ${titlePage}
    Wait Loading Invisible
    Input Text                              street[0]         ${address}
    Select MNP Subdistrict                  ${subdistrict}    ${district}     ${province}     ${postcode}
Confirm Page
    Wait Until Page Contains                ระบุเบอร์โทรที่ต้องการย้าย
    #Wait Until Element Is Visible           css:div.step-content.pin-code div.choice.field label span
    Wait Loading Invisible
    #Click Element                           css:div.step-content.pin-code > div.choice.field
    #Sleep                                   3
    Input Text                              css:#form-reconfirm > div.step-content.pin-code > div.field._required > div > input     ${pincode}     
    Scroll To ID                            mnp-checkout-links
    Click Element At Coordinates            css:#form-reconfirm > div.choice.field label  -200  0
    Sleep                                   0.5

Input Portin Number
    [Arguments]  ${number}
    Scroll To ID                            checkout-step-title
    Click Element                           css:#checkout-step-title > div > div > div > div:nth-child(3) > div.selection.another-number
    Input Text                              css:#checkout-step-title > div > div > div > div:nth-child(3) > div.input-number > div > div input     ${number}  
Click Confirm Button
    Scroll To ID                            review-buttons-container
    Click button                            css:#review-buttons-container > div > button
    Wait Loading Invisible
Thank You Page
    Wait Until Page Contains                คุณได้ทำการสั่งซื้อสำเร็จแล้ว    20
    Capture Page Screenshot                 ${screen_path}/${TEST NAME}_0${MNPNumber}.png
Continue MNP Step
    Scroll To ID                tigren-shipping-method-buttons-container
    Click Button                css:#tigren-shipping-method-buttons-container button
    Wait Until Page Contains    Checkout
Upload ID Card Photo
    [Arguments]  ${img}
    Choose file    photo     ${img}

Wait Loading Invisible
    #Wait Until Element Is Visible       css:div.loading-mask
    Wait Until Element Is Not Visible       css:div.loading-mask    60

Select MNP Subdistrict
    [Arguments]     ${subdistrict}    ${district}     ${province}     ${postcode}
    Click Element                   css:div.action-select.action-multiselect
    Input Text                      css:div.action-multiselect-search-wrap input         ${subdistrict}
    Sleep   0.5
    Click Element                   css:div.action-menu._active ul li:nth-child(1)
    #UBMKM9R > div.action-select.action-multiselect > div
    Element Text Should Be          css:.required.address-city-field div.action-select.action-multiselect > div     ${district} 
    Element Text Should Be          css:.required.address-region-field div.action-select.action-multiselect > div     ${province}
    Element Text Should Be          css:.required.address-postcode-field div.action-select.action-multiselect > div     ${postcode}

Get MNP Portin Number
    ${TextFileContent}=  Get File    /tests/number.txt
    ${TextFileContent}=  Convert To Integer      ${TextFileContent}
    Set Test Variable               ${MNPNumber}        ${TextFileContent+1}
    Remove File    /tests/number.txt
    Create File    /tests/number.txt
    ${NumberToFile}=  Convert To String  ${MNPNumber}
    Append To File                  /tests/number.txt        ${NumberToFile}

Scroll Page To Location
    [Arguments]    ${elem}
    Execute JavaScript      var rect = window.document.querySelector('${elem}').getBoundingClientRect(); window.scrollTo(0,rect.y);


Scroll And Click Link
    [Arguments]     ${name}
    Scroll To Text  ${name}
    Click Link      ${name}

Scroll To Text
    [Arguments]    ${name}
    Execute JavaScript      var aTags = document.getElementsByTagName("a");var rect; for (var i = 0; i < aTags.length; i++) {if (aTags[i].textContent.indexOf('${name}') > -1) {rect = aTags[i].getBoundingClientRect(); window.scrollTo(0,rect.y); break;}}

Scroll To ID
    [Arguments]    ${id}
    Execute JavaScript      var rect = window.document.getElementById('${id}').getBoundingClientRect(); window.scrollTo(0,rect.y);
