*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}      https://www.saucedemo.com/
@{Usernames}        standard_user   locked_out_user problem_user
@{Passwords}        secret_sauce    secret_sauce    secret_sauce


*** Test Cases ***
Login with multiple users
    [Documentation]     This test logs in multiple users and checks for the title
    Open Browser        ${URL}      chrome
    ${user_count}=    Get Length    ${Usernames}
    FOR     ${index}        IN RANGE    0       ${user_count}
        ${username}=        Get From List       ${Usernames}    ${index}
        ${password}=        Get From List       ${Passwords}    ${index}
        Perform Login       ${username}     ${password}
        Wait Until Page Contains        Swag Labs       timeout=10
        Logout
    END
    Close Browser

*** Keywords ***
Perform Login
    [Arguments]     ${username}     ${password}
    Input Text      name=user-name  ${username}
    Input Text      name=password   ${password}
    Click Button    xpath://input[@name="login-button"]

Logout
    [Documentation]     Logs the user out of the application
    Click Element       xpath://div[@class="bm-burger-button"]
    Click Element       xpath://a[text()='Logout']