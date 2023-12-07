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
${EMPTY_FLIGHT_NUMBER}      
${ALERT_TEXT}               Please enter valid Flight Number

*** Keywords ***
Success Sign In
    Click Sign In Button On Homepage
    Input Username On Login Page            ${VALID_USERNAME}
    Input Password On Login Page            ${VALID_PASSWORD} 
    Click Sign In Button On Login Page
    
Steps To Search For A Flight Number In The Search Feature
    [Arguments]    ${flight_number}
    Click Search Menu
    Input Flight Number On Search Page      ${flight_number}  
    Click Search Button On Search Page
    IF   '${flight_number}' != 'CADX2214'
        Wait Until Page Contains                ${ALERT_TEXT}   
    END

*** Test Cases ***
# Expected Success, Actual Failed (Bug)
Successfully Search For A Valid Flight Number
    Success Sign In
    Steps To Search For A Flight Number In The Search Feature    CADX2214
    
Failed To Search For Invalid Flight Number
    Success Sign In
    Steps To Search For A Flight Number In The Search Feature    invalidnumber  

Failed To Search With An Empty Flight Number
    Success Sign In
    Steps To Search For A Flight Number In The Search Feature    ${EMPTY_FLIGHT_NUMBER}