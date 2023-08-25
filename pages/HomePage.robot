*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${login_btn}            xpath://*[contains(text(), 'Log in')][1]
${register_btn}         xpath://*[contains(text(), 'Register')][1]
${computers_btn}        xpath://*[contains(text(),'Computers')][1]
${cart_btn}             xpath://*[@id="bar-notification"]/div/p/a
${home_btn}             //*[@alt="nopCommerce demo store"]

*** Keywords ***
Is Home Page Opened
    Element Should Be Visible    ${login_btn}

Click Home Page Login Button
    Click Element    ${login_btn}

Click Home Page Register Button
    Click Element    ${register_btn}

Click Computers Button
    Click Element    ${computers_btn}

Click Cart Button
    Wait Until Element Is Visible    ${cart_btn}
    Click Element    ${cart_btn}

Click Home Page Button
    Click Element    ${home_btn}

Click Product from Home Page
    [Arguments]      ${product_name}
    Click Element    xpath://*[contains(text(), '${product_name}')][1]
