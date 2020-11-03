*** Settings ***
Resource        ../../resources/resource.robot
Resource        ../../resources/PO/SignInKeywords.robot
Resource        ../../resources/TestSetup.robot
Variables       ../../resources/constants.py

Test Setup      TestSetup.Test Setup Without Login              ${test_case_name}
Test Teardown   TestSetup.Test Teardown Without Logout

*** Variables ***
${test_case_name}           ICC:C1180495_SignInWithcorrectCredential

*** Test Cases ***
C1180495_SignInWithcorrectCredential
    [Tags]      testrailid=180495    BVT
    [Documentation]    Verify that a user can log into the app with valid credentials.
    SignInKeywords.Verify Sign In With Valid Credentials          ${constants.signIn['validUsername']}          ${constants.signIn['validPassword']}
