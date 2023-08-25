*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${desktops_btn}         //img[@alt="Picture for category Desktops"]
${notebooks_btn}        //img[@alt="Picture for category Notebooks"]
${software_btn}         //img[@alt="Picture for category Software"]

*** Keywords ***
Is Computers Page Opened
    Element Should Be Visible    ${desktops_btn}

Click Desktops Button
    Click Element    ${desktops_btn}

Click Notebooks Button
    Click Element    ${notebooks_btn}

Click Software Button
    Click Element    ${software_btn}
