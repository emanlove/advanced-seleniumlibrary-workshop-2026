*** Settings ***
Library  SeleniumLibrary

*** Test Cases ***
Example of executing hard-coded JavaScript code
    Open Browser    about:blank    Chrome
    Execute Javascript    alert('Hello World!')
    Sleep  2secs

Example of passing an argument to the JavaScript code
    Open Browser    about:blank    Chrome
    Execute Javascript    ARGUMENTS    My name is Ed    JAVASCRIPT    alert(arguments[0])
    Sleep  2secs

Argument a robot variable
    ${name}=  Set Variable   Bob
    Open Browser    about:blank    Chrome
    Execute Javascript    ARGUMENTS    My name is ${name}    JAVASCRIPT    alert(arguments[0])
    Sleep  2secs

Example of passing several arguments
    Open Browser    about:blank    Chrome
    Execute Javascript    ARGUMENTS    My name is   Jan    JAVASCRIPT    alert(arguments[0]+' '+arguments[1])
    Sleep  2secs
