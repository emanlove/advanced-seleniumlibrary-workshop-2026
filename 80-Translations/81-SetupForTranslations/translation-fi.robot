*** Settings ***
Library     SeleniumLibrary    language=FI

*** Test Cases ***
Suomalainen testitapaus - A Finnish Test Case
    Avaa Selain    https://pypi.org/project/robotframework-seleniumlibrary-translation/    chrome
    @{linkit}=    Hae Kaikki Linkit    # Get All The Links