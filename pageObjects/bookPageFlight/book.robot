*** Settings ***
Resource        ../base.robot
Variables       book-locators.yaml


*** Keywords ***
Click Book Menu After Login
    Wait Until Element Is Visible    ${book-menu-button}
    Click Element    ${book-menu-button}

Click One Way Trip
    Wait Until Element Is Visible    ${one-way-button}
    Click Element    ${one-way-button}

Click Round Trip
    Wait Until Element Is Visible  ${round-trip-button}
    Click Element    ${round-trip-button}
    
Select From City
    Click Element    ${from-city-dropdown}
    Wait Until Element Is Visible    ${view-list-form}

Select New York
    Wait Until Element Is Visible    ${val-newyork}
    Click Element    ${val-newyork}

Select Chicago
    Wait Until Element Is Visible    ${val-chicago}
    Click Element    ${val-chicago}

Select Toronto
    Wait Until Element Is Visible    ${val-toronto}
    Click Element    ${val-toronto}

Select To City
    Click Element    ${to-city-dropdown}
    Wait Until Element Is Visible    ${view-list-form}
    
Select London
    Wait Until Element Is Visible    ${val-london}
    Click Element    ${val-london}

Select Paris
    Wait Until Element Is Visible    ${val-paris}
    Click Element    ${val-paris}

Select Ottawa
    Wait Until Element Is Visible    ${val-ottawa}
    Click Element    ${val-ottawa}

Select Flight Class
    Click Element    ${class-dropdown}
    Wait Until Element Is Visible    ${view-list-form}

Select Economy
    Wait Until Element Is Visible    ${val-economy}
    Click Element    ${val-economy}

Select Business
    Wait Until Element Is Visible    ${val-business}
    Click Element    ${val-business}

Select First
    Wait Until Element Is Visible    ${val-first}
    Click Element    ${val-first}

Select Start Date
    Click Element    ${start-date}
    Wait Until Element Is Visible       ${month-view-date}
    Wait Until Element Is Visible       ${button-ok-date}
    Click Element    ${text-start-date}
    Click Element    ${button-ok-date}

Select End Date
    Click Element    ${end-date}
    Wait Until Element Is Visible   ${month-view-date}
    Wait Until Element Is Visible    ${button-ok-date}
    Click Element    ${text-end-date}
    Click Element    ${button-ok-date}

Select Book Type Flight
    Click Element    ${flight-radio-button}

Select Book Type Flight And Hotel
    Click Element    ${flight-hotel-radio-button}

Select Book Type Plus Min 1 Day
    Click Element    ${day-checkbox}

Click Submit Flight
    Click Element    ${book-button-flight}

Select Flight Price
    Wait Until Element Is Visible    ${price-second}
    Click Element    ${price-second}

Click Confirm Order Booking Flight
    Wait Until Element Is Visible    ${button-confirm-order}
    Click Element    ${button-confirm-order}

Show Message Success Booking
    Wait Until Page Contains Element    ${should-message-booking}