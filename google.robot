*** Settings ***
Library     SeleniumLibrary

*** Variables ***

*** Test Cases ***
ค้นหาคำว่าเหล็กไหล
    เข้าไปยังหน้าค้นหาของ google
    ค้นหาเหล็กไหล
    จะต้องเจอดูเหล็กไหล

*** Keywords ***
จะต้องเจอดูเหล็กไหล
    Wait Until Element Contains
    ...  xpath://*[@id="tvcap"]/div/div/div/div/h3/span
    ...  ดูเหล็กไหล

เข้าไปยังหน้าค้นหาของ google
    Open Browser    http://www.google.com   browser=chrome
    Maximize Browser Window

ค้นหาเหล็กไหล
    Input Text      name:q   เหล็กไหล
    Press Keys	    name:q	 RETURN

