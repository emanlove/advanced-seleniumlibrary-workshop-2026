*** Settings ***
Library  SeleniumLibrary

*** Test Cases ***
Download PDF And Open Outside The Browser
    [Documentation]  Here is how to I came to resolve the challenge
    ...
    ...  First is finding which browser configuration is needed to achieve the desired behavior. This can be
    ...    complex but in general I do a search. In this case the Stackoverflow question provides a good idea.
    ...    There we find this suggestion, in Python,
    ...        chrome_options = webdriver.ChromeOptions();
    ...        chrome_options.add_experimental_option("prefs", {"download.prompt_for_download": False, "plugins.always_open_pdf_externally": True}
    ...
    ...  Next invovles translating the Python code into the Robot syntax. In this case the Python code is
    ...    structured in a way I can simple mimic with the options argument of Open Browser. In Python it
    ...    is creates the ChromeOptions object and then calls the add_experimental_option. So the options
    ...    string does the same and mimics its arguments as well. So we have ..

    Open Browser  about:blank  chrome
    ...    options=add_experimental_option("prefs", {"download.prompt_for_download": False, "plugins.always_open_pdf_externally": True})

    Go To    https://gofore.com/media/test-automation-project-radar-2024.pdf
    Sleep  10sec