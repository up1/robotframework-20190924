*** Keywords ***
Open
    Open Browser  
    ...  https://www.kimschiller.com/page-object-pattern-tutorial/
    ...  browser=chrome

Check signup page
    Title Should Be  Sign up

Fill in firstname ${firstname}
    Input Text   id:firstname    ${firstname}

Fill in lastname ${lastname}
    Input Text   id:lastname    ${lastname}

Fill in address ${address}
    Input Text   id:address    ${address}

Fill in zipcode ${zipcode}
    Input Text   id:address    ${zipcode}

Sign up
    Click Element   id:signup