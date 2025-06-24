*** Settings ***
Library    Browser
Resource    ../variables/config.robot

*** Variables ***


*** Keywords ***
Click Button With Exact Text 
    [Arguments]    ${button_text}
    Click    "${button_text}"

Click Button With Partial Text 
    [Arguments]    ${button_text}
    Click    ${button_text}

Validate Text Exist
    [Arguments]     ${expected_text}
    Wait For Elements State    text=${expected_text}    visible    timeout=10s
