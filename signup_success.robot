*** Settings ***
Library  SeleniumLibrary
Test Teardown   Close Browser

*** Test Case ***
นายสมเกียรติทำการสมัครเป็นสมาชิกใหม่ของระบบ
    กรอกชื่อ "Somkiat" นามสกุล​ "Puisungnoen"
    กรอกข้อมูลที่อยู่ "Bangkok, Thailand" "10400"
    ทำการส่งข้อมูลการสมัคร
    ผลการสมัครสำเร็จ ต้องแสดงคำว่า "Thank you!"

*** Keywords ***
กรอกชื่อ "${firstname}" นามสกุล​ "${lastname}"
    Open Browser  
    ...  https://www.kimschiller.com/page-object-pattern-tutorial/
    ...  browser=chrome
    Input Text   id:firstname    ${firstname}
    Input Text   id:lastname    ${lastname}

กรอกข้อมูลที่อยู่ "${address}" "${zipcode}"
    Input Text   id:address    ${address}
    Input Text   id:zipcode    ${zipcode}

ทำการส่งข้อมูลการสมัคร
    Click Element   id:signup

ผลการสมัครสำเร็จ ต้องแสดงคำว่า "Thank you!"
    Wait Until Page Contains    Thank you!
