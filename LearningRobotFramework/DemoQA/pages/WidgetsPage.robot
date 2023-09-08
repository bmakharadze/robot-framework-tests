*** Settings ***
Library     SeleniumLibrary
Library    XML

*** Variables ***
${accardion}            //div[@class="card-header"]
${auto_complete}        autoCompleteMultipleInput
${slider_locator}       //*[@id="sliderContainer"]/div[1]/span/input
${hover_btn}            //*[@id="toolTipButton"]
${Hover_input}          //*[@id="toolTipTextField"]
${Hover_text}           //*[@id="texToolTopContainer"]/a[1]

*** Keywords ***
Click All Accordion Buttons
   @{accordion_buttons} =    Get WebElements        ${accardion}
    FOR     ${button}    IN    @{accordion_buttons}
            Click Element    ${button}
            Sleep       3
    END

Auto Complete Input
    [Arguments]         ${prompt}
    Input Text          id=${auto_complete}    ${prompt}
    Click Element       xpath=//*[text()='${prompt}']
    Sleep               3

Slider Action
    Execute JavaScript      document.querySelector('${slider_locator}').value = 50

Click Progress Bar Start Button
    Click Element           //*[@id="startStopButton"]
    Wait Until Element Is Visible       //*[@id="resetButton"]          20s
    Log To Console          Progress Bar is 100%

Hover Over Elements
    Mouse Over      ${hover_btn}
    Mouse Over      ${Hover_input}
    Mouse Over      ${Hover_text}