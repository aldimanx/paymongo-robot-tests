*** Settings ***
Resource    ../variables/config.robot
Resource    ../pages/login_page.robot



*** Test Cases ***
As unverified user Login Successfully
    New Browser    headless=False
    Open Login Page
    Login With Credentials    noverio_rio@yahoo.com    Testing123@!
    Validate Text Exist     Verify Your Identity
    Close Browser

As verified user Login Successfully
    New Browser    headless=False
    Open Login Page
    Login With Credentials    aldynoverio@gmail.com    Tk3DjZLfhVHLuCG!
    Validate Text Exist     Verify Your Identity
    Close Browser

#verified issues with email 3rd party login