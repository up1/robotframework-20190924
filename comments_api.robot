*** Settings ***
Library  RequestsLibrary
Library  Collections

*** Test Case ***
Flow 1
    ${email}=  Get Comments
    Log To Console  ${email}

*** Keywords ***
Get Comments
    Create Session   api  https://jsonplaceholder.typicode.com
    ${response}=  Get Request  api  /comments
    # Status code = 200
    Should Be Equal  	${response.status_code}	   ${200}
    Should Be Equal As Strings	  ${response.status_code}	200
    # No. of comments
    Length Should Be    ${response.json()}   500
    # Check first comment
    Should Be Equal   ${response.json()[0]["id"]}   ${1}
    Should Be Equal   ${response.json()[0]["email"]}   Eliseo@gardner.biz
    # Format of comment
    Should Contain Match	${response.json()[0]}    id
    Should Contain Match	${response.json()[0]}    postId
    Should Contain Match	${response.json()[0]}    name
    Should Contain Match	${response.json()[0]}    email
    Should Contain Match	${response.json()[0]}    body
    [Return]   ${response.json()[0]["email"]}
