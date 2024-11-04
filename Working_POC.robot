*** Settings ***
Library    SeleniumLibrary
Suite Setup    Setup Suite
Suite Teardown    Teardown Suite

*** Variables ***
${Username_ele}     xpath=//*[@placeholder="Username"]
${Pass_ele}     xpath://*[@placeholder="Password"]
${Invalid_username}     Username
${Invalid_password}     Password

*** Test Cases ***
Verify Successful Login to OrangeHRM
    [documentation]  This test case verifies that user is able to successfully Login to OrangeHRM
    [tags]  Smoke
    Open Browser  https://opensource-demo.orangehrmlive.com/  Chrome
    Wait Until Element Is Visible    ${Username_ele}    timeout=10
    Input Text  ${Username_ele}  Admin
    Input Password  ${Pass_ele}  admin123
    Click Element  xpath://button[text()=' Login ']
    Close Browser

Unsuccessful Login with invalid Username
    [Documentation]     Test Login with an invalid username
    Open Browser  https://opensource-demo.orangehrmlive.com/  Chrome
    Wait Until Element Is Visible    ${Username_ele}    timeout=10
    Input Text  ${Username_ele}  ${Invalid_username}
    Input Password  ${Pass_ele}  ${Invalid_password}
    Click Element  xpath://button[text()=' Login ']
    Wait Until Page Contains    Invalid credentials    timeout=10
    Close Browser

Unsuccessful Login with invalid Password
    [Documentation]     Test Login with an invalid password
    Open Browser  https://opensource-demo.orangehrmlive.com/  Chrome
    Wait Until Element Is Visible    ${Username_ele}    timeout=10
    Input Text  ${Username_ele}  Admin
    Input Password  ${Pass_ele}  ${Invalid_password}
    Click Element  xpath://button[text()=' Login ']
    Close Browser

Logout Test
    [Documentation]     Verify that a user can log out successfully
    Open Browser  https://opensource-demo.orangehrmlive.com/  Chrome
    Wait Until Element Is Visible    ${Username_ele}    timeout=10
    Input Text  ${Username_ele}  Admin
    Input Password  ${Pass_ele}  admin123
    Click Element  xpath://button[text()=' Login ']
    Wait Until Element Is Visible     xpath://li[@class="oxd-userdropdown"]   timeout=10
    Click Element   xpath://li[@class="oxd-userdropdown"]
    Wait Until Element Is Visible    xpath://a[text()='Logout']    timeout=10
    Click Link      xpath://a[text()='Logout']
    Close Browser


*** Keywords ***
Setup Suite
     [Documentation]    This keyword sets up the test environment.
     Log    Setting up the test environment
Teardown Suite
    [Documentation]    This keyword tears down the test environment.
    Log    Tearing down the test environment
