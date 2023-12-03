*** Settings ***
Resource            ../pageObjects/signInFlight/signIn.robot
Resource            ../pageObjects/base.robot

Test Setup          Open Flight Application
Test Teardown       Close Flight Application


*** Variables ***
${VALID_USERNAME}        support@ngendigital.com
${VALID_PASSWORD}        abc123
${INVALID_USERNAME}      invalid
${INVALID_PASSWORD}      invalid

*** Test Cases ***
# Fail Login Blank Username Input Password