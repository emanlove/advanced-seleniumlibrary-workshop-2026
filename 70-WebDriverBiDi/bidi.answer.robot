*** Settings ***
Library    SeleniumLibrary
Library    RequestHandler_answer.py

Documentation    Implement the following keywords:
...    Open Firefox With BiDi Support
...    Open Chrome With BiDi Support
...    Append Console Messages To List


*** Test Cases ***
Get Console Messages With Firefox
    Open Firefox With BiDi Support    http://localhost:7272
    Wait Until Page Contains    Login Page

    VAR    @{console_messages}
    Append Console Messages To List    ${console_messages}

    Go To    http://localhost:7272/bidi.html
    Wait Until Page Contains    RoboCon 2025 SeleniumLibrary workshop
    Wait Until Keyword Succeeds    1 second    100 milliseconds   Should Not Be Empty    ${console_messages}
    Should Be Equal As Strings    ${{ type($console_messages[0]) }}    <class 'selenium.webdriver.common.bidi.log.ConsoleLogEntry'>
    Log    ${console_messages}

Get Console Messages With Chrome
    Open Chrome With BiDi Support    http://localhost:7272
    Wait Until Page Contains    Login Page

    VAR    @{console_messages}
    Append Console Messages To List    ${console_messages}

    Go To    http://localhost:7272/bidi.html
    Wait Until Page Contains    RoboCon 2025 SeleniumLibrary workshop
    Wait Until Keyword Succeeds    1 second    100 milliseconds   Should Not Be Empty    ${console_messages}
    Should Be Equal As Strings    ${{ type($console_messages[0]) }}    <class 'selenium.webdriver.common.bidi.log.ConsoleLogEntry'>
    Log    ${console_messages}

Add Request Header With Firefox
    Open Firefox With BiDi Support    http://localhost:5000/index.html
    ${driver} =    Get Driver Instance
    Attach Request Handler    ${driver}
    Go To    http://localhost:5000/header
    Wait Until Page Contains    Ok
    Page Should Not Contain    Bad Request

Add Request Header With Chrome
    # Doesn't seem to work on Chrome at the moment
    No Operation
    # Open Chrome With BiDi Support    http://localhost:5000/index.html
    # ${driver} =    Get Driver Instance
    # Attach Request Handler    ${driver}
    # Go To    http://localhost:5000/header
    # Wait Until Page Contains    Ok
    # Page Should Not Contain    Bad Request

*** Keywords ***
Open Firefox With BiDi Support
    [Arguments]    ${page}
    VAR    ${options}    ${{ selenium.webdriver.FirefoxOptions() }}
    ${options.enable_bidi} =    Evaluate    True
    Open Browser    ${page}    headlessfirefox    options=${options}

Open Chrome With BiDi Support
    [Arguments]    ${page}
    ${options} =    Evaluate    selenium.webdriver.ChromeOptions()
    ${options.enable_bidi} =    Evaluate    True
    Open Browser    ${page}    headlesschrome    options=${options}

Get Driver Instance
    ${sl_instance} =    Get Library Instance    SeleniumLibrary
    ${driver} =    Evaluate    $sl_instance.driver
    RETURN    ${driver}

Append Console Messages To List
    [Documentation]    Add a console message handler to the driver instance that appends messages to a list.
    ...    You will want to use add_console_message_handler($list.append)
    [Arguments]    ${list}
    ${driver} =    Get Driver Instance
    # this seems to be somehow asynchronous and especially finicky with Chrome
    # might need even 10 second sleep
    Evaluate    $driver.script.add_console_message_handler($list.append)
    Sleep    5 seconds
