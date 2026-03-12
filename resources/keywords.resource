*** Settings ***
Documentation    Keywords for the Paper.id login test suite.
Library          AppiumLibrary
Resource         variables.resource

*** Keywords ***

Open Paper App
    [Documentation]    Opens the Paper.id app via Appium.
    ...                noReset=False ensures app data is reset before each test for a clean state.
    Open Application
    ...    ${REMOTE_URL}
    ...    platformName=${PLATFORM_NAME}
    ...    deviceName=${DEVICE_NAME}
    ...    appPackage=${APP_PACKAGE}
    ...    appActivity=${APP_ACTIVITY}
    ...    automationName=${AUTOMATION_NAME}
    ...    noReset=${False}

Close Paper App
    [Documentation]    Closes the app and ends the Appium session.
    Close Application

User Is On The Login Screen
    [Documentation]    Navigates to the login screen from the initial app launch.
    ...                If the onboarding screen is shown, taps "Masuk" to reach the login screen.
    ${is_on_login}=    Run Keyword And Return Status
    ...    Wait Until Element Is Visible    ${LOC_EDIT_TEXT}    ${MEDIUM_WAIT}
    IF    not ${is_on_login}
        Click Element    ${LOC_MASUK_BTN}
    END
    Wait Until Element Is Visible    ${LOC_EDIT_TEXT}    ${MEDIUM_WAIT}

Type Into Field
    [Documentation]    Helper keyword: taps a field and types the given text.
    ...                Click is retried up to 3 times to handle Flutter stale element errors.
    [Arguments]    ${locator}    ${text}
    Wait Until Keyword Succeeds    3x    2s    Click Element    ${locator}
    Sleep    1s
    Input Text    ${locator}    ${text}
    Hide Keyboard
    Sleep    1s

User Enters Email
    [Documentation]    Taps the email field and types the given email.
    [Arguments]    ${email}
    Type Into Field    ${LOC_EDIT_TEXT}    ${email}

User Taps The Sign In Button
    [Documentation]    Taps "Masuk" to submit the email, then waits for the password modal.
    Click Element    ${LOC_MASUK_BTN}
    Wait Until Element Is Visible    ${LOC_PASSWORD_MODAL}    ${MEDIUM_WAIT}

User Enters Password
    [Documentation]    Taps the password field and types the given password.
    [Arguments]    ${password}
    Type Into Field    ${LOC_EDIT_TEXT}    ${password}

User Submits Login
    [Documentation]    Taps "Masuk" in the password modal to submit the login request.
    Click Element    ${LOC_MASUK_BTN}
    Wait Until Page Does Not Contain Element    ${LOC_PASSWORD_MODAL}    ${MEDIUM_WAIT}

Login Should Be Successful
    [Documentation]    Checks that login succeeded by waiting for the device verification screen.
    Wait Until Page Contains    ${MSG_DEVICE_NEW}    ${MEDIUM_WAIT}

Login Should Fail With Wrong Password Message
    [Documentation]    Checks that an error message appears when the password is wrong.
    Wait Until Page Contains    ${MSG_WRONG_CRED}    ${SHORT_WAIT}
