*** Settings ***
Resource        ../pageObjects/base.robot
Resource        ../pageObjects/homePageFlight/homePage.robot
Resource        ../pageObjects/signInFlight/signIn.robot
Resource        ../pageObjects/bookPageFlight/book.robot
Test Setup      Open Flight Application
Test Teardown   Close Flight Application


*** Variables ***
${VALID_USERNAME}       support@ngendigital.com
${VALID_PASSWORD}       abc123
   
*** Keywords ***
Common Form Booking One Way Trip Steps
    [Arguments]      ${check_date}    ${book_type}
    Click Sign In Button On Homepage
    Input Username On Login Page            ${VALID_USERNAME}
    Input Password On Login Page            ${VALID_PASSWORD}
    Click Sign In Button On Login Page
    Click Book Menu After Login
    Click One Way Trip
    Select From City
    Select New York
    Select To City
    Select London
    Select Flight Class
    Select Economy
    # Conditional for argument $check_date}
    IF   '${check_date}' == 'startend'
        Select Start Date
        Select End Date  
    ELSE IF    '${check_date}' == 'start'
        Select Start Date
    ELSE IF    '${check_date}' == 'end'
        Select End Date
    ELSE
        Log    check_date is not valid
    END
    # Conditional for argument ${book_type}
    IF   '${book_type}' == 'flight'
        Select Book Type Flight
    ELSE IF    '${book_type}' == 'flight and hotel'
        Select Book Type Flight And Hotel
    ELSE IF    '${book_type}' == 'plusminday'
        Select Book Type Plus Min 1 Day
    ELSE
        Log    book_type not found
    END
    Click Submit Flight
    Select Flight Price
    Click Confirm Order Booking Flight
    Show Message Success Booking
Common Form Booking Round Trip Steps
    [Arguments]      ${check_date}    ${book_type}
    Click Sign In Button On Homepage
    Input Username On Login Page            ${VALID_USERNAME}
    Input Password On Login Page            ${VALID_PASSWORD}
    Click Sign In Button On Login Page
    Click Book Menu After Login
    Click Round Trip
    Select From City
    Select Toronto
    Select To City
    Select Ottawa
    Select Flight Class
    Select Business
    # Conditional for argument $check_date}
    IF   '${check_date}' == 'startend'
        Select Start Date
        Select End Date  
    ELSE IF    '${check_date}' == 'start'
        Select Start Date
    ELSE IF    '${check_date}' == 'end'
        Select End Date
    ELSE
        Log    check_date is not valid
    END
    # Conditional for argument ${book_type}
    IF   '${book_type}' == 'flight'
        Select Book Type Flight
    ELSE IF    '${book_type}' == 'flight and hotel'
        Select Book Type Flight And Hotel
    ELSE IF    '${book_type}' == 'plusminday'
        Select Book Type Plus Min 1 Day
    ELSE
        Log    book_type not found
    END
    Click Submit Flight
    Select Flight Price
    Click Confirm Order Booking Flight
    Show Message Success Booking    

Common Form Booking With Price Steps
    [Arguments]      ${check_date}    ${book_type}    ${check_price}
    Click Sign In Button On Homepage
    Input Username On Login Page            ${VALID_USERNAME}
    Input Password On Login Page            ${VALID_PASSWORD}
    Click Sign In Button On Login Page
    Click Book Menu After Login
    Click Round Trip
    Select From City
    Select Toronto
    Select To City
    Select Ottawa
    Select Flight Class
    Select Business
    # Conditional for argument $check_date}
    IF   '${check_date}' == 'startend'
        Select Start Date
        Select End Date  
    ELSE IF    '${check_date}' == 'start'
        Select Start Date
    ELSE IF    '${check_date}' == 'end'
        Select End Date
    ELSE
        Log    check_date is not valid
    END
    # Conditional for argument ${book_type}
    IF   '${book_type}' == 'flight'
        Select Book Type Flight
    ELSE IF    '${book_type}' == 'flight and hotel'
        Select Book Type Flight And Hotel
    ELSE IF    '${book_type}' == 'plusminday'
        Select Book Type Plus Min 1 Day
    ELSE
        Log    book_type not found
    END
    Click Submit Flight
    IF   '${check_price}' == 'yes'
       Select Flight Price 
    END
    Click Confirm Order Booking Flight
    Show Message Success Booking

*** Test Cases ***
Successful Book One Way Flight And Hotel
    Common Form Booking One Way Trip Steps    startend    flight and hotel

# Expected Failed, Actual Success (Bug)
Failed Book One Way Without Select Book Type
    Common Form Booking One Way Trip Steps   startend    " "

# Expected Failed, Actual Success (Bug)
Failed to Book One Way Without Selecting Start Date and End Date
    Common Form Booking One Way Trip Steps   " "    flight

# Expected Failed, Actual Success (Bug)
Failed to Book One Way Without Selecting Start Date
    Common Form Booking One Way Trip Steps   end   flight and hotel

Failed to Book One Way Without Selecting End Date
    Common Form Booking One Way Trip Steps   start   flight

Successful Book Round Trip Flight
    Common Form Booking Round Trip Steps   startend    flight

Successful Book Round Trip Flight And Hotel
    Common Form Booking Round Trip Steps   startend    flight and hotel

# Expected Failed, Actual Success (Bug)
Failed Book Round Trip Flight Flight and Hotel +/-1Day
    Common Form Booking Round Trip Steps    startend    " "

# Expected Failed, Actual Success (Bug)
Failed Book Round Trip Without Selecting Start Date and End Date
    Common Form Booking One Way Trip Steps   " "   flight

# Expected Failed, Actual Success (Bug)
Failed Book Round Trip Without Selecting Start Date
    Common Form Booking One Way Trip Steps    end    Flight and hotel
    
# Expected Failed, Actual Success (Bug)
Failed to Book a Round Trip Without Selecting End Date
    Common Form Booking Round Trip Steps    start    flight
Successful Confirm Booking with Select Price
    Common Form Booking With Price Steps    startend    flight    yes

# Expected Failed, Actual Success (Bug)
Failed Confirm Booking Without Select Price
    Common Form Booking With Price Steps    startend    plusminday    no