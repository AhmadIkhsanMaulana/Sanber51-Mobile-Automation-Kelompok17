*** Settings ***
Resource        ../base.robot
Variables       signIn-locators.yaml

*** Keywords ***
Input Username On Login Page
    [Arguments]                     ${username}
    Wait Until Element Is Visible   ${username-input}
    Input Text                      ${username-input}   ${username}

Input Password On Login Page
    [Arguments]                     ${password}
    Wait Until Element Is Visible   ${password-input} 
    Input Text                      ${password-input}   ${password}

Click Sign In Button On Login Page
    Click Element                   ${sign-in-button}