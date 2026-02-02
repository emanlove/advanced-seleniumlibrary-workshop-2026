*** Settings ***
Library           SeleniumLibrary
Library           ./GetSeleniumLibraryInstance.py

*** Test Cases ***
Use InheritSeleniumLibrary Open Browser Keyword
    GetSeleniumLibraryInstance.Open Browser     google
    ${browser_name} =    GetSeleniumLibraryInstance.Get BrowserName
    Log    \nBrowser name: ${browser_name}    console=${True}
    [Teardown]    Close Browser