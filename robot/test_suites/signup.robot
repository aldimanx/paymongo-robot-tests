*** Settings ***
resource    ../pages/signup_page.robot
resource    ../pages/general_page.robot
Library    FakerLibrary


*** Test Cases ***

User Can Signup with verify Email
    ${business_name}=    FakerLibrary.Company
    ${first_name} =    FakerLibrary.First Name
    ${last_name} =    FakerLibrary.Last Name
    ${mobile_number}=    FakerLibrary.Random Number     digits=10

    New Browser    headless=False
    Open Signup Page
    Input Business Name    ${business_name}
    Input Full Name    ${first_name}    ${last_name}  
    Input Mobile Number    ${mobile_number}
    Enter Email    ${first_name.lower()}@example.com
    Enter Password    Testing123@!
    Select Business Average Revenue    Between ₱100,000 and ₱300,000
    Select Intended Use Paymongo    I plan to start a business soon
    Accept Terms and Conditions
    Set Browser Timeout    90s
    Click Button With Exact Text    Sign up
    Choose Validation Method    Email
    Close Browser



User Can Signup with verify mobile number
    ${business_name}=    FakerLibrary.Company
    ${first_name} =    FakerLibrary.First Name
    ${last_name} =    FakerLibrary.Last Name
    ${mobile_number}=    FakerLibrary.Random Number     digits=10

    New Browser    headless=False
    Open Signup Page
    Input Business Name    ${business_name}
    Input Full Name    ${first_name}    ${last_name}  
    Input Mobile Number    ${mobile_number}
    Enter Email    ${first_name.lower()}@example.com
    Enter Password    Testing123@!
    Select Business Average Revenue    Between ₱100,000 and ₱300,000
    Select Intended Use Paymongo    I plan to start a business soon
    Accept Terms and Conditions
    Click Button With Exact Text    Sign up
    Choose Validation Method    Mobile Number
    Close Browser
