*** Settings ***
Library    Browser
Resource    ../variables/config.robot


*** Variables ***
${BUSINESS_INPUT}    id=businessName
${FIRST_NAME_INPUT}  id=firstName
${LAST_NAME_INPUT}   id=lastName
${EMAIL_INPUT}       id=email
${PASSWORD_INPUT}    id=password
${LOGIN_BUTTON}      text=Log In
${DASHBOARD_TEXT}    text=Dashboard
${MOBILE_NUMBER_INPUT}  id=contactNumber
${EMAIL_INPUT}  id=email
${PASSWORD_INPUT}  id=password
${REVENUE_SELECT}  xpath=//div[@class="select sign-up-form__select-estimated-monthly-volume"]
${INTENDED_USE_SELECT}  xpath=//div[@class="select sign-up-form__select-business-intended-product"]
${TNC_SELECT}  id=acceptedTerms


*** Keywords ***
Open Signup Page
    New Page    ${base_url_signup}

Input Business Name
    [Arguments]    ${business_name}
    Fill Text    ${BUSINESS_INPUT}    ${business_name}

Input Full Name
    [Arguments]    ${first_name}    ${last_name}
    Fill Text    ${FIRST_NAME_INPUT}    ${first_name}
    Fill Text    ${LAST_NAME_INPUT}    ${last_name}

Input Mobile Number
    [Arguments]    ${mobile_number}
    Fill Text    ${MOBILE_NUMBER_INPUT}    ${mobile_number}

Enter Email
    [Arguments]    ${email}
    Fill Text    ${EMAIL_INPUT}    ${email}

Enter Password
    [Arguments]    ${password}
    Fill Text    ${PASSWORD_INPUT}    ${password}

Select Business Average Revenue
    [Arguments]    ${revenue}
    Click    ${REVENUE_SELECT}
    Click    xpath=//div[contains(@class, 'select-option__content') and text()='${revenue}']


Select Intended Use Paymongo
    [Arguments]    ${intended_use}
    Click    ${INTENDED_USE_SELECT} 
    Click    xpath=//div[contains(@class, 'select-option__content') and text()='${intended_use}']


Accept Terms and Conditions
    Check Checkbox    ${TNC_SELECT}

Choose Validation Method
    Validate Text Exist    Choose where we'll send the one-time password (OTP) to verify your account.
    [Arguments]    ${validation_method}
    IF    '${validation_method}' == 'Mobile Number'
        Click Button With Exact Text    Mobile Number
        Click Button With Exact Text    Proceed        
        Validate Text Exist      Not your mobile number?
    ELSE IF    '${validation_method}' == 'Email'
        Click Button With Exact Text    Email
        Click Button With Exact Text    Proceed        
        Validate Text Exist      Not your email address?
    END

Login With Credentials
    [Arguments]    ${email}    ${password}
    Enter Email    ${email}
    Enter Password    ${password}
    Click Login Button