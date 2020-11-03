*** Settings ***
Library           SeleniumLibrary    run_on_failure=SeleniumLibrary.Capture Page Screenshot    implicit_wait=0
Library           Collections
Library           OperatingSystem
Library           DateTime
Library           DebugLibrary
Library           DebugLibrary
Variables         ../variables.py
Variables         ../constants.py
Resource          ../../resources/resource.robot

*** Variable ***


*** Keywords ***

Navigate To Sign In Page
    sleep                                       7
    Wait Until Element is Visible               ${robotVars.signIn['inputUser']}


Verify Sign In With Valid Credentials
    [Arguments]     ${user}     ${password}
    run keyword                                 Navigate To Sign In Page
    Wait Until Element Is Visible               ${robotVars.signIn['inputUser']}
    input text                                  ${robotVars.signIn['inputUser']}                    ${user}
    input text                                  ${robotVars.signIn['inputPass']}                    ${password}
    click element                               ${robotVars.signIn['signInButton']}
    run keyword                                 Wait For Loading Icon To Disappear
    sleep                                       10
    ${url}=                                     Get Location
    log to console                              ${url}
    should contain                              ${url}                                              https://myicc-stage.iccsafe.org/dashboard
