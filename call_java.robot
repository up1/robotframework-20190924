*** Settings ***
Library   Process

*** Test Case ***
ZZZZZ
    ${result}=  Run Process   java   Hello   robot
    Log To Console   ${result.stdout}