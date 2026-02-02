ToDO: This is a placeholder and below is a note which states to give example to the purpose of this exercise 

Depending on how you configure Open Browser keyword with options or service class, from that thread, this seems to be the argument used to correct for that issue ..
If using the string method for options then

```robotframework
*** Test Cases ***
Fix for Chrome issue
    Open Browser    about:blank    chrome    options=add_argument("--no-sandbox");
```
or if you use the class method
```robotframework
*** Test Cases ***
Fix for Chrome issue
    ${ChromeOptions} =    Evaluate    selenium.webdriver.ChromeOptions()
    Call Method    ${ChromeOptions}    add_argument    --no-sandbox
    Open Browser    about:blank    chrome    options=${ChromeOptions}
```