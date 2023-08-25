*** Settings ***
Library         SeleniumLibrary
Resource        pages/HomePage.robot
Resource        pages/RegisterPage.robot
Resource        pages/LoginPage.robot
Resource        pages/ComputersPage.robot
Resource        pages/DesktopsPage.robot
Resource        pages/ProductPage.robot
Resource        pages/CartPage.robot
Resource        pages/CheckoutPage.robot
Variables       enums/DateOfBirthDay.py
Variables       enums/DateOfBirthMonth.py
Variables       enums/DateOfBirthYear.py

Suite Setup     Open Browser    ${URL}    ${BROWSER}    executable_path=${CHROME_BINARY}
Suite Teardown  Close Browser

Test Setup      Log To Console    Opening Browser
Test Teardown   Log To Console    Closing Browser

*** Variables ***
${BROWSER}        Chrome
${URL}            https://demo.nopcommerce.com/
${CHROME_BINARY}  /Users/bekamakharadze/documents/selenium/chromedriver

*** Test Cases ***
Register Test
    [Tags]          Registering on the website with credentials.
    Launch Browser
    Click Home Page Register Button
    Is Register Page Opened
    Click Male Gender
    First Name Input                    Becca
    Last Name Input                     Mak
    Select Date Of Birth Day            ${DateOfBirthDay.FIRST}
    Select Date Of Birth Month          ${DateOfBirthMonth.JANUARY}
    Select Date Of Birth Year           ${DateOfBirthYear.YEAR_2001}
    Register Email Input                becca@gmail.com
    Select Newsletter Checkbox

Login Test
    [Tags]          Loginning in with valid credentials.
    Launch Browser
    Click Home Page Login Button
    Is Login Page Opened
    Login Email Input                   becca@gmail.com
    Login Password Input                Test123
    Click Login Button
    Close Browser

Add To Cart Test
    [Tags]          Finding product by name and adding it to the cart.
    Launch Browser
    Click Computers Button
    Is Computers Page Opened
    Click Desktops Button
    Is Desktop Page Opened
    Click Product Button                Digital Storm VANQUISH 3 Custom Performance PC
    Click Add To Cart Button            2

Order Test
    [Tags]          Finding few products on Home Page, adding to card and ordersing.
    Launch Browser
    Click Product from Home Page       HTC One M8 Android L 5.0 Lollipop
    Click Add To Cart Button            18
    Click Home Page Button
    Click Product from Home Page       Apple MacBook Pro 13-inch
    Click Add To Cart Button            4
    Click Cart Button
    Click Agree To TOS Button
    Click Checkout Button
    Login
    Fill Shipping Address
    Click Next Day Method Radio

*** Keywords ***
Launch Browser
    Maximize Browser Window
    Is Home Page Opened

Login
    Login Email Input                   becca@gmail.com
    Login Password Input                Test123
    Click Login Button

Fill Shipping Address
    Select Country
    City Input                          New York
    Address1 Input                      Brodway
    Zip Input                           52200
    Phone Input                         3424325342534
    Click Continue Button
