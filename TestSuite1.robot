*** Settings ***
Suite Setup       GoToHomePage
Suite Teardown    Close All Browsers
Library           SeleniumLibrary

*** Variables ***
${url}            https://opensource-demo.orangehrmlive.com/
@{CREDENTIALS}    Admin    admin123
&{LOGIN}          Username=Admin    Password=admin123

*** Test Cases ***
TC1
    Open Browser    https://www.udemy.com/course/robot-frameworkride-selenium-step-by-step-for-beginners/learn/lecture/10377884#content    chrome
    Close Browser

TC2
    Open Browser    ${url}    chrome
    Input Text    id=txtUsername    ${CREDENTIALS}[0]
    Input Password    id=txtPassword    ${LOGIN}[Password]
    Click Button    id=btnLogin
    Close Browser
    Log To Console    %{username} ran this test on %{os}
    Set Tags    Smoke

TC3
    [Tags]    tc3    Sanity
    [Setup]    Log To Console    Test Case Started
    Login
    [Teardown]    Log To Console    Test Case Complete

TC4
    [Tags]    test4    Sanity
    Log To Console    Test Started
    Open Browser    https://google.com    chrome
    Close All Browsers
    Log To Console    Test4 Completed

*** Keywords ***
Login
    Input Text    id=txtUsername    admin
    Input Password    id=txtPassword    admin123
    Click Button    id=btnLogin

GoToHomePage
    Open Browser    ${url}    chrome
    
LogOut
    Input Text      id=txtUsername    