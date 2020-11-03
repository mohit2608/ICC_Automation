*** Settings ***
Library           SeleniumLibrary    run_on_failure=SeleniumLibrary.Capture Page Screenshot    implicit_wait=0
Library           Collections
Library           OperatingSystem
Library           DateTime
Library           DebugLibrary
Library           DebugLibrary
Variables         ${CURDIR}/../variables.py
Variables         ${CURDIR}/../constants.py

*** Variable ***


*** Keywords ***

Go Back
    Wait Until Element Is Visible               ${robotVars.utils['backArrow']}
    click Element                               ${robotVars.utils['backArrow']}

Navigate To Home
    ${homeUrl}=          Catenate               ${MTENV}/web/home
    Go To                                       ${homeUrl}
    Wait Until Element is Visible               ${robotVars.homefeed['surveyMonkeyLogo']}

Navigate To My Surveys
    ${mySurveyUrl}=          Catenate            ${MTENV}/web/surveys
    Go To                                        ${mySurveyUrl}
    Wait Until Element is Visible                ${robotVars.mySurveys['titleMySurveys']}
    run keyword                                 Wait For Loading Icon To Disappear

Navigate To My Account
    ${myAccountUrl}=          Catenate           ${MTENV}/web/account
    Go To                                        ${myAccountUrl}
    Wait Until Element is Visible                ${robotVars.account['titleMyAccount']}
    run keyword                                 Wait For Loading Icon To Disappear

Navigate To About
    ${aboutUrl}=          Catenate               ${MTENV}/web/about
    Go To                                        ${aboutUrl}
    Wait Until Element is Visible                ${robotVars.about['titleAbout']}

Navigate To Team
    ${aboutUrl}=          Catenate               ${MTENV}/web/team
    Go To                                        ${aboutUrl}
    Wait Until Element is Visible                ${robotVars.myTeam['titleMyTeam']}

Get Random String
    ${currentDate}=                         Get Current Date
    ${randomNumber}=                        Convert Date        ${currentDate}      result_format=%Y-%m-%d_%H-%M-%S
    ${String}=                              Set Variable        Script_${randomNumber}
    [Return]                                ${String}

Wait For Loading Icon To Disappear
    Wait Until Element is Not Visible                ${robotVars.common['loading']}
    sleep                                            5