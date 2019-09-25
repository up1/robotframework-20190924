*** Settings ***
Library          SeleniumLibrary
Library          String

*** Variables ***
${URL}   http://www.google.com
${XXX}   ${EMPTY}

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