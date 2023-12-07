*** Settings ***
Resource        ../base.robot
Variables       search-locators.yaml

*** Keywords ***
Click Search Menu
    Wait Until Element Is Visible    ${search-menu}
    Click Element    ${search-menu}

Input Flight Number On Search Page
    [Arguments]      ${flight-number}
    Wait Until Element Is Visible   ${flight-number-input}
    Input Text       ${flight-number-input}   ${flight-number}

Click Search Button On Search Page
    Click Element   ${search-flight-button}