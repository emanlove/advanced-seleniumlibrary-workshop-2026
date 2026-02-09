*** Resources ***
Library  SeleniumLibrary

*** Test Cases ***
Fix for Chrome issue using the Options as String method
    Open Browser    about:blank    chrome    options=add_argument("--no-sandbox");


Fix for Chrome issue using the Options as Class method
    ${ChromeOptions} =    Evaluate    selenium.webdriver.ChromeOptions()
    Call Method    ${ChromeOptions}    add_argument    --no-sandbox
    Open Browser    about:blank    chrome    options=${ChromeOptions}
