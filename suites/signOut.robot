*** Settings ***
Resource        ../pageObjects/base.robot
Resource        ../pageObjects/homePageFlight/homePage.robot
Resource        ../pageObjects/signInFlight/signIn.robot
Resource        ../pageObjects/signOutFlight/signOut.robot
Suite Setup      Open Flight Application
Suite Teardown   Close Flight Application

*** Variables ***
${VALID_USERNAME}           support@ngendigital.com
${VALID_PASSWORD}           abc123

*** Keywords ***
Success Sign In
    Click Sign In Button On Homepage
    Input Username On Login Page            ${VALID_USERNAME}
    Input Password On Login Page            ${VALID_PASSWORD} 
    Click Sign In Button On Login Page

*** Test Cases ***
# Expected Success Back to Sign In Page, Actual Failed (Bug)
Successfuly Signed Out From Flight Page
    Success Sign In
    Click Sign Out Button 
    Wait Until Page Contains    Sign In    