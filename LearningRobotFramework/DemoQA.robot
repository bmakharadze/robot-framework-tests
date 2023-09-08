*** Settings ***
Library         SeleniumLibrary
Resource        DemoQA/pages/FormsPage.robot
Resource        DemoQA/pages/BrowserWindowsPage.robot
Resource        DemoQA/pages/AlertsPage.robot
Resource        DemoQA/pages/FramesPage.robot
Resource        DemoQA/pages/WidgetsPage.robot
Resource        DemoQA/pages/ModalDialogsPage.robot
Variables       ../resources/resources.py


Suite Setup     Open Browser        https://demoqa.com/automation-practice-form       ${BROWSER}    executable_path=${CHROME_BINARY}
Suite Teardown  Close Browser

Test Setup      Log To Console      Opening Browser
Test Teardown   Log To Console      Closing Browser

*** Test Cases ***
Forms Test
    Maximize Browser Window
    FormsPage.First Name Input                ${NAME}
    FormsPage.Last Name Input                 ${SURNAME}
    FormsPage.Email Input                     ${MAIL}
#    FormsPage.Gender Radio Buttons             ${GENDER}
    FormsPage.Phone Number Input              ${PHONE_NUMBER}
    FormsPage.Select Date From Calendar       ${BIRTH_DATE}
#    FormsPage.Hobbies Checkbox                  Sports
    FormsPage.Choose File Input               ${FILE_LOCATION}
    FormsPage.Current Address Input           ${CITY} ${ADDRESS}

Windows Test
    Maximize Browser Window
    Go To    https://demoqa.com/browser-windows
    BrowserWindowsPage.Click New Tab Button
    Switch Window       DEMOQA
    BrowserWindowsPage.Click New Window Button
    Switch Window       DEMOQA
    BrowserWindowsPage.Click New Message Window Button
    Switch Window       DEMOQA
    Sleep               4

Alerts Test
    Maximize Browser Window
    Go To    https://demoqa.com/alerts
    AlertsPage.Click Alert Button
    AlertsPage.Click 5 Second Alert Button
    AlertsPage.Click Confirm Alert Button
    AlertsPage.Click Prompt Alert Button

Frame Test
    Maximize Browser Window
    Go To    https://demoqa.com/frames
    FramesPage.Perform Actions in Frame

Modals Test
    Maximize Browser Window
    Go To    https://demoqa.com/modal-dialogs
    ModalDialogsPage.Click Small Modal Button
    ModalDialogsPage.Click Large Modal Button

Widgets Test
    Maximize Browser Window
#    Go To    https://demoqa.com/accordian
#    WidgetsPage.Click All Accordion Buttons
#    Go To    https://demoqa.com/auto-complete
#    WidgetsPage.Auto Complete Input         Yell
#    Go To    https://demoqa.com/slider
#    WidgetsPage.Slider Action
#    Go To    https://demoqa.com/progress-bar
#    WidgetsPage.Click Progress Bar Start Button
    Go To    https://demoqa.com/tool-tips
    WidgetsPage.Hover Over Elements

*** Keywords ***

