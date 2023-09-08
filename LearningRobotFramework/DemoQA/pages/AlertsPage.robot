*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${alert_btn}            //*[@id="alertButton"]
${5_sec_alert_btn}      //*[@id="timerAlertButton"]
${confirm_alert_btn}    //*[@id="confirmButton"]
${prompt_alert_btn}     //*[@id="promtButton"]
${confirm_result}       //*[@id="confirmResult"]

*** Keywords ***
Click Alert Button
    Click Element       ${alert_btn}
    Handle Alert        Accept

Click 5 Second Alert Button
    Click Element       ${5_sec_alert_btn}
    Sleep            6
    Handle Alert    Accept

Click Confirm Alert Button
    Click Element       ${confirm_alert_btn}
    Handle Alert        Accept
    Wait Until Element Is Visible    ${confirm_result}    timeout=10s
    ${result_text}    Get Text    ${confirm_result}

Click Prompt Alert Button
    Click Element       ${prompt_alert_btn}