*** Settings ***
Resource            ../pageObjects/homePageFlight/homePage.robot
Resource            ../pageObjects/signInFlight/signIn.robot 
Test Setup          Open Flight Application
Test Teardown       Close Flight Application   

*** Variables ***
${VALID_USERNAME}       support@ngendigital.com
${VALID_PASSWORD}       abc123
${INVALID_USERNAME}     invalidusername
${INVALID_PASSWORD}     invalidpassword
${EMPTY_USERNAME}
${EMPTY_PASSWORD}
${ALERT_TEXT}           Invalid username/password

*** Test Cases ***
Successful Login Using a Valid Username and Password
    Click Sign In Button On Homepage
    Input Username On Login Page            ${VALID_USERNAME}
    Input Password On Login Page            ${VALID_PASSWORD} 
    Click Sign In Button On Login Page
    
Failed Login Using an Invalid Username and Password
    Click Sign In Button On Homepage
    Input Username On Login Page            ${INVALID_USERNAME}
    Input Password On Login Page            ${INVALID_PASSWORD} 
    Click Sign In Button On Login Page
    Wait Until Page Contains                ${ALERT_TEXT}

Failed Login Using a Valid Username and Invalid Password
    Click Sign In Button On Homepage
    Input Username On Login Page            ${VALID_USERNAME}
    Input Password On Login Page            ${INVALID_PASSWORD} 
    Click Sign In Button On Login Page
    Wait Until Page Contains                ${ALERT_TEXT}

Failed Login Using an Invalid Username and Valid Password
    Click Sign In Button On Homepage
    Input Username On Login Page            ${INVALID_USERNAME}
    Input Password On Login Page            ${VALID_PASSWORD} 
    Click Sign In Button On Login Page
    Wait Until Page Contains                ${ALERT_TEXT}

Failed Login with Both Empty Username and Password
    Click Sign In Button On Homepage
    Input Username On Login Page            ${EMPTY_USERNAME}
    Input Password On Login Page            ${EMPTY_PASSWORD}
    Click Sign In Button On Login Page
    Wait Until Page Contains                ${ALERT_TEXT}

Failed Login Using Blank Username and Valid Password
    Click Sign In Button On Homepage
    Input Password On Login Page            ${VALID_PASSWORD}
    Click Sign In Button On Login Page
    Wait Until Page Contains                ${ALERT_TEXT}

Failed Login Using Valid Username and Blank Password
    Click Sign In Button On Homepage
    Input Username On Login Page            ${VALID_USERNAME}
    Click Sign In Button On Login Page
    Wait Until Page Contains                ${ALERT_TEXT}
