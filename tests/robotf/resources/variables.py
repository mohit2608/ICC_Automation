class RobotVars(object):
    def __init__(self):
        pass

    signIn={
        "signUp":
            "xpath=//div[contains(@class,'account')]//div[contains(@class,'already')]//a",
        "confirmSignin":
            "xpath=//button[contains(.,'LOG IN') or contains(.,'SIGN IN')]",
        "inputUser":
            "id=username",
        "inputPass":
            "id=password",
        "signInButton":
            "xpath=//*[@id='app']/div[3]/main/div/div/div[2]/form/div/div[4]/button/div",
        "invalidCredentialError":
            "xpath=//li[text()='The username or password you entered is incorrect. Please try again--and remember that passwords are case sensitive.']",
        "forgotPasswordLink":
            "link=Forgot username or password?",
        "loginGoogle":
            "id=hlGoogle",
        "loginFacebook":
            "id=hlFacebook",
        "noPasswordError":
            "xpath=//div[@class='missing'][text()='Please enter a password.']",
        "noUsernameError":
            "xpath=//div[@class='missing'][text()='Please enter a username.']"

    }

    common = {
        "loading":
            "id=loading"
    }

robotVars = RobotVars()
