*** Settings ***
Library           SeleniumLibrary    run_on_failure=SeleniumLibrary.Capture Page Screenshot    implicit_wait=0
Library           Collections
Library           OperatingSystem
Library           DateTime
Library           DebugLibrary
Variables         variables.py
Variables         constants.py
Resource         ${CURDIR}/PO/CommonKeywords.robot

*** Variable ***
${ENV}                          qa
${BROWSER}                      chrome
${HUB}                          False
${QA}                          https://myicc-stage.iccsafe.org
@{TEST_CASES}                   0


#  $ source MobileWebEnv/bin/activate
# Command to run single test cases => $ robot --variable HUB:False <test>

*** Keywords ***
Test Initiate
    [Documentation]         This keyword initiates the test and takes nothing
    [Arguments]             ${account_type}     ${test_case_name}
    Run keyword if              ${ENV=='qa'}                                                                                  set ENV QA
    ${orig_timeout}=            Set Selenium Timeout	      60 seconds
    Run Keyword if              ${HUB=='True'}               Initiate Hub
    ...                         ELSE IF                      ${HUB=='False'}              Open Chrome Browser
    Generate User                 ${account_type}
    Reload Page


set ENV QA
    set global variable           ${MTENV}                  https://myicc-stage.iccsafe.org


Test Initiate No Login
    [Documentation]         This keyword initiates the test without logging in
    [Arguments]             ${test_case_name}
    Run keyword if              ${ENV=='qa'}                                                                                  set ENV QA
    ${orig_timeout}=            Set Selenium Timeout	     60 seconds
    Run Keyword if              ${HUB=='True'}               Initiate Hub
    ...                         ELSE IF                      ${HUB=='False'}              Open Chrome Browser
    Delete All Cookies
    Reload Page

Test Initiate Existing User
    [Documentation]         This keyword initiates the test and logs in with an existing user using cookie
    [Arguments]             ${test_case_name}       ${username}     ${password}
    Run keyword if              ${ENV=='qa'}                                                                                  set ENV QA
    ${orig_timeout}=            Set Selenium Timeout	     60 seconds
    Run Keyword if              ${HUB=='True'}               Initiate Hub
    ...                         ELSE IF                      ${HUB=='False'}              Open Chrome Browser
    Reload Page

Open Chrome Browser
    Open Browser                ${MTENV}          ${BROWSER}          alias=driver

Test Teardown
    Run Keyword                 Logout
    Close All Browsers

Test Teardown No Login
    Close All Browsers

Logout
    Navigate To My Account
    Reload Page
    run keyword                                 Wait For Loading Icon To Disappear
    Wait Until Element Is Visible               ${robotVars.account['signOut']}
    sleep                                       20
    Click Element                               ${robotVars.account['signOut']}

Verify User Logged In
    run keyword                                 Wait For Loading Icon To Disappear
    Click Element                               ${robotVars.menu['menuOpen']}
    Wait Until Element Is Visible               ${robotVars.menu['username']}
    ${actual}=                                  Get Text                ${robotVars.menu['username']}
    ${user}=                                    Get Username
    should be equal as strings                  ${actual}               ${user}
    Click Element                               ${robotVars.menu['menuClose']}