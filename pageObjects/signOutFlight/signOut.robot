*** Settings ***
Resource        ../base.robot
Variables       signOut-locators.yaml

*** Keywords ***
Click Sign Out Button
    Click Element   ${sign-out-button}