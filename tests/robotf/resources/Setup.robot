*** Settings ***
Resource         ../resources/resource.robot

*** Variable ***

*** Keywords ***
Test Setup Without Login
    [Documentation]         This keyword initiates the test without logging in
    [Arguments]             ${test_case_name}
    resource.Test Initiate No Login          ${test_case_name}

Test Teardown Without Logout
    [Documentation]         This keyword close all the browers
    resource.Test Teardown No Login