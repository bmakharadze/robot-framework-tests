*** Settings ***
Library     SeleniumLibrary
Library     String
Library    XML

*** Variables ***
${browser}          Chrome
${url}               http://swisnl.github.io/jQuery-contextMenu/demo.html
${chrome_binary}    /Users/bekamakharadze/documents/selenium/chromedriver

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

Nested container
    ${nested} =    Evaluate    [['a', 'b', 'c'], {'key': ['x', 'y']}]
    Log Many    @{nested}[0]         # Logs 'a', 'b' and 'c'.
    Log Many    @{nested}[1][key]    # Logs 'x' and 'y'.

Slice
    ${items} =    Create List    first    second    third
    Log Many    @{items}[1:]         # Logs 'second' and  'third'.

Return One Value Test
    ${result}    Return One Value    Hello, Robot
    Log    Returned Value: ${result}

Different mouse actions
    launchBrowser           https://demoqa.com/droppable/     ${browser}      ${chrome_binary}
    Drag And Drop           xpath://*[@id="draggable"]       xpath://*[@id="droppable"]
    Go To                   https://demoqa.com/selectable
    Sleep       2
    Mouse Down              //*[@id="demo-tabpane-list"]/ul/li[1]
    Sleep       2
    Mouse Up                //*[@id="demo-tabpane-list"]/ul/li[1]
    Mouse Over              //*[@id="demo-tabpane-list"]/ul/li[2]
    Sleep       2
    Mouse Out               //*[@id="demo-tabpane-list"]/ul/li[2]
    Go To                   https://demoqa.com/sortable
    Drag And Drop           //*[contains(text(), 'One')]     //*[contains(text(), 'Six')]
    Drag And Drop           //*[contains(text(), 'Two')]     //*[contains(text(), 'Six')]
    Drag And Drop           //*[contains(text(), 'Three')]     //*[contains(text(), 'Six')]
    Drag And Drop           //*[contains(text(), 'Four')]     //*[contains(text(), 'Six')]
    Drag And Drop           //*[contains(text(), 'Five')]     //*[contains(text(), 'Six')]
    Sleep      2
    Go To                   https://demoqa.com/date-picker
    Click Element           //*[@id="dateAndTimePickerInput"]

Webelements
    launchBrowser           https://google.com/     ${browser}      ${chrome_binary}
    Maximize Browser Window
    Sleep       2
    Capture Element Screenshot                          xpath://textarea[@id="APjFqb"]
    Assign Id To Element                name:btnK       NewID
    Page Should Contain Element         NewID
    Element Should Be Focused                           xpath://textarea[@id="APjFqb"]
    Element Should Be Visible                           xpath://textarea[@id="APjFqb"]
    Input Text                                          xpath://textarea[@id="APjFqb"]    Hello
    Clear Element Text                                  xpath://textarea[@id="APjFqb"]
    Sleep       2
    Element Attribute Value Should Be   name:btnK       value       Google Search
    Element Should Be Enabled           name:btnK
    Element Should Not Be Visible       name:btnKgf
    Element Should Contain                              xpath://*[@class="KxwPGc AghGtd"]/a[4]   How Search
    Element Should Not Contain                          xpath://*[@class="KxwPGc AghGtd"]/a[4]   Google Search
    Element Text Should Be                              xpath://*[@class="KxwPGc AghGtd"]/a[4]   How Search works
    Element Text Should Not Be                          xpath://*[@class="KxwPGc AghGtd"]/a[4]   How Search
    Double Click Element                                xpath://*[@class="lnXdpd"]
    Click Element At Coordinates                        xpath://*[@class="lnXdpd"]    15      10

*** Keywords ***
launchBrowser
    [Arguments]         ${appurl}   ${appbrowser}   ${executable_path}
    Open Browser        ${appurl}   ${appbrowser}   executable_path=${executable_path}
    Maximize Browser Window
    ${title}=           Get Title
    [Return]            ${title}

Return One Value
    [Arguments]    ${arg}
    [Documentation]    Return a value unconditionally.
    ...                Notice that keywords after RETURN are not executed.
    ${value} =    Convert To Upper Case    ${arg}
    RETURN    ${value}
    Fail    Not executed