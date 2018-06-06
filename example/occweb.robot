*** Settings ***
Library          Selenium2Library
Library 	 Screenshot
Suite Teardown   Close All Browsers

*** Variables ***

*** Test Cases ***
Open OCC Site
    Open Headless Chrome
    Go To    https://dtaconline-test.dtac.co.th/
    Capture Page Screenshot	
    Go to    https://dtaconline-test.dtac.co.th/smartphones-tablets/apple.html
    Capture Page Screenshot

*** Keywords ***
Open Headless Chrome
    ${chrome_options}=    Set Chrome Options
    Create Webdriver    Chrome    chrome_options=${chrome_options}
    Set Window Size    1024    720
    Set Window Position    0    0
    Go To  data:,

Set Chrome Options
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    : FOR  ${option}  IN  --disable-infobars  --headless  --no-sandbox --disable-gpu  --allow-insecure-localhost
    \    Call Method    ${options}    add_argument    ${option}
    [Return]    ${options}
