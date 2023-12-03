*** Settings ***
Resource            ../pageObjects/homePageFlight/homePage.robot
Resource            ../pageObjects/signInFlight/signIn.robot 

*** Variables ***
${VALID_USERNAME}       support@ngendigital.com
${VALID_PASSWORD}       abc123
${INVALID_USERNAME}     invalidusername
${INVALID_PASSWORD}     invalidpassword

*** Test Cases ***
Successful Login Using a Valid Username and Password
    Open Flight Application
    Click Sign In Button On Homepage
    Input Username On Login Page            ${VALID_USERNAME}
    Input Password On Login Page            ${VALID_PASSWORD} 
    Click Sign In Button On Login Page
    Close Flight Application


Failed Login Using an Invalid Username and Password
    Open Flight Application
    Click Sign In Button On Homepage
    Input Username On Login Page            ${INVALID_USERNAME}
    Input Password On Login Page            ${INVALID_PASSWORD} 
    Click Sign In Button On Login Page
    Close Flight Application

Failed Login Using a Valid Username and Invalid Password
    Open Flight Application
    Click Sign In Button On Homepage
    Input Username On Login Page            ${VALID_USERNAME}
    Input Password On Login Page            ${INVALID_PASSWORD} 
    Click Sign In Button On Login Page
    Close Flight Application

Failed Login Using an Invalid Username and Valid Password
    Open Flight Application
    Click Sign In Button On Homepage
    Input Username On Login Page            ${INVALID_USERNAME}
    Input Password On Login Page            ${VALID_PASSWORD} 
    Click Sign In Button On Login Page
    Close Flight Application

Failed Login Using Blank Username and Valid Password
    Open Flight Application
    Click Sign In Button On Homepage
    Input Password On Login Page    ${VALID_PASSWORD}
    Click Sign In Button On Login Page
    Close Flight Application

Failed Login Using Valid Username and Blank Password
    Open Flight Application
    Click Sign In Button On Homepage
    Input Username On Login Page    ${VALID_USERNAME}
    Click Sign In Button On Login Page
    Close Flight Application