*** Settings ***
Resource        ../base.robot
Variables       home-locators.yaml

*** Keywords ***
Click Sign In Button On Homepage
    Click Element       ${login-button}