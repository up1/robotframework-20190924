*** Settings ***
Library          SeleniumLibrary
Library          String
Resource         resources/googles.robot
Suite Setup      googles.เข้าไปยังหน้าค้นหาของ google
Suite Teardown   Close Browser
Default Tags     v5

*** Variables ***
${URL}   http://www.google.com
${XXX}   ${EMPTY}

*** Test Cases ***
XXXX
    [Template]  Flow search in google
    #  keyword   # Expected result
    เหล็กไหล        เหล็กไหล
    ไออุ่น          ไออุ่น
    ไออุ่น          ไออุ่น
    ไออุ่น          ไออุ่น

*** Keywords ***
Flow search in google
    [Arguments]   ${keyword}  ${expectedResult}
    googles.ค้นหาคำว่าv2 "${keyword}"
    googles.จะต้องเจอ "${expectedResult}" นะ
    googles.กลับไปยังหน้าค้นหา