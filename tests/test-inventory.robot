*** Settings ***
Documentation       Sauce Demo Inventory Feature Automation Scenarios

Library             ../utils/util.py

Resource            ../utils/common.resource
Resource            ../page-objects/page-inventory.resource
Resource            ../page-objects/page-login.resource

Test Setup          Open chrome browser and go to https://www.saucedemo.com/
Test Teardown       Close All Browsers

*** Test Cases ***
Sort products by prices ASC
    [Documentation]    This test case verifies sort functionality by prices low to high
    Wait until login page successfuly loaded
    Fill login form and submit  standard_user  secret_sauce  valid login
    Sort products by lohi

Sort products by prices DESC
    [Documentation]    This test case verifies sort functionality by prices high to low
    Wait until login page successfuly loaded
    Fill login form and submit  standard_user  secret_sauce  valid login
    Sort products by hilo
