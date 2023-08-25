*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${browser}          Chrome
${url}               http://swisnl.github.io/jQuery-contextMenu/demo.html
${chrome_binary}    /Users/bekamakharadze/documents/selenium/chromedriver.exe

*** Test Cases ***
Mouse Actions Test
    launchBrowser               ${url}      ${browser}      ${chrome_binary}
    Open Context Menu           xpath://span[@class='context-menu-one btn btn-neutral']
    Go To                       https://testautomationpractice.blogspot.com/ maximize browser window
    Double Click Element        xpath://button[contains(text (), 'Copy Text')]

#User Defined Keywords Test
#    ${PageTitle}=       launchBrowser     ${url}      ${browser}     ${chrome_binary}
#    Log To Console      ${PageTitle}
#    Log                 ${PageTitle}
#    Input Text          name:userName   mercury
#    Input Text          name:password   mercury

Scrolling Test
    launchBrowser               https://www.countries-ofthe-world.com/flags-of-the-world.html      ${browser}      ${chrome_binary}
    Execute Javascript          window.scrollTo(0, 2500)
    Scroll Element Into View    xpath://*[@id="content"]/div[2]/div[2]/table[1]/tbody/tr[86]/td[1]/img

Test Alert Handling
    launchBrowser               https://www.w3schools.com/jsref/tryit.asp?filename=tryjsref_alert      ${browser}      ${chrome_binary}
    Click Button                xpath=//button[text()="Try it"]
    Handle Alert                accept
    Page Should Contain         You pressed OK!

Handling Alerts
    launchBrowser               https://testautomationpractice.blogspot.com/      ${browser}      ${chrome_binary}
    Click Element               //*[@id="HTML9"]/div[1]/button[1]
    Handle Alert                accept

Alert And Frame Test
    launchBrowser               https://www.w3schools.com/jsref/tryit.asp?filename=tryjsref_alert      ${browser}      ${chrome_binary}
    Select Frame                //*[@id="iframeResult"]
    Click Button                xpath=//button[text()="Try it"]
    Handle Alert                accept
    Capture Page Screenshot

TableValidations
    launchBrowser        https://testautomationpractice.blogspot.com/        ${browser}      ${chrome_binary}
    ${rows}=    get element count       xpath://table[@name='BookTable']/tbody/tr
    ${cols}=    get element count       xpath://table[@name='BookTable]/tbody/tr[1]/tr
    log to console ${rows}
    log to console ${cols}
    ${data}=    get text        xpath://table[@name='BookTable']/tbody/tr[5]/td[1]
    log to console ${data}
    table column should contain         xpath://table[@name='BookTable']        2       Author
    table row should contain            xpath://table[@name= 'BookTable']       4       Learn JS

*** Keywords ***
launchBrowser
    [Arguments]         ${appurl}   ${appbrowser}   ${executable_path}
    Open Browser        ${appurl}   ${appbrowser}   executable_path=${executable_path}
    Maximize Browser Window
    ${title}=           Get Title
    [Return]            ${title}
