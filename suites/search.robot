*** Settings ***
Resource        ../pageObjects/base.robot
Resource        ../pageObjects/homePageFlight/homePage.robot
Resource        ../pageObjects/signInFlight/signIn.robot
Resource        ../pageObjects/searchPageFlight/search.robot
Test Setup      Open Flight Application
Test Teardown   Close Flight Application


*** Variables ***
${VALID_USERNAME}           support@ngendigital.com
${VALID_PASSWORD}           abc123
${VALID_FLIGHT_NUMBER}      CADX2214
${INVALID_FLIGHT_NUMBER}    invalidnumber
${EMPTY_FLIGHT_NUMBER}
${ALERT_TEXT}               Please enter valid Flight Number

*** Keywords ***
Success Sign In
    Click Sign In Button On Homepage
    Input Username On Login Page            ${VALID_USERNAME}
    Input Password On Login Page            ${VALID_PASSWORD} 
    Click Sign In Button On Login Page

*** Test Cases ***
# Expected Success, Actual Failed (Bug)
Successfully Search For A Valid Flight Number
    Success Sign In
    Click Search Menu
    Input Flight Number On Search Page      ${VALID_FLIGHT_NUMBER}  
    Click Search Button On Search Page
    
Failed To Search For Invalid Flight Number
    Success Sign In
    Click Search Menu
    Input Flight Number On Search Page      ${INVALID_FLIGHT_NUMBER}
    Click Search Button On Search Page
    Wait Until Page Contains                ${ALERT_TEXT}         

Failed To Search With An Empty Flight Number
    Success Sign In
    Click Search Menu
    Input Flight Number On Search Page      ${EMPTY_FLIGHT_NUMBER}
    Click Search Button On Search Page
    Wait Until Page Contains                ${ALERT_TEXT}     