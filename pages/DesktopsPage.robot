*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${desktops_label}       //h1[text()="Desktops"]

*** Keywords ***
Is Desktop Page Opened
    Element Should Be Visible    ${desktops_label}

Click Product Button
    [Arguments]     ${product_name}
    Click Element    xpath://*[contains(text(), '${product_name}')][1]
