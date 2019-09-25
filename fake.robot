*** Settings ***
Library    FakerLibrary

*** Test Case ***
Try
    FOR    ${index}    IN RANGE    1    11
        ${ccn}=  Name Male
        Log To Console  ${index}=>${ccn}
    END