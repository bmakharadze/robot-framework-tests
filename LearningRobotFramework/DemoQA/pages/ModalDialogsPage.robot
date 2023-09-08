*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${small_modal_btn}          //*[@id="showSmallModal"]
${large_modal_btn}          //*[@id="showLargeModal"]
${modal_close_btn}          //*[@id="closeSmallModal"]

*** Keywords ***
Click Small Modal Button
    Click Element       ${small_modal_btn}
    Click Button        ${modal_close_btn}

Click Large Modal Button
    Click Element       ${large_modal_btn}
    Click Button        ${modal_close_btn}