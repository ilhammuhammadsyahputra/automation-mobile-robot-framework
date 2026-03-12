*** Settings ***
Documentation    All variables, locators, and messages used across the test suite.

*** Variables ***
# --- Appium Server ---
${REMOTE_URL}           http://localhost:4723

# --- Device ---
${PLATFORM_NAME}        Android
${DEVICE_NAME}          emulator-5554
${AUTOMATION_NAME}      UiAutomator2

# --- Application ---
${APP_PACKAGE}          id.paper.invoicer
${APP_ACTIVITY}         id.paper.invoicer.MainActivity

# --- Test Credentials ---
${VALID_EMAIL}          imsyahputra53@gmail.com
${VALID_PASSWORD}       Ilham@1177
${INVALID_PASSWORD}     WrongPassword999

# --- Timeouts ---
${SHORT_WAIT}           10s
${MEDIUM_WAIT}          20s

# --- Locators ---
# This app is built with Flutter, so input fields have no resource-id.
# Elements are located by class name or accessibility label (confirmed via Appium Inspector).
${LOC_EDIT_TEXT}        xpath=//android.widget.EditText
${LOC_MASUK_BTN}        accessibility_id=Masuk
${LOC_PASSWORD_MODAL}   accessibility_id=Masukkan Kata Sandi

# --- Verification Messages ---
# These are the exact text strings shown by the app, used to verify test results.
${MSG_WRONG_CRED}       Kombinasi email atau no. handphone dengan kata sandi salah.
${MSG_DEVICE_NEW}       Masuk Dengan Device Baru
