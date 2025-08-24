*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${BASE_URL}    https://jsonplaceholder.typicode.com

*** Test Cases ***
Get User By ID
    [Documentation]    Simple GET request with full URL in session
    Create Session    jsonplaceholder    ${BASE_URL}
    ${response}=    GET On Session    jsonplaceholder    /users/1
    Should Be Equal As Integers    ${response.status_code}    200
    Should Be Equal    ${response.json()['name']}    Leanne Graham

Create New Post
    [Documentation]    Simple POST request with full URL in session
    Create Session    jsonplaceholder    ${BASE_URL}
    ${data}=    Create Dictionary    title=Hello    body=World    userId=1
    ${response}=    POST On Session    jsonplaceholder    /posts    json=${data}
    Should Be Equal As Integers    ${response.status_code}    201
    Dictionary Should Contain Key    ${response.json()}    id