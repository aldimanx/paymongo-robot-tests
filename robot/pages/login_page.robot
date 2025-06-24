*** Settings ***
Library    Browser
Resource    ../variables/config.robot
Resource    ../pages/general_page.robot

*** Variables ***
${EMAIL_INPUT}        xpath=//input[@name='email']
${PASSWORD_INPUT}     xpath=//input[@name='password']
      

*** Keywords ***
Open Login Page
    New Page    ${base_url_login}

Login With Credentials
    [Arguments]    ${email}    ${password}
    Fill Text   ${EMAIL_INPUT}    ${email}
    Fill Text   ${PASSWORD_INPUT}    ${password}
    Click Button With Exact Text    Log in

