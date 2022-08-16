*** Settings ***
Library     Selenium2Library

*** Keywords ***
Open ${browser} browser and go to ${site_url}
    [Documentation]    Open browser and go to specific url on maximized window
    set selenium timeout	10 seconds
    open browser    ${site_url}    ${browser}
    maximize browser window

