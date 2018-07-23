*** Setting ***
Library          SeleniumLibrary
Resource         data.robot
Resource         keywords_occ.robot
Resource         keywords_occ_device.robot
Suite Setup      Open Chrome And Change Language To EN
Suite Teardown   Close All Browsers
*** Variables ***
${URL}  https://dtaconline-test.dtac.co.th/smartphones-tablets/apple.html

*** Test Cases ***
Open Product Landing Page
    [Tags]    PK_01
    Choose Device  iPhone X
    Scroll To Text       Current dtac postpaid
    Page Should Contain  Current dtac postpaid
    Page Should Contain  Specs and Key Features
    Page Should Contain  Terms and Conditions of online purchasing via dtac online store

Open Product page
    [Tags]    PK_02
    Choose Current Dtac Postpaid Iphone X

Open Package page
    [Tags]    PK_03
    Choose Silver iPhoneX 256 GB Current
     

Popup Phone number page
    [Tags]    PK_04
    Choose Silver iPhoneX 256 GB Current
    Click Product Contiune
    Choose Package 599

Popup OTP
    [Tags]    PK_05
    Choose Silver iPhoneX 256 GB Current
    Click Product Contiune
    Choose Package 599
    # Input Mobile Number  0811017188
    Input Mobile Number  0811017188
    # Input OTP  1234

Open Package page Enter Phone number Pass
    [Tags]    PK_06
    Choose Silver iPhoneX 256 GB Current
    Click Product Contiune
    Choose Package 599
    Input Mobile Number  0811017188
    Input OTP  1234

Shopping Cart page
    [Tags]    PK_07
    Choose Silver iPhoneX 256 GB Current
    Click Product Contiune
    Choose Package 599
    Input Mobile Number  0811017188
    Input OTP  1234
    Wait Loading Invisible
    Js Click Element  usage_343
    Click Terms Condition
    Click Next To Shopping Cart

Address page
    [Tags]    PK_08
    Choose Silver iPhoneX 256 GB Current
    Click Product Contiune
    Choose Package 599
    Input Mobile Number  0811017188
    Input OTP  1234
    Wait Loading Invisible
    Js Click Element  usage_343
    Click Terms Condition
    Click Next To Shopping Cart
    Wait Until Page Contains  You added device and package to your shopping cart.
    Click Element  css:#maincontent div.cart-container > div.cart-summary > ul > li > button > span
    Input Personal Detail In Shipping Address
    Select Shipping Type As Delivery
    Input Shipping Address Device  Shipping Address  ${addressLine_en}  ${subDistrict_en}  ${district_en}  ${province_en}  ${postcode_en}
    Select Company Full Tax Invoice  9111111111111  Dtac  Siam

Payment page
    [Tags]    PK_09
    Choose Silver iPhoneX 256 GB Current
    Click Product Contiune
    Choose Package 599
    Input Mobile Number  0811017188
    Input OTP  1234
    Wait Loading Invisible
    Js Click Element  usage_343
    Click Terms Condition
    Click Next To Shopping Cart
    Wait Until Page Contains  You added device and package to your shopping cart.
    Click Element  css:#maincontent div.cart-container > div.cart-summary > ul > li > button > span
    Input Personal Detail In Shipping Address
    Select Shipping Type As Delivery
    Input Shipping Address Device  Shipping Address  ${addressLine_en}  ${subDistrict_en}  ${district_en}  ${province_en}  ${postcode_en}
    Select Company Full Tax Invoice  9111111111111  Dtac  Siam
    Click Next To Payment

Omise and the bank
    [Tags]    PK_10
    Choose Silver iPhoneX 256 GB Current
    Click Product Contiune
    Choose Package 599
    Input Mobile Number  0811017188
    Input OTP  1234
    Wait Loading Invisible
    Js Click Element  usage_343
    Click Terms Condition
    Click Next To Shopping Cart
    Wait Until Page Contains  You added device and package to your shopping cart.
    Click Element  css:#maincontent div.cart-container > div.cart-summary > ul > li > button > span
    Input Personal Detail In Shipping Address
    Select Shipping Type As Delivery
    Input Shipping Address Device  Shipping Address  ${addressLine_en}  ${subDistrict_en}  ${district_en}  ${province_en}  ${postcode_en}
    Select Company Full Tax Invoice  9111111111111  Dtac  Siam
    Click Next To Payment
    Choose Credit Card

# UseCase1 899 to 1499
#     [Tags]    PK_13
#     Choose Silver iPhoneX 256 GB Current
#     Click Product Contiune
#     Sleep  4
#     Choose Package 1499
#     Input Mobile Number  0811015568
#     Input OTP  1234
#     Wait Loading Invisible
#     Js Click Element  usage_339
#     Click Terms Condition
#     Click Next To Shopping Cart
#     # Wait Until Page Contains  You added device and package to your shopping cart.
#     Click Proceed To Checkout  device and package
#     # Click Element  css:#maincontent div.cart-container > div.cart-summary > ul > li > button > span
#     Input Personal Detail In Shipping Address
#     Select Shipping Type As Delivery
#     Input Shipping Address Device  Shipping Address  ${addressLine_en}  ${subDistrict_en}  ${district_en}  ${province_en}  ${postcode_en}
#     Select Company Full Tax Invoice  9111111111111  Dtac  Siam
#     Click Next To Payment
#     Choose Cash On Delivery

# UseCase2 899 to 1099
#     [Tags]    PK_14
#     Choose Silver iPhoneX 256 GB Current
#     Click Product Contiune
#     Wait Loading Invisible
#     Sleep  4
#     Choose Package 1099
#     Input Mobile Number  0811015568
#     Input OTP  1234
#     Wait Loading Invisible
#     Js Click Element  usage_337
#     Click Terms Condition
#     Click Next To Shopping Cart
#     Click Proceed To Checkout  device and package
#     Input Personal Detail In Shipping Address
#     Select Shipping Type As Delivery
#     Input Shipping Address Device  Shipping Address  ${addressLine_en}  ${subDistrict_en}  ${district_en}  ${province_en}  ${postcode_en}
#     Select Company Full Tax Invoice  9111111111111  Dtac  Siam
#     Click Next To Payment
#     Choose Credit Card

# UseCase3 599 to 899
#     [Tags]    PK_15
#     Choose Silver iPhoneX 256 GB Current
#     Click Product Contiune
#     Wait Loading Invisible
#     Sleep  4
#     Choose Package 1099
#     Input Mobile Number  0811015568
#     Input OTP  1234
#     Wait Loading Invisible
#     # Js Click Element  usage_339
#     # Click Terms Condition
#     # Click Next To Shopping Cart
#     # # Wait Until Page Contains  You added device and package to your shopping cart.
#     # Click Proceed To Checkout  device and package
#     # # Click Element  css:#maincontent div.cart-container > div.cart-summary > ul > li > button > span
#     # Input Personal Detail In Shipping Address
#     # Select Shipping Type As Delivery
#     # Input Shipping Address Device  Shipping Address  ${addressLine_en}  ${subDistrict_en}  ${district_en}  ${province_en}  ${postcode_en}
#     # Select Company Full Tax Invoice  9111111111111  Dtac  Siam
#     # Click Next To Payment
#     # Choose Installment

# UseCase4 899 to 699
#     [Tags]    PK_16
#     Choose Silver iPhoneX 256 GB Current
#     Click Product Contiune
#     Wait Loading Invisible
#     Sleep  4
#     Choose Package 699
#     Input Mobile Number  0811015568
#     Input OTP  1234
#     Wait Loading Invisible
#     Js Click Element  use-new-package
#     Js Click Element  usage
#     Js Click Element  usage_330
#     Click Terms Condition
#     Click Next To Shopping Cart
#     Click Proceed To Checkout  device and package
#     Input Personal Detail In Shipping Address
#     Select Shipping Type As Delivery
#     Input Shipping Address Device  Shipping Address  ${addressLine_en}  ${subDistrict_en}  ${district_en}  ${province_en}  ${postcode_en}
#     Select Company Full Tax Invoice  9111111111111  Dtac  Siam
#     Click Next To Payment
#     Choose Internet Banking

# UseCase5 899 to 599
#     [Tags]    PK_17
#     Choose Silver iPhoneX 256 GB Current
#     Click Product Contiune
#     Wait Loading Invisible
#     Sleep  4
#     Choose Package 599
#     Input Mobile Number  0811015568
#     Input OTP  1234
#     Wait Loading Invisible
#     Js Click Element  use-new-package
#     Js Click Element  usage
#     Js Click Element  usage_343
#     Click Terms Condition
#     Click Next To Shopping Cart
#     Click Proceed To Checkout  device and package
#     Input Personal Detail In Shipping Address
#     Select Shipping Type As Get Product At Branch
#     Select Branch For Pick up  dtac hall Future Park Rangsit
#     Input Billing Address  Billing Address  ${addressLine_en}  ${subDistrict_en}  ${district_en}  ${province_en}  ${postcode_en}
#     Click Next To Payment
#     Choose Installment

# UseCase6 599 to 599
#     [Tags]    PK_18
#     Choose Silver iPhoneX 256 GB Current
#     Click Product Contiune
#     Wait Loading Invisible
#     Sleep  4
#     Choose Package 599
#     # Input Mobile Number  0811015568
#     # Input OTP  1234
#     # Wait Loading Invisible
#     # Js Click Element  use-new-package
#     # Js Click Element  usage
#     # Js Click Element  usage_343
#     # Click Terms Condition
#     # Click Next To Shopping Cart
#     # Click Proceed To Checkout  device and package
#     # Input Personal Detail In Shipping Address
#     # Select Shipping Type As Get Product At Branch
#     # Select Branch For Pick up  dtac hall Future Park Rangsit
#     # Input Shipping Address Device  Shipping Address  ${addressLine_en}  ${subDistrict_en}  ${district_en}  ${province_en}  ${postcode_en}
#     # Select Company Full Tax Invoice  9111111111111  Dtac  Siam
#     # Click Next To Payment
#     # Choose Installment

# UseCase6 599 to 599
#     [Tags]    PK_19
#     Choose Silver iPhoneX 256 GB Current
#     Click Product Contiune
#     Wait Loading Invisible
#     Sleep  4
#     Choose Package 599
#     # Input Mobile Number  0811015568
#     # Input OTP  1234
#     # Wait Loading Invisible
#     # Js Click Element  use-new-package
#     # Js Click Element  usage
#     # Js Click Element  usage_343
#     # Click Terms Condition
#     # Click Next To Shopping Cart
#     # Click Proceed To Checkout  device and package
#     # Input Personal Detail In Shipping Address
#     # Select Shipping Type As Get Product At Branch
#     # Select Branch For Pick up  dtac hall Future Park Rangsit
#     # Input Shipping Address Device  Shipping Address  ${addressLine_en}  ${subDistrict_en}  ${district_en}  ${province_en}  ${postcode_en}
#     # Select Company Full Tax Invoice  9111111111111  Dtac  Siam
#     # Click Next To Payment
#     # Choose Installment

# UseCase6 899
#     [Tags]    PK_20
#     Choose Silver iPhoneX 256 GB Current
#     Click Product Contiune
#     Wait Loading Invisible
#     Sleep  4
#     Choose Package 899
#     Input Mobile Number  0811015568
#     Input OTP  1234
#     Wait Loading Invisible
#     Js Click Element  current-package-id
#     Click Terms Condition
#     Click Next To Shopping Cart
#     Click Proceed To Checkout  device and package
#     Input Personal Detail In Shipping Address
#     Select Shipping Type As Delivery
#     Input Shipping Address Device  Shipping Address  ${addressLine_en}  ${subDistrict_en}  ${district_en}  ${province_en}  ${postcode_en}
#     Select Company Full Tax Invoice  9111111111111  Dtac  Siam
#     Click Next To Payment
#     Choose Cash On Delivery