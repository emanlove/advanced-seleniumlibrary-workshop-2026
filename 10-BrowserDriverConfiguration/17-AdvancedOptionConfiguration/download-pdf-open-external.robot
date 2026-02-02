*** Settings ***
Library  SeleniumLibrary

*** Test Cases ***
Download PDF And Open Outside The Browser
    Open Browser  about:blank  chrome  # ??
    Go To    https://gofore.com/media/test-automation-project-radar-2024.pdf
    Sleep  10sec