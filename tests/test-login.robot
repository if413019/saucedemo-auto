*** Settings ***
Documentation       Sauce Demo Login Feature Automation Scenarios

Resource            ../utils/common.resource
Resource            ../page-objects/page-login.resource
Resource            ../page-objects/page-inventory.resource

Test Setup          Open chrome browser and go to https://www.saucedemo.com/
Test Teardown       Close All Browsers

*** Test Cases ***
Success login to saucedemo app
    [Documentation]    This test case verifies failed login due to invalid username/password
    Wait until login page successfuly loaded
    Fill login form and submit  standard_user  secret_sauce  valid login

Failed login to saucedemo app due to invalid username/password
    [Documentation]    This test case verifies failed login due to invalid username/password
    Wait until login page successfuly loaded
    Fill login form and submit  invalid_user  secret_sauce  invalid login

Failed login to saucedemo app due to locked out user account
    [Documentation]    This test case verifies failed login due to locked out user account
    Wait until login page successfuly loaded
    Fill login form and submit  locked_out_user  secret_sauce  locked out
