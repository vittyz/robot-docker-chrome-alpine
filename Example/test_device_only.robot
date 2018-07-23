*** Setting ***
Library    SeleniumLibrary
Resource         data.robot
Resource         keywords_occ.robot
Resource         keywords_occ_device.robot
Suite Setup     Open Chrome And Change Language To EN
Suite Teardown  Close All Browsers
*** Test Cases ***
Open Product Landing Page
    [Tags]    DV_01
    Choose Device  iPhone X
    Scroll To Text  Handset only
    Page Should Contain  Handset only
    Page Should Contain  Specs and Key Features
    Page Should Contain  Terms and Conditions of online purchasing via dtac online store

Open Product Page
    [Tags]    DV_02
    Choose Silver iPhoneX 256 GB Handset only

Open Shopping Cart page
    [Tags]    DV_03
    Choose Silver iPhoneX 256 GB Handset only
    Click Add To Cart Button
    Page Should Contain  iPhone X
    Page Should Contain  Capacity
    Page Should Contain  256GB
    Page Should Contain  Color
    Page Should Contain  Silver

Open Shopping Cart page Edit
    [Tags]    DV_03_01
    Choose Silver iPhoneX 256 GB Handset only
    Click Add To Cart Button
    Click Edit Item 
    Choose 64GB
    Choose Color Space Gray
    Click Add To Cart Button
    Page Should Contain  iPhone X
    Page Should Contain  64GB
    Page Should Contain  Color
    Page Should Contain  Space Gray

Open Shopping Cart page Remove
    [Tags]    DV_03_02
    Choose Silver iPhoneX 256 GB Handset only
    Click Add To Cart Button
    Sleep    1.5
    Click Delete Item
    Sleep    1
    Page Should Contain  You have no items in your shopping cart.


Address Page Delivery to home 
    [Tags]    DV_05  DV_05_00
    Choose Silver iPhoneX 256 GB Handset only
    Click Add To Cart Button
    Click Proceed To CheckOut  iPhone X
    Input Personal Detail In Shipping Address
    Select Shipping Type As Delivery
    Input Shipping Address Device  Shipping Address  ${addressLine_en}  ${subDistrict_en}  ${district_en}  ${province_en}  ${postcode_en}


Address page Delivery to Store
    [Tags]    DV_05  DV_05_01
    Choose Silver iPhoneX 256 GB Handset only
    Click Add To Cart Button
    Click Proceed To CheckOut  iPhone X
    Input Personal Detail In Shipping Address
    Select Shipping Type As Get Product At Branch
    Select Branch For Pick up  dtac hall Future Park Rangsit(G Fl.)
    Input Billing Address  Billing Address  ${addressLine_en}  ${subDistrict_en}  ${district_en}  ${province_en}  ${postcode_en}


Address page Delivery to Store Full Invoice
    [Tags]    DV_05  DV_05_02
    Choose Silver iPhoneX 256 GB Handset only
    Click Add To Cart Button
    Click Proceed To CheckOut  iPhone X
    Input Personal Detail In Shipping Address
    Select Shipping Type As Get Product At Branch
    Select Branch For Pick up  dtac hall Future Park Rangsit(G Fl.)
    Select Personal Full Tax Invoice  9111111111111
    Input Billing Address  Billing Address  ${addressLine_en}  ${subDistrict_en}  ${district_en}  ${province_en}  ${postcode_en}


Address page Delivery to Store Full Invoice Company
    [Tags]    DV_05  DV_05_03
    Choose Silver iPhoneX 256 GB Handset only
    Click Add To Cart Button
    Click Proceed To CheckOut  iPhone X
    Input Personal Detail In Shipping Address
    Select Shipping Type As Get Product At Branch
    Select Branch For Pick up  dtac hall Future Park Rangsit(G Fl.)
    Select Company Full Tax Invoice  9111111111111  Dtac  Siam
    Input Billing Address  Billing Address  ${addressLine_en}  ${subDistrict_en}  ${district_en}  ${province_en}  ${postcode_en}


Payment page
    [Tags]    DV_06
    Choose Device  Samsung Galaxy J7 Core
    Choose Buying Type  Handset only
    Choose Color Black
    Click Add To Cart Button
    Click Proceed To CheckOut  Samsung Galaxy J7 Core
    Input Personal Detail In Shipping Address
    Select Shipping Type As Delivery
    Input Shipping Address Device  Shipping Address  ${addressLine_en}  ${subDistrict_en}  ${district_en}  ${province_en}  ${postcode_en}
    Click Next To Payment
    Wait Until Payment Page Visible


Omise and the bank Credit Card Installment
    [Tags]    DV_07   DV_07_01
    Choose Silver iPhoneX 256 GB Handset only
    Click Add To Cart Button
    Click Proceed To CheckOut  iPhone X
    Input Personal Detail In Shipping Address
    Select Shipping Type As Delivery
    Input Shipping Address Device  Shipping Address  ${addressLine_en}  ${subDistrict_en}  ${district_en}  ${province_en}  ${postcode_en}
    Click Next To Payment
    Choose Installment
    # Click Place Order
    # Wait Until Page Contains  Testing offsite payments
    # Click Link  Success
    # Capture Page Screenshot    ${screen_path}/${TEST NAME}.png


Omise and the bank Credit Card 
    [Tags]    DV_07  DV_07_02
    Choose Silver iPhoneX 256 GB Handset only
    Click Add To Cart Button
    Click Proceed To CheckOut  iPhone X
    Input Personal Detail In Shipping Address
    Select Shipping Type As Delivery
    Input Shipping Address Device  Shipping Address  ${addressLine_en}  ${subDistrict_en}  ${district_en}  ${province_en}  ${postcode_en} 
    Click Next To Payment
    Choose Credit Card
    # Click Place Order
    # Wait Until Page Contains  You have successfully completed your order
    # Capture Page Screenshot    ${screen_path}/${TEST NAME}.png


Omise and the bank Internet Banking
    [Tags]    DV_07  DV_07_03
    Choose Silver iPhoneX 256 GB Handset only
    Click Add To Cart Button
    Click Proceed To CheckOut  iPhone X
    Input Personal Detail In Shipping Address
    Select Shipping Type As Delivery
    Input Shipping Address Device  Shipping Address  ${addressLine_en}  ${subDistrict_en}  ${district_en}  ${province_en}  ${postcode_en}
    Click Next To Payment
    Choose Internet Banking
    # Click Place Order
    # Wait Until Page Contains  Testing offsite payments
    # Click Link  Success
    # Capture Page Screenshot    ${screen_path}/${TEST NAME}.png


Omise and the bank Cash On Delivery
    [Tags]    DV_07  DV_07_04
    Choose Silver iPhoneX 256 GB Handset only
    Click Add To Cart Button
    Click Proceed To CheckOut  iPhone X
    Input Personal Detail In Shipping Address
    Select Shipping Type As Delivery
    Input Shipping Address Device  Shipping Address  ${addressLine_en}  ${subDistrict_en}  ${district_en}  ${province_en}  ${postcode_en}
    Click Next To Payment
    Choose Cash On Delivery
    # Click Place Order
    # Wait Until Page Contains  You have successfully completed your order
    # Capture Page Screenshot    ${screen_path}/${TEST NAME}.png


