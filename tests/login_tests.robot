*** Settings ***
Documentation       Login test suite for Paper.id Android app.
...                 Covers successful login and failed login with wrong password.

Resource            ../resources/keywords.resource

Suite Setup         Log    Login Test Suite started
Suite Teardown      Log    Login Test Suite finished

*** Test Cases ***

TC_LOGIN_001 - Successful Login With Valid Credentials
    [Documentation]    POSITIVE: User logs in with a valid email and password.
    ...                Expected: "Sign In With New Device" screen appears.
    [Tags]             login    positive    smoke
    [Setup]            Open Paper App
    Given User Is On The Login Screen
    When User Enters Email    ${VALID_EMAIL}
    And User Taps The Sign In Button
    And User Enters Password    ${VALID_PASSWORD}
    And User Submits Login
    Then Login Should Be Successful
    [Teardown]         Close Paper App

TC_LOGIN_002 - Failed Login With Wrong Password
    [Documentation]    NEGATIVE: User logs in with a valid email but wrong password.
    ...                Expected: An error message appears inside the password modal.
    [Tags]             login    negative
    [Setup]            Open Paper App
    Given User Is On The Login Screen
    When User Enters Email    ${VALID_EMAIL}
    And User Taps The Sign In Button
    And User Enters Password    ${INVALID_PASSWORD}
    And User Submits Login
    Then Login Should Fail With Wrong Password Message
    [Teardown]         Close Paper App
