*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${new_tab_btm}                  //*[@id="tabButton"]
${new_window_btn}               //*[@id="windowButton"]
${new_mewssage_window_btn}      //*[@id="messageWindowButton"]

*** Keywords ***
Click New Tab Button
    Click Element                   ${new_tab_btm}

Click New Window Button
    Click Element                   ${new_window_btn}

Click New Message Window Button
    Click Element                   ${new_mewssage_window_btn}