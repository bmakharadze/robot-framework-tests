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
Variables       resources/resources.py

Suite Setup     Open Browser    ${URL}    ${BROWSER}    executable_path=${CHROME_BINARY}
Suite Teardown  Close Browser

Test Setup      Log To Console    Opening Browser
Test Teardown   Log To Console    Closing Browser

*** Test Cases ***
Register Test
    [Tags]          Registering on the website with credentials.
    Launch Browser
    Click Home Page Register Button
    Is Register Page Opened
    Click Male Gender
    First Name Input                    ${NAME}
    Last Name Input                     ${SURNAME}
    Select Date Of Birth Day            ${FIRST}
    Select Date Of Birth Month          ${JANUARY}
    Select Date Of Birth Year           ${YEAR_2001}
    Register Email Input                ${MAIL}
    Select Newsletter Checkbox

Login Test
    [Tags]          Loginning in with valid credentials.
    Launch Browser
    Click Home Page Login Button
    Is Login Page Opened
    Login Email Input                   ${MAIL}
    Login Password Input                ${PASSWORD}
    Click Login Button

Add To Cart Test
    [Tags]          Finding product by name and adding it to the cart.
    Launch Browser
    Click Computers Button
    Is Computers Page Opened
    Click Desktops Button
    Is Desktop Page Opened
    Click Product Button                ${PRODUCT_NAME_1}
    Click Add To Cart Button            2

Order Test
    [Tags]          Finding few products on Home Page, adding to card and ordersing.
    Launch Browser
    Click Product from Home Page        ${PRODUCT_NAME_2}
    Click Add To Cart Button            18
    Click Home Page Button
    Click Product from Home Page        ${PRODUCT_NAME_3}
    Click Add To Cart Button            4
    Click Cart Button
    Click Agree To TOS Button
    Click Checkout Button
    Login
    Fill Shipping Address
    Click Next Day Method Radio

Check Products Presence
    Launch Browser
    Click Computers Button
    Is Computers Page Opened
    Click Desktops Button
    Are Products Present



*** Keywords ***
Launch Browser
    Maximize Browser Window
    Is Home Page Opened

Login
    Login Email Input                   ${MAIL}
    Login Password Input                ${PASSWORD}
    Click Login Button

Fill Shipping Address
    Select Country
    City Input                          ${CITY}
    Address1 Input                      ${ADDRESS}
    Zip Input                           ${ZIPCODE}
    Phone Input                         ${PHONE_NUMBER}
    Click Continue Button
