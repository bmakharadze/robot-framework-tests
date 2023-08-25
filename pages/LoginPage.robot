*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${email_input}      xpath://*[@id="Email"]
${password_input}   xpath://*[@id="Password"]
${login_btn}        xpath://*[contains(text(), 'Log in')][1]

*** Keywords ***
Is Login Page Opened
    Element Should Be Visible    ${email_input}

Login Email Input
    [Arguments]     ${email}
    Input Text      ${email_input}    ${email}

Login Password Input
    [Arguments]     ${password}
    Input Text      ${password_input}    ${password}

Click Login Button
    Click Element    ${login_btn}
