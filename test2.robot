*** settings ***
Library    SeleniumLibrary

*** variables ***
${URL}    https://www.saucedemo.com/
${USERNAME}    standard_user
${PASSWORD}    secret_sauce

*** test cases ***
Login test case
    [Template]      Login Test Case
    ${USERNAME}     ${PASSWORD}

*** keywords ***
Login Test Case
    [Arguments]     ${username}     ${password}
    Open Browser    ${URL}      chrome
    Input Text      