*** Setting ***
Resource         keywords_occ.robot

*** Keyword ***
Choose Silver iPhoneX 256 GB Handset only
    Choose Handset only Iphone X
    Choose 256GB
    Choose Color Silver

Choose Silver iPhoneX 256 GB Current
    Choose Current Dtac Postpaid Iphone X
    Choose 256GB
    Choose Color Silver

Choose Handset only Iphone X
    Choose Device  iPhone X
    Log    Select iPhone X

    ${url}=   Get Location
    Log    ${url}
    Capture Page Screenshot
    
    Wait Until Element Is Visible  css:#maincontent div:nth-child(1) > div > div.landing-product-item-name > a
    Page Should Contain Element  css:#maincontent  div.product.media  div.fotorama__stage__frame.fotorama_vertical_ratio.fotorama__loaded.fotorama__loaded--img.fotorama__fade-rear.fotorama__loaded--full.fotorama__active > img.fotorama__img
    Choose Buying Type  Handset only

Choose Buying Type
    [Arguments]  ${BuyingType}
    Capture Page Screenshot
    Wait Until Element Is Visible  css:#maincontent div:nth-child(1) > div > div.landing-product-item-name > a
    Capture Page Screenshot
    Scroll And Click Link  ${BuyingType}
    

Choose Current Dtac Postpaid Iphone X
    Choose Device  iPhone X
    Choose Buying Type  Current dtac postpaid

Choose Device 
    [Arguments]  ${device}
    Go To  ${SITE_URL}
    Choose Smartphones&Tablets
    Wait Until Page Contains  iPhone X
    Scroll And Click Link    ${device}

Choose Smartphones&Tablets
    Go To               ${SITE_URL}
    Click Link    Menu
    Sleep    0.5
    Click Link  Smartphones & Tablets

Input Shipping Address Device
    [Arguments]     ${titlePage}  ${address}    ${subdistrict}    ${district}     ${province}     ${postcode}
    Wait Until Page Contains                ${titlePage}
    #Wait Loading Invisible
    Input Text                              street[0]         ${address}
    Select Shipping Subdistrict                  ${subdistrict}    ${district}     ${province}     ${postcode}

Select Shipping Subdistrict
    [Arguments]     ${subdistrict}    ${district}     ${province}     ${postcode}
    Click Element                   css:div.action-select.action-multiselect
    Input Text                      css:div.action-multiselect-search-wrap input         ${subdistrict}
    Sleep  0.5 
    Click Element                   css:div.action-menu._active ul li:nth-child(1)
    Element Text Should Be          css:form fieldset:nth-child(5) div.action-multiselect-text     ${district} 
    Element Text Should Be          css:form fieldset:nth-child(7) div.action-multiselect-text     ${province}
    Element Text Should Be          css:form fieldset:nth-child(8) div.action-multiselect-text     ${postcode}

Input Billing Address
    [Arguments]     ${titlePage}  ${address}    ${subdistrict}    ${district}     ${province}     ${postcode}
    Wait Until Page Contains                ${titlePage}
    Wait Loading Invisible
    Input Text                              css:#billing-new-address-form input   ${address}
    Select Billing Subdistrict                  ${subdistrict}    ${district}     ${province}     ${postcode}

Select Billing Subdistrict
    [Arguments]     ${subdistrict}    ${district}     ${province}     ${postcode}
    Click Element                   css:#billing-new-address-form > fieldset.field.admin__control-fields.required.address-subdistrict-field div.action-select.action-multiselect
    Scroll Page To Location         \#billing-new-address-form > fieldset.field.admin__control-fields.required.address-subdistrict-field > legend > span    
    Input Text                      css:#billing-new-address-form div.action-menu._active input         ${subdistrict}
    Sleep   0.5
    Click Element                   css:div.action-menu._active ul li:nth-child(1)
    Element Text Should Be          css:#billing-new-address-form fieldset:nth-child(5) div.action-multiselect-text     ${district} 
    Element Text Should Be          css:#billing-new-address-form fieldset:nth-child(7) div.action-multiselect-text     ${province}
    Element Text Should Be          css:#billing-new-address-form fieldset:nth-child(8) div.action-multiselect-text     ${postcode}

Choose 64GB
    Wait Until Element Is Visible  css:#maincontent div.product-info-top div.product.media div.fotorama-item.fotorama img
    Js Click Element  option-label-choose_capacity-143-item-6

Choose 256GB
    Wait Until Element Is Visible  css:#maincontent div.product-info-top div.product.media div.fotorama-item.fotorama img
    Js Click Element  option-label-choose_capacity-143-item-10

Choose Color Space Gray
    Js Click Element  option-label-color-93-item-8

Choose Color Silver  
    Js Click Element  option-label-color-93-item-11

Choose Color Black
    Wait Until Element Is Visible  id:option-label-color-93-item-95
    Scroll To ID  option-label-color-93-item-95
    Click Element  id:option-label-color-93-item-95

Choose Credit Card
    Wait Loading Invisible
    Wait Until Element Is Visible  css:#checkout-payment-method-load div:nth-child(3) div.payment-method-title.field.choice span
    Click Element  css:#checkout-payment-method-load div:nth-child(3) div.payment-method-title.field.choice span
    Wait Until Element Is Visible  id:omise_ccCardNumber
    Input Text    id:omise_ccCardNumber  4242424242424242
    Input Text    omise_ccCardHolderName  Yok
    Select From List By Label    id:omise_ccCardExpirationMonth  02 - February
    Select From List By Label  id:omise_ccCardExpirationYear  2021
    Input Text  id:omise_ccCardSecurityCode  123
    Js Click Element  cvv-terms-conditions

Choose Cash On Delivery
    Wait Loading Invisible
    Wait Until Element Is Visible  css:#checkout-payment-method-load div:nth-child(2) div.payment-method-title.field.choice span
    Click Element  css:#checkout-payment-method-load div:nth-child(2) div.payment-method-title.field.choice span
    Js Click Element  cod-terms-conditions
    
Choose Installment
    Wait Until Element Is Visible  css:#checkout-payment-method-load div:nth-child(4) div.payment-method-title.field.choice span
    Sleep    1 
    Click Element  css:#checkout-payment-method-load div:nth-child(4) div.payment-method-title.field.choice span
    Choose Kbank
    Select From List By Label  css:#payment_form_omise_im li:nth-child(1) span.rate.secondary-text select  0% 6 months
    Js Click Element  im-terms-conditions

Choose Internet Banking
    Wait Until Element Is Visible  css:#checkout-payment-method-load div:nth-child(5) div.payment-method-title.field.choice span
    Sleep    1
    Click Element  css:#checkout-payment-method-load div:nth-child(5) div.payment-method-title.field.choice span
    Js Click Element  omise_offsite_internetbanking_ktb
    Js Click Element  internetbanking-terms-conditions
    
Input Personal Detail In Shipping Address
    # Wait Loading Invisible
    Wait Until Element Is Enabled   name:firstname 
    Input Text    name:firstname  Anisara
    Input Text    name:lastname  Somsudin
    Input Text    name:email  anisarasomsudin@gmail.com
    Input Text    name:mobile  0846451437

Select Shipping Type As Delivery
    Sleep    2  
    Click Element  css:#shipping_type_delivery_label span

Select Shipping Type As Get Product At Branch
    Sleep    2
    Click Element  css:#shipping_type_store_pickup_label span

Click Proceed To Checkout
    [Arguments]     ${name}
    Wait Loading Invisible
    Wait Until Page Contains  You added ${name} to your shopping cart.
    ${url}=   Get Location
    Log    ${url}
    
    Wait Until Page Contains  Order Total Incl. Tax
    Wait Until Element Is Visible  css:#maincontent div.cart-summary > ul button > span
    Click Element  css:#maincontent div.cart-summary > ul button > span

Click Delete Item
    Click Element  css:a.action.action-delete > span

Choose Package 599
    Wait Until Element Is Visible  css:#priceCarousel > div.owl-nav > div.owl-next
    Js Click Element  \priceCarousel > div.owl-nav > div.owl-next
    Js Click Element  \priceCarousel > div.owl-nav > div.owl-next
    Sleep  2
    Execute Javascript  return jQuery('#priceCarousel > div.owl-stage-outer > div > div:nth-child(5) > div > div > label').click();

Choose Package 699
    Wait Until Element Is Visible  css:#priceCarousel > div.owl-nav > div.owl-next
    Click Element  css:#priceCarousel > div.owl-nav > div.owl-next
    Sleep  2
    Execute Javascript  return jQuery('#priceCarousel > div.owl-stage-outer > div > div:nth-child(4) > div > div > label').click();

Choose Package 899
     Execute Javascript  return jQuery('#priceCarousel > div.owl-stage-outer > div > div:nth-child(3) > div > div > label').click();

Choose Package 1099
     Execute Javascript  return jQuery('#priceCarousel > div.owl-stage-outer > div > div:nth-child(2) > div > div > label').click();

Choose Package 1499
     Execute Javascript  return jQuery('#priceCarousel > div.owl-stage-outer > div > div:nth-child(1) > div > div > label').click();

Js Click Element 
    [Arguments]  ${id}
    Execute Javascript  return jQuery('#${id}').click();

Select Branch For Pick up
    [Arguments]  ${branch}
    Scroll To ID  branch-suggestion-branch 
    Select From List By Label  id:branch-suggestion-branch  ${branch}

Select Personal Full Tax Invoice
    [Arguments]  ${idNumber}
    Js Click Element  show-invoice-shared
    Input Text    css:#form-invoice-fields >div:nth-child(2) input  ${idNumber}

Select Company Full Tax Invoice
    [Arguments]  ${idNumber}  ${companyName}  ${branch}
    Js Click Element  show-invoice-shared
    Scroll Page To Location  \#form-invoice-fields > div:nth-child(1) div:nth-child(2) > input
    Wait Until Element Is Visible  css:#form-invoice-fields > div:nth-child(1) div:nth-child(2) > input
    Js Click Element  form-invoice-fields > div:nth-child(1) div:nth-child(2) > input
    Js Click Element  form-invoice-fields > div:nth-child(1) div:nth-child(2) > input
    Input Text    css:#form-invoice-fields > div:nth-child(2) input   ${idNumber}
    Input Text    css:#form-invoice-fields > div:nth-child(3) input  ${companyName} 
    Input Text    css:#form-invoice-fields > div:nth-child(4) input  ${branch}

Click Next To Payment
    # Wait Until Page Contains  Order Total Incl. Tax
    Scroll Page To Location  \#tigren-shipping-method-buttons-container
    Wait Until Element Is Enabled  id:tigren-shipping-method-buttons-container
    Click Element  css:#tigren-shipping-method-buttons-container button > span

Wait Until Payment Page Visible
    Wait Until Element Is Visible  css:#checkout-payment-method-load div:nth-child(2) div.payment-method-title.field.choice span

Click Place Order
    Scroll Page To Location  \#checkout-payment-method-load > div > div > div.payment-method._active > div.payment-method-content > div.actions-toolbar > div > button
    Click Element  css:#checkout-payment-method-load > div > div > div.payment-method._active > div.payment-method-content > div.actions-toolbar > div > button

# Choose Smartphones&Tablets
#     Click Link     css:div.breadcrumbs li.category3 a

Change Language
    [Arguments]  ${language}
    Wait Loading Invisible
    # Sleep  2
    Wait Until Element Is Visible  id:switcher-language-trigger
    Click Element  id:switcher-language-trigger
    Click Link    ${language}
Input Mobile Number
    [Arguments]  ${mobile}
    Wait Until Element Is Visible  id:mobile-number 
    Input Text  id:mobile-number  ${mobile}
    Click Element  css:#dtac-confirm-number-button > span

Input OTP
    [Arguments]  ${otp}
    Wait Until Element Is Visible  id:otp-code
    Input Text  id:otp-code  ${otp}
    Click Element  css:#dtac-confirm-otp-button > span

Choose New Package 
    Wait Until Element Is Enabled  id:use-new-package
    Js Click Element  use-new-package
    Js Click Element  usage
    Js Click Element  usage_343

Choose Current Package
    Wait Loading Invisible
    Wait Until Element Is Enabled  id:use-current-package
    Scroll To ID  use-current-package
    Js Click Element  use-current-package
    Capture Page Screenshot

Click Product Contiune
    Scroll To ID   product-continue-button
    Click Element  id:product-continue-button

    
Go To And Change Language  
    [Arguments]  ${URL}  ${language}            
    Go To               ${URL} 
    Change Language  ${language} 

Click Edit Item
    Wait Loading Invisible    
    Click Element  css:a.action.action-edit > span
    Wait Loading Invisible

Click Confirm Mobile Number
    Wait Until Element Is Visible  css:body > div.modals-wrapper > aside.modal-popup.confirm._show > div.modal-inner-wrap > footer > button > span
    Click Element  css:body > div.modals-wrapper > aside.modal-popup.confirm._show > div.modal-inner-wrap > footer > button > span

Click Terms Condition
    Wait Until Element Is Visible  id:terms-condition-checkbox
    Js Click Element  terms-condition-checkbox 

Click Next To Shopping Cart
    Click Element  css:#offer-continue-button > span

Choose Kbank
    Click Element  css:#payment_form_omise_im > ul > li:nth-child(1) > label > div.omise-logo-wrapper.kbank
   
