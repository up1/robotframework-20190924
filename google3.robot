*** Settings ***
Library          SeleniumLibrary
Library          String
Suite Setup      เข้าไปยังหน้าค้นหาของ google
Suite Teardown   Close Browser
Test Teardown    กลับไปยังหน้าค้นหา

*** Variables ***
${URL}   http://www.google.com
${XXX}   ${EMPTY}

*** Test Cases ***
ค้นหาคำว่าเหล็กไหล
    [Tags]  done
    ค้นหาคำว่า   เหล็กไหล
    จะต้องเจอ "เหล็กไหล" นะ

ค้นหาคำว่าไออุ่น
    [Tags]  testing
    ค้นหาคำว่าv2 "ไออุ่น"
    จะต้องเจอ "ไออุ่น" นะ

*** Keywords ***
กลับไปยังหน้าค้นหา
    Go To   ${URL}

ค้นหาคำว่าv2 "${keyword}"
    Input Text      name:q   ${keyword}
    Press Keys	    name:q	 RETURN

ค้นหาคำว่า
    [Arguments]  ${keyword}
    Input Text      name:q   ${keyword}
    Press Keys	    name:q	 RETURN

จะต้องเจอ "${expectedResult}" นะ
    Wait Until Page Contains Element   id:resultStats
    ${results}=  Get Text  id:resultStats
    @{resultSplit}=  Split String   
    ...  ${results}
    ...  separator=${SPACE}
    ...  max_split=3
    Should Be Equal   ผลการค้นหาประมาณ    ${resultSplit}[0]
    Should Be Equal   รายการ    ${resultSplit}[2]
    
    ${cleanData}=  Remove String  ${resultSplit}[3]  ${SPACE}
    Should Start With   ${cleanData}   (
    Should End With     ${cleanData}   )

เข้าไปยังหน้าค้นหาของ google
    Open Browser    ${URL}   browser=chrome
    Maximize Browser Window

