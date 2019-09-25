*** Settings ***
Resource         resources/googles.robot
Suite Setup      เข้าไปยังหน้าค้นหาของ google
Suite Teardown   Close Browser
Test Teardown    กลับไปยังหน้าค้นหา
Test Template    Flow search in google
Default Tags     v4

*** Test Cases ***
#    name       #    keyword   # Expected result
ค้นหาคำว่าเหล็กไหล    เหล็กไหล        เหล็กไหล
ค้นหาคำว่าไออุ่น1       ไออุ่น          ไออุ่น
ค้นหาคำว่าไออุ่น2       ไออุ่น          ไออุ่น
ค้นหาคำว่าไออุ่น3       ไออุ่น          ไออุ่น

*** Keywords ***
Flow search in google
    [Arguments]   ${keyword}  ${expectedResult}
    ค้นหาคำว่าv2 "${keyword}"
    จะต้องเจอ "${expectedResult}" นะ