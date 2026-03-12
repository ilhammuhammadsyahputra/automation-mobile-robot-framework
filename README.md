# Automation Mobile - Robot Framework

Test automation project to validate the **Login** feature on the **Paper.id** mobile application using Robot Framework and Appium.

---

## Project Structure

```
automation-mobile-robot-framework/
├── tests/
│   └── login_tests.robot       # Test cases (positive & negative)
├── resources/
│   ├── keywords.resource       # Keyword/step definitions
│   └── variables.resource      # Variables, locators, and configuration
├── results_run/                # Test output (auto-generated)
├── requirements.txt            # Python dependencies
└── .gitignore
```

### File Descriptions

| File | Description |
|------|-------------|
| `tests/login_tests.robot` | Contains test cases: `TC_LOGIN_001` (positive) and `TC_LOGIN_002` (negative). Defines **what** to test. |
| `resources/keywords.resource` | Contains keyword implementations such as `Open Paper App`, `User Enters Email`, `User Submits Login`, `Login Should Be Successful`, etc. Defines **how** each automation step is executed. |
| `resources/variables.resource` | Contains all variables: Appium configuration, test credentials, element locators, and expected messages. |
| `requirements.txt` | List of Python libraries required by this project. |
| `results/` | Robot Framework output folder (`log.html`, `report.html`, `output.xml`). Auto-generated when tests are run. |

---

## Prerequisites

Make sure all the following tools are installed before running the tests.

### 1. Python
```bash
python3 --version  # minimum Python 3.8
```

### 2. Appium Server
```bash
npm install -g appium
appium --version
```

### 3. Appium UiAutomator2 Driver
```bash
appium driver install uiautomator2
appium driver list --installed
```

### 4. Android SDK & ADB
Make sure `adb` is accessible from the terminal and the emulator/device is detected:
```bash
adb devices
```

### 5. Paper.id Application
Make sure the **Paper.id** app (`id.paper.invoicer`) is already installed on the emulator/device:
```bash
adb shell pm list packages | grep paper
```

---

## Setup

### 1. Clone Repository
```bash
git clone https://github.com/ilhammuhammadsyahputra/automation-mobile-robot-framework.git
cd automation-mobile-robot-framework
```

### 2. Create Virtual Environment
```bash
python3 -m venv venv
source venv/bin/activate        # macOS / Linux
# venv\Scripts\activate         # Windows
```

### 3. Install Dependencies
```bash
pip install -r requirements.txt
```

---

## Running the Tests

### 1. Start Appium Server
Open a new terminal and run:
```bash
appium
```

### 2. Make Sure Emulator/Device is Running
```bash
adb devices
# Expected output:
# emulator-5554   device
```

### 3. Activate Virtual Environment
```bash
source venv/bin/activate
```

### 4. Run All Tests
```bash
robot --outputdir results_run tests/login_tests.robot
```

### 5. Run Tests by Tag
```bash
# Positive test only
robot --outputdir results_run -i positive tests/login_tests.robot

# Negative test only
robot --outputdir results_run -i negative tests/login_tests.robot

# Smoke test only
robot --outputdir results_run -i smoke tests/login_tests.robot
```

---

## Viewing Test Results

After the tests finish, open the following file in a browser:
```bash
open results_run/report.html    # macOS
# start results_run/report.html # Windows
```

| File | Description |
|------|-------------|
| `results_run/report.html` | Summary of test results (PASS/FAIL) |
| `results_run/log.html` | Detailed execution steps for each test case |
| `results_run/output.xml` | Raw output in XML format |

---

## Test Cases

| ID | Name | Type | Description |
|----|------|------|-------------|
| TC_LOGIN_001 | Login Successfully With Valid Credentials | Positive | Verifies that a user can log in with a registered email and password |
| TC_LOGIN_002 | Login Failed With Wrong Password | Negative | Verifies that the system displays an error message when the wrong password is entered |

---

## Tech Stack

| Tools | Version |
|-------|---------|
| Robot Framework | 7.4.2 |
| robotframework-appiumlibrary | 3.2.1 |
| Appium Server | 3.2.2 |
| Appium UiAutomator2 Driver | 7.0.0 |
| Platform | Android |
| Application | Paper.id (`id.paper.invoicer`) |
