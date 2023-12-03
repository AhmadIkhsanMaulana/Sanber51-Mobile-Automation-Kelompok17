*** Settings ***
Resource        ../base.robot
Variables       book-locators.yaml

*** Keywords ***
Click Book Menu After Login
    Click Element           ${book-menu-button}

Click One Way Trip          
    Click Element           ${one-way-button}

Select One in From City        
    [Arguments]             ${from-city}
    Click Element           ${from-city-dropdown}
    Select From List        ${from-city-dropdown}   ${from-city}

Select One on To City
    [Arguments]             ${from-city}
    Click Element           ${to-city-dropdown}
    Select From List        ${to-city-dropdown}     ${from-city}

Select Flight Class
    [Arguments]             ${class}
    Click Element           ${class-dropdown}
    Select From List        ${class-dropdown}       ${class}
