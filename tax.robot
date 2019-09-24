*** Settings ***
Library   SeleniumLibrary
Test Teardown   Close Browser

*** Test Cases ***
XXX
    Open Browser   
    ...   https://rdserver.rd.go.th/publish/index.php?page=taxonline
    ...   browser=chrome
    Select Frame  xpath://*[@id="lightboxdialog"]/p/iframe
    Click Link    คลิก 
    Unselect Frame
    Click Element
    ...  xpath://*[@id="lightboxdialog"]/button