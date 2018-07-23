*** Keyword ***
# =====================================
Open Chrome With Blank Page
# =====================================
    Run Keyword If  '${headless}' == 'n'  Open Normal Chrome
    Run Keyword If  '${headless}' == 'y'  Open Headless Chrome

Open Normal Chrome
    Open Browser  data:,  browser=chrome
    Delete All Cookies


Open Headless Chrome
    ${chrome_options}=    Set Chrome Options
    Create Webdriver    Chrome    chrome_options=${chrome_options}
    Set Window Size    ${1366}    ${768}
    Set Window Position    ${0}    ${0}
    Go To  data:,
    Delete All Cookies


Set Chrome Options
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    : FOR  ${option}  IN  --disable-infobars  --headless  --disable-gpu  --allow-insecure-localhost
    \    Call Method    ${options}    add_argument    ${option}
    [Return]    ${options}

# =====================================
Go To Home Page
# =====================================
    Go To  ${SITE_URL}
    Wait Until Page Contains  Home Page

# =====================================
Enter Personal Details Information
# =====================================
    Input First Name And Last Name  ${initials}  ${firstName}  ${lastName}
    Input Birthdate  ${day}  ${month}  ${year}
    Input Email Address  ${emailAddress}
    Input Contact Number  ${contactNumber}
    Input ID Card Number  ${cardName}
    #Upload Selfie Photo  ${CURDIR}/selfie.png
    Upload ID Card Photo  ${CURDIR}/id_card.jpg

Input First Name And Last Name
    [Arguments]  ${i}  ${f}  ${l}
    Scroll ToID  initials
    Select From List By Index    xpath=//select[@id="initials"]  ${i}
    Input Text    firstName  ${f}
    Input Text    lastName  ${l}

Input Birthdate
    [Arguments]  ${d}  ${m}  ${y}
    Select From List By Index    xpath=//select[@id="day"]    ${d}
    Select From List By Index    xpath=//select[@id="month"]    ${m}
    Select From List By Index    xpath=//select[@id="year"]    ${y}
    Capture Page Screenshot
    Scroll ToID  year

Input Email Address
    [Arguments]  ${email}
    Input Text    emailAddress    ${email}

Input Contact Number
    [Arguments]  ${phoneNo}
    Input Text    contactNumber    ${phoneNo}

Input ID Card Number
    [Arguments]  ${idCard}
    Input Text    cardName    ${idCard}
    # Click element    idType

Upload Selfie Photo
    [Arguments]  ${img}
    Choose file    id=image-upload    ${img}

Upload ID Card Photo
    [Arguments]  ${img}
    Choose file    id=image-upload2  ${img}

Click Next To Address Page
    Scroll ToID  btnPersonalNext
    Capture Page Screenshot
    Click Button    btnPersonalNext
    Wait Until Page Contains  Move to dtac - address  ${timeout}

Click Previous To Personal Details Page
    Wait Until Loading Disappear
    Scroll ToID     btnShippingBack
    Click Button    btnShippingBack
    Wait Until Page Contains  Move to dtac - personal details

Check Now Loading Disappear
    Wait Until Page Contains Element    css=.modal-backdrop.loading
    Wait Until Loading Disappear

Wait Until Loading Disappear
    Wait Until Page Does Not Contain Element    css=.modal-backdrop.loading    ${timeout}

Scroll ToID
    [Arguments]    ${id}
    Execute JavaScript    document.getElementById('${id}').scrollIntoView()

Scroll ToName
    [Arguments]    ${name}
    Execute JavaScript    document.getElementsByName('${name}')[0].scrollIntoView()

Personal Details Should Be Loaded Correctly
    Full Name Should Be Correct
    Birthdate Should Be Correct
    Email Should Be Correct
    Contact Should Be Conrrect
    ID Card Number Should Be Correct

Full Name Should Be Correct
    Value In Text Field Should Be  initials         string:${initials_value}
    Value In Text Field Should Be  lastName         ${lastName}
    Value In Text Field Should Be  firstName        ${firstName}

Birthdate Should Be Correct
    Scroll ToID  day
    Value In Text Field Should Be  day              string:${day_value}
    Value In Text Field Should Be  month            string:${month_value}
    Value In Text Field Should Be  year             string:${year_value}

Email Should Be Correct
    Value In Text Field Should Be  emailAddress     ${emailAddress}

Contact Should Be Conrrect
    Value In Text Field Should Be  contactNumber    ${contactNumber}

ID Card Number Should Be Correct
    Value In Text Field Should Be  cardName         ${cardName}

Value In Text Field Should Be
    [Arguments]  ${name}  ${value}
    Wait For Condition  return $('[name="${name}"]').val() == '${value}'

# =====================================
KeyDataInShippingAddress
# =====================================
#    DefineTestDataThaiSuccessCase
    Wait Until Page Contains Element    addressLine1
    Scroll ToName    addressLine1
    Input Text    addressLine1    ${addressLine1}
    Input Text    addressLine2    ${addressLine2}
    Input Text    subDistrict    ${subDistrict}
    Capture Page Screenshot
    #Wait Until Element Is Visible        xpath( "//li[contains(text(), 'ถนนนครไชยศรี,ดุสิต,กรุงเทพมหานคร,10300')]" )
    #Click Element    xpath( "//li[contains(text(), 'ถนนนครไชยศรี,ดุสิต,กรุงเทพมหานคร,10300')]" )
    #Wait Until Element Is Visible    xpath=id('addrEINV')/li[text()=''ถนนนครไชยศรี,ดุสิต,กรุงเทพมหานคร,10300"]
    Wait Until Element Is Visible   css=#ui-id-1 li  ${timeout}
    Click Element                   css=#ui-id-1 li
    Click hidden element            prefer_email
    #Wait Until Element Is Visible    //input[@id='prefer_email']
    #Mouse Over    //div[contains(@class, 'checkbox')]
    #Click Link    //div[contains(@class, 'checkbox')]
    #Click Link  id=prefer_email
    Scroll ToID  btnShippingNext
    Capture Page Screenshot

Click Next To Confirm Page
    Click element    btnShippingNext
    Wait Until Page Contains  Move to dtac - confirmation  ${timeout}

# =====================================
Select Paper Invoice and Key Address
# =====================================
    Click hidden element    prefer_paper
    Scroll ToID  btnShippingNext
    Input Text    addressLineBill1    ${addressLine1Bill}
    Input Text    billSubDistrict    ${subDistrictBill}
    Capture Page Screenshot
    Wait Until Element Is Visible   css=#ui-id-5 li
    Click Element                   css=#ui-id-5 li
    Capture Page Screenshot
    Click Next To Confirm Page

# =====================================
KeyDataInConfirmPage
# =====================================
    Wait Until Element Contains  css=#confirm_transfer_form h3  ${offerDesc}  ${timeout}
    Capture Page Screenshot
    Scroll ToID    pinCode
    Input Text    pinCode    ${pinCode}
    Click hidden elementname    termCondition
    Capture Page Screenshot

Click Next To Thank You Page
    Click element    btnComfirmNext
    Check Now Loading Disappear

Found Error is in between portin process
    Wait Until Element Is Visible    //*[contains(text(),'[PS09] หมายเลขนี้อยู่ในระหว่างการโอนย้ายมาใช้งานบนเครือข่ายดีแทค คุณจะได้รับแจ้งทาง SMS เมื่อการย้ายค่ายสำเร็จ')]
    Page Should Contain Element    //*[contains(text(),'[PS09] หมายเลขนี้อยู่ในระหว่างการโอนย้ายมาใช้งานบนเครือข่ายดีแทค คุณจะได้รับแจ้งทาง SMS เมื่อการย้ายค่ายสำเร็จ')]

Found Error is dtac number
    Wait Until Element Is Visible    //*[contains(text(),'เป็นเบอร์ในระบบดีแทค')]
    Page Should Contain Element    //*[contains(text(),'เป็นเบอร์ในระบบดีแทค')]

Click hidden element
    [Arguments]    ${id}
    execute javascript  document.getElementById('${id}').click();

Click hidden elementname
    [Arguments]    ${id}
    execute javascript  document.getElementsByName('${id}')[0].click();

Close All Browsers If All Tests Passed
    Run Keyword If All Tests Passed  Close All Browsers
    Run Keyword If  '${headless}' == 'y'  Close All Browsers
