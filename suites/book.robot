*** Settings ***
Resource    ../pageObjects/base.robot
Resource    ../pageObjects/homePageFlight/homePage.robot
Resource    ../pageObjects/signInFlight/signIn.robot
Resource    ../pageObjects/bookPageFlight/book.robot

*** Variables ***
${VALID_USERNAME}       support@ngendigital.com
${VALID_PASSWORD}       abc123

*** Test Cases ***
Successful Book One Way Flight
    Open Flight Application
    Click Sign In Button On Homepage
    Input Username On Login Page            ${VALID_USERNAME}
    Input Password On Login Page            ${VALID_PASSWORD}
    Click Sign In Button On Login Page
    Click Book Menu After Login
    Click One Way Trip
    Select One in From City    New York
    Select One on To City    London
    Select Flight Class    Economy
    Select Book Type Flight
    Click Submit Flight

Successful Book One Way And Hotel
    Open Flight Application
    Click Sign In Button On Homepage
    Input Username On Login Page            ${VALID_USERNAME}
    Input Password On Login Page            ${VALID_PASSWORD}
    Click Sign In Button On Login Page
    Click Book Menu After Login
    Click One Way Trip
    Select One in From City    New York
    Select One on To City    London
    Select Flight Class    Economy
    Select Book Type Flight And Hotel
    Click Submit Flight

Failed Book One Way Without Select Book Type
    Open Flight Application
    Click Sign In Button On Homepage
    Input Username On Login Page            ${VALID_USERNAME}
    Input Password On Login Page            ${VALID_PASSWORD}
    Click Sign In Button On Login Page
    Click Book Menu After Login
    Click One Way Trip
    Select One in From City    New York
    Select One on To City    London
    Select Flight Class    Economy
    Click Submit Flight