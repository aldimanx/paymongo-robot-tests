# 🚀 PayMongo Robot Tests

Automated end-to-end UI test suite for **PayMongo** built with Robot Framework and Playwright using the `robotframework-browser` library.

This project covers key regression flows:

- ❌  Sign Up (`/signup`) until SOA (Statement of Account) page  stuck with verification, dummy email cant receive otp
- ❌  Log In (`/login`)  kept asking for verification OTP
- ❌ Account Activation Steps (1–5) need a lot to configured especially take photo and documentation

---

## ✅ Prerequisites

- Python 3.8+
- Node.js v14 or higher (required by Playwright)
- pip (Python package manager)
- Git
- Recommended: Virtual environment (venv or conda)

---

## 🛠️ Installation

### 1. Clone the Project

```bash
git clone [https://github.com/your-org/paymongo-robot-tests.git](https://github.com/aldimanx/paymongo-robot-tests.git)
cd paymongo-robot-tests
```

### 2. Create Virtual Environment (Optional but Recommended)

```bash
python -m venv venv
source venv/bin/activate      # On Windows: venv\Scripts\activate
```

### 3. Install Python Dependencies

```bash
pip install -r requirements.txt
```

### 4. Install Playwright and Its Browsers

```bash
rfbrowser init
```

---

## ⚙️ Configuration

All URLs and global variables are defined in `variables/config.robot`:

```robot
*** Variables ***
${base_url_login}     https://dashboard.paymongo-uat.com/login
${base_url_signup}    https://dashboard.paymongo-uat.com/signup
```

You can override these values via CLI:

```bash
robot --variable base_url_login:https://custom-env.com/login tests/
```

---

## 🚦 Running Tests

### Run All Tests

```bash
robot tests/
```

### Run a Specific Test File

```bash
robot robot/tests_suites/login.robot
```

### Run with Output to a Folder

```bash
robot --outputdir results tests/
```

---

## 🌐 Run in UI Mode (Non-Headless)

To run browser visibly:

In your test:
```robot
New Browser    headless=False
```

Or via CLI:

```bash
robot --variable HEADLESS:False tests/
```

---

## 🧠 Using Faker Data

Using FakerLibrary for dynamic test data:

```robot
Library    FakerLibrary

${email}=    FakerLibrary.Email
${name}=     FakerLibrary.Name
${company}=  FakerLibrary.Company
```

---

## 🧰 Toolchain Summary

| Tool               | Purpose                        |
|--------------------|--------------------------------|
| Robot Framework    | Test automation framework      |
| Browser library    | Playwright integration         |
| FakerLibrary       | Fake user/test data            |
| rfbrowser          | CLI for Playwright setup       |

---

