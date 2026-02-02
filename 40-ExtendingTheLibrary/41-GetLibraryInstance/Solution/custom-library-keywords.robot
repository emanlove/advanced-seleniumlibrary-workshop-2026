*** Settings ***
Library           SeleniumLibrary
Library           ./SeleniumLibraryExtensions.py

*** Test Cases ***
Use InheritSeleniumLibrary Open Browser Keyword
    Open Browser  about:blank  Chrome
    ${capabilities} =    SeleniumLibraryExtensions.Get Current Browser Capabilities
    Log    \nCurrent Browser Capabilities: ${capabilities}    console=${True}
    [Teardown]    Close Browser