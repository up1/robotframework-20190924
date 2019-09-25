*** Settings ***
Library  SeleniumLibrary
Resource  pages/signup_page.robot
Resource  pages/thankyou_page.robot
Test Teardown   Close Browser

*** Test Case ***
นายสมเกียรติทำการสมัครเป็นสมาชิกใหม่ของระบบ
    กรอกชื่อ "Somkiat" นามสกุล​ "Puisungnoen"
    กรอกข้อมูลที่อยู่ "Bangkok, Thailand" "10400"
    ทำการส่งข้อมูลการสมัคร
    ผลการสมัครสำเร็จ ต้องแสดงคำว่า "Thank you!"

*** Keywords ***
กรอกชื่อ "${firstname}" นามสกุล​ "${lastname}"
    signup_page.Open
    signup_page.Check signup page
    signup_page.Fill in firstname ${firstname}
    signup_page.Fill in lastname ${lastname}

กรอกข้อมูลที่อยู่ "${address}" "${zipcode}"
    signup_page.Fill in address ${address}
    signup_page.Fill in zipcode ${zipcode}

ทำการส่งข้อมูลการสมัคร
    signup_page.Sign up

ผลการสมัครสำเร็จ ต้องแสดงคำว่า "Thank you!"
    thankyou_page.Check welcome message
