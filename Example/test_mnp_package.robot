*** Setting ***
Library         SeleniumLibrary
Library         OperatingSystem
Resource        data.robot
Resource        keywords_occ.robot
Test Setup     Open Chrome With Blank Page
Suite Teardown  Close All Browsers


*** Variables ***
${MNPNumber}    0
${page}         move-to-dtac.html
*** Test Cases ***

[Success] Create MNP order via dtac online.
    [Tags]    ALL  success  MNP_PK01
    Get MNP Portin Number
    Open Landing Page           ${page}        
    Select MNP Package          ${lastName}
    Click Add To Cart Button
    Input Personal Detail       ${firstName}    ${lastName}    ${emailAddress}     0${MNPNumber}     ${idCard}
    Input ID Card Image
    Continue MNP Step
    Input Shipping Address      ที่อยู่จัดส่ง  ${addressLine1} ${MNPNumber}     ${subDistrictBill}     ${district}     ${province}     ${postcode}
    Continue MNP Step
    Confirm Page
    Click Confirm Button
    Thank You Page

[Backend] Confirm MNP Validate
    [Tags]    All  success   success_admin  MNP_AMD01
    Open Admin Login Page
    Login With Account          ${username}  ${password}
    Click Menu Sales
    Click Menu MNP order


[Fail] Because not upload ID card photo. 
    [Tags]    ALL  fail  MNP_PK11
    Open Landing Page           ${page}
    Select MNP Package          ${packageName} 
    Click Add To Cart Button
    Input Personal Detail       ${firstName}    ${lastName}    ${emailAddress}     ${contact_number}     ${idCard}
    Wait Loading Invisible
    Continue MNP Step
    Element Text Should Be      css:.field-error > span     กรุณาแนบรูปถ่ายบัตรประชาชน และรูปถ่ายคู่กับบัตรประชาชน (selfie) ตามตัวอย่างการแนบเอกสาร

[Fail] Because ID card number blacklist.
    [Tags]    ALL  fail  MNP_PK09
    Open Landing Page           ${page}
    Select MNP Package          ${packageName} 
    Click Add To Cart Button
    Input Personal Detail       ${firstName}    ${lastName}    ${emailAddress}     ${contact_number}     ${idCardBacklist}
    Input ID Card Image
    Element Text Should Be      css:.field-error > span     ${default_err_msg}

[Fail] Because ID card number invalid.
    [Tags]    ALL  fail  MNP_PK10
    Open Landing Page           ${page}
    Select MNP Package          ${packageName} 
    Click Add To Cart Button
    Input Personal Detail       ${firstName}    ${lastName}    wrong@com     ${contact_number}     ${idCard}
    Input ID Card Image
    Element Text Should Be      css:.field-error > span     อีเมล์ที่ระบุไม่ถูกต้อง กรุณาตรวจสอบอีกครั้ง

[Fail] Because age must not be less than 18 years.
    [Tags]    ALL  fail  MNP_PK15
    Open Landing Page           ${page}
    Select MNP Package          ${packageName} 
    Click Add To Cart Button
    #Input Personal Detail       ${firstName}    ${lastName}    ${emailAddress}     ${contact_number}     ${idCard}
    #Input ID Card Image
    #Element Text Should Be      css:.field-error > span     ขออภัย ผู้ใช้บริการที่มีอายุต่ำกว่า 18 ปี กรุณาติดต่อ dtac call center 1678 หรือ ติดต่อดีแทคฮอลล์ทุกสาขา

[Fail] Because Port-in number on porting process.
    [Tags]    ALL  fail  MNP_PK12
    Open Landing Page           ${page}
    Select MNP Package          ${packageName} 
    Click Add To Cart Button
    Input Personal Detail       ${firstName}    ${lastName}    ${emailAddress}     ${contact_number}     ${idCard}
    Input ID Card Image
    Continue MNP Step
    Input Shipping Address      ที่อยู่จัดส่ง  ${addressLine1} ${MNPNumber}     ${subDistrictBill}     ${district}     ${province}     ${postcode}
    Continue MNP Step
    Confirm Page
    Input Portin Number         0893030178
    Click Confirm Button
    Wait Until Page Contains    [PS01] ดีแทคได้รับคำขอย้ายค่ายสำหรับหมายเลขนี้เรียบร้อยแล้ว และขณะนี้อยู่ในระหว่างการตรวจสอบคำขอย้ายค่าย   20
    #Element Text Should Be      css:div.messages .message-error div     รายการของคุณไม่สามารถทำรายการได้ในขณะนี้
    #ดีแทคได้รับคำขอย้ายค่ายสำหรับหมายเลขนี้เรียบร้อยแล้ว และขณะนี้อยู่ในระหว่างการตรวจสอบคำขอย้ายค่าย

[Fail] Because Port-in number incorrect format.
    [Tags]    ALL  fail  MNP_PK14
    Open Landing Page           ${page}
    Select MNP Package          ${packageName} 
    Click Add To Cart Button
    Input Personal Detail       ${firstName}    ${lastName}    ${emailAddress}     ${contact_number}     ${idCard}
    Input ID Card Image
    Continue MNP Step
    Input Shipping Address      ที่อยู่จัดส่ง  ${addressLine1} ${MNPNumber}     ${subDistrictBill}     ${district}     ${province}     ${postcode}
    Continue MNP Step
    Confirm Page
    Input Portin Number         08930301
    Element Text Should Be      css:.field-error > span     กรุณาระบุเบอร์ในรูปแบบ 0XXXXXXXXX

[Fail] Because Port-in number is succcessd.
    [Tags]    ALL  fail  MNP_PK22
    Open Landing Page           ${page}
    Select MNP Package          ${packageName} 
    Click Add To Cart Button
    Input Personal Detail       ${firstName}    ${lastName}    ${emailAddress}     ${contact_number}     ${idCard}
    Input ID Card Image
    Continue MNP Step
    Input Shipping Address      ที่อยู่จัดส่ง  ${addressLine1} ${MNPNumber}     ${subDistrictBill}     ${district}     ${province}     ${postcode}
    Continue MNP Step
    Confirm Page
    Input Portin Number         0893030152
    Click Confirm Button
    Wait Until Page Contains    [PS01] ดีแทคได้รับคำขอย้ายค่ายสำหรับหมายเลขนี้เรียบร้อยแล้ว และขณะนี้อยู่ในระหว่างการตรวจสอบคำขอย้ายค่าย    20
    #Element Text Should Be      css:div.messages .message-error div     ดีแทคได้รับคำขอย้ายค่ายสำหรับหมายเลขนี้เรียบร้อยแล้ว และขณะนี้อยู่ในระหว่างการตรวจสอบคำขอย้ายค่าย

[Fail] Because Port-in number is dTac number.
    [Tags]    ALL  fail  MNP_PK16
    Open Landing Page           ${page}
    Select MNP Package          ${packageName} 
    Click Add To Cart Button
    Input Personal Detail       ${firstName}    ${lastName}    ${emailAddress}     ${contact_number}     ${idCard}
    Input ID Card Image
    Continue MNP Step
    Input Shipping Address      ที่อยู่จัดส่ง  ${addressLine1} ${MNPNumber}     ${subDistrictBill}     ${district}     ${province}     ${postcode}
    Continue MNP Step
    Confirm Page
    Input Portin Number         0813097084
    Click Confirm Button
    Wait Until Page Contains    [1504] หมายเลขโทรศัพท์นี้เป็นเบอร์ในเครือข่ายดีแทค (dtac หรือ DTN) อยู่แล้ว ไม่สามารถดำเนินการย้ายค่ายได้  20

[Fail] Because Port-in number is line mobile.
    [Tags]    ALL  fail  MNP_PK17
    Open Landing Page           ${page}
    Select MNP Package          ${packageName} 
    Click Add To Cart Button
    Input Personal Detail       ${firstName}    ${lastName}    ${emailAddress}     ${contact_number}     ${idCard}
    Input ID Card Image
    Continue MNP Step
    Input Shipping Address      ที่อยู่จัดส่ง  ${addressLine1} ${MNPNumber}     ${subDistrictBill}     ${district}     ${province}     ${postcode}
    Continue MNP Step
    Confirm Page
    Input Portin Number         0633130746
    Click Confirm Button
    Wait Until Page Contains    หมายเลขนี้อยู่ในระบบ Line Mobile ซึ่งไม่สามารถขอย้ายค่ายออนไลน์ได้ในขณะนี้ กรุณาติดต่อ dtac hall หรือ dtac center เพื่อดำเนินการเปลี่ยนมาใช้ดีแทค ขออภัยในความไม่สะดวก  20

[Fail] Because input PIN Code less than 8 digits..
    [Tags]    ALL  fail  MNP_PK19
    Open Landing Page           ${page}
    Select MNP Package          ${packageName} 
    Click Add To Cart Button
    Input Personal Detail       ${firstName}    ${lastName}    ${emailAddress}     ${contact_number}     ${idCard}
    Input ID Card Image
    Continue MNP Step
    Input Shipping Address      ที่อยู่จัดส่ง  ${addressLine1} ${MNPNumber}     ${subDistrictBill}     ${district}     ${province}     ${postcode}
    Continue MNP Step
    Confirm Page
    Input Portin Number         0893030152
    Input Text                  css:#form-reconfirm > div.step-content.pin-code > div.field._required > div > input     9000100
    Wait Until Page Contains    รหัสย้ายค่ายที่ระบุไม่ถูกต้อง กรุณาระบุรหัสย้ายค่ายที่ได้รับทาง SMS
    #กรุณาระบุ PIN code ซึ่งเป็นตัวเลข 8 หลัก ที่ได้รับทาง SMS
