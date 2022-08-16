*** Settings ***
Library     Selenium2Library

*** Variables ***
${INPUT_USERNAME}        id:user-name
${INPUT_PASSWORD}        id:password
${LOGIN_BUTTON}          id:login-button
${ERROR_MESSAGE}         //h3[@data-test="error"]

*** Keywords ***
Wait until login page successfuly loaded
    [Documentation]  Verify required elements are displayed in login page
    wait until element is visible    ${INPUT_USERNAME}
    wait until element is visible    ${INPUT_PASSWORD}
    wait until element is visible    ${LOGIN_BUTTON}

Fill login form and submit
    [Documentation]  Input values into login form and click on button Login
    [Arguments]   ${username}  ${password}  ${scenario}
    input text    ${INPUT_USERNAME}    ${username}
    input text    ${INPUT_PASSWORD}    ${password}
    click element   ${LOGIN_BUTTON}
    IF  "${scenario}" == "valid login"
        wait until inventory page successfully loaded
    ELSE IF  "${scenario}" == "invalid login"
        element text should be  ${ERROR_MESSAGE}  Epic sadface: Username and password do not match any user in this service
    ELSE IF  "${scenario}" == "locked out"
        element text should be  ${ERROR_MESSAGE}  Epic sadface: Sorry, this user has been locked out.
    ELSE
        Fail  unknown login scenario: ${scenario}
    END
