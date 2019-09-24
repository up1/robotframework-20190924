*** Settings ***
Library   SeleniumLibrary

*** Test Cases ***
ทำการ upload file รูปภาพจำนวน 3 ไฟล์
    ไปยังหน้า upload file
    เลือก file data_01.png
    เลือก file data_02.png
    เลือก file data_03.png
    ทำการตรวจสอบข้อมูลของทั้งสามไฟล์ก่อนทำการ upload ต้องถูกต้อง
    ทำการ upload file data_01.png ต้องสำเร็จ
    ทำการ upload file data_02.png ต้องสำเร็จ
    ทำการ upload file data_03.png ต้องสำเร็จ

*** Keywords ***
ทำการ upload file data_03.png ต้องสำเร็จ
    Click Element  
    ...   xpath://table/tbody/tr[3]/td[5]/button[1]
    Wait Until Page Contains Element
    ...   xpath://div[@style="width: 100%;"]
    
ทำการ upload file data_02.png ต้องสำเร็จ
    Click Element  
    ...   xpath://table/tbody/tr[2]/td[5]/button[1]
    Wait Until Page Contains Element
    ...   xpath://div[@style="width: 67%;"]

ทำการ upload file data_01.png ต้องสำเร็จ
    Click Element  
    ...   xpath://table/tbody/tr[1]/td[5]/button[1]
    Wait Until Page Contains Element
    ...   xpath://div[@style="width: 33%;"]

ทำการตรวจสอบข้อมูลของทั้งสามไฟล์ก่อนทำการ upload ต้องถูกต้อง
    Wait Until Element Contains
    ...   xpath://*[@id="ng-app"]/body/div/div[2]/div[2]/p
    ...   Queue length: 3
    Wait Until Element Contains
    ...   xpath://table/tbody/tr[1]/td[1]
    ...   data_01.png
    Wait Until Element Contains
    ...   xpath://table/tbody/tr[2]/td[1]
    ...   data_02.png
    Wait Until Element Contains
    ...   xpath://table/tbody/tr[3]/td[1]
    ...   data_03.png

เลือก file data_03.png
    Choose File   
    ...  xpath://div/div[2]/div[1]/input[2]
    ...  ${CURDIR}/data_tests/data_03.png
    
เลือก file data_02.png
    Choose File   
    ...  xpath://*[@id="ng-app"]/body/div/div[2]/div[1]/input[2]
    ...  ${CURDIR}/data_tests/data_02.png

เลือก file data_01.png
    Choose File   
    ...  xpath://*[@id="ng-app"]/body/div/div[2]/div[1]/input[2]
    ...  ${CURDIR}/data_tests/data_01.png

ไปยังหน้า upload file
    Open Browser   
    ...  http://nervgh.github.io/pages/angular-file-upload/examples/simple/
    ...  browser=chrome
