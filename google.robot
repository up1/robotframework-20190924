*** Settings ***
Library     SeleniumLibrary
Library     String

*** Variables ***

*** Test Cases ***
ค้นหาคำว่าเหล็กไหล
    [Tags]  done
    เข้าไปยังหน้าค้นหาของ google
    ค้นหาเหล็กไหล
    จะต้องเจอดูเหล็กไหล

ค้นหาคำว่าเหล็กไหล 2
    [Tags]  testing
    เข้าไปยังหน้าค้นหาของ google
    ค้นหาเหล็กไหล
    จะต้องเจอดูเหล็กไหล

*** Keywords ***
จะต้องเจอดูเหล็กไหล
    # Wait Until Element Contains
    # ...  xpath://*[@id="tvcap"]/div/div/div/div/h3/span
    # ...  ดูเหล็กไหล

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
    Open Browser    http://www.google.com   browser=chrome
    Maximize Browser Window

ค้นหาเหล็กไหล
    Input Text      name:q   เหล็กไหล
    Press Keys	    name:q	 RETURN

