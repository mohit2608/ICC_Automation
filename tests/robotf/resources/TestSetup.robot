*** Settings ***
Resource         ../resources/resource.robot
Resource         ../resources/Setup.robot

*** Variable ***

*** Keywords ***

Test Setup Without Login
    [Documentation]         This keyword initiates the test without logging in
    [Arguments]             ${test_case_name}
    Setup.Test Setup Without Login          ${test_case_name}

Test Teardown Without Logout
    [Documentation]         This keyword close all the browers
    Setup.Test Teardown Without Logout