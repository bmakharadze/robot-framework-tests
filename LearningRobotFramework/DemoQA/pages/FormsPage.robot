*** Settings ***
Library     SeleniumLibrary
Variables       ../../../resources/resources.py

*** Variables ***
${first_name_input}           xpath://*[@id="firstName"]
${last_name_input}            xpath://*[@id="lastName"]
${email_input}                xpath://*[@id="userEmail"]
${phone_number_input}         xpath://*[@id="userNumber"]
${calendar_open_button_locator}     //*[@id="dateOfBirthInput"]
${year_dropdown_locator}            //*[@id="dateOfBirth"]/div[2]/div[2]/div/div/div[2]/div[1]/div[2]/div[2]/select
${month_dropdown_locator}           //*[@id="dateOfBirth"]/div[2]/div[2]/div/div/div[2]/div[1]/div[2]/div[1]/select
${file_locator}                     //*[@id="uploadPicture"]
${address_locator}                  //*[@id="currentAddress"]

*** Keywords ***
Is Forms Page Opened
    Element Should Be Visible    ${first_name_input}

First Name Input
    [Arguments]     ${first_name}
    Input Text      ${first_name_input}    ${first_name}

Last Name Input
    [Arguments]     ${last_name}
    Input Text      ${last_name_input}    ${last_name}

Email Input
    [Arguments]     ${email}
    Input Text      ${email_input}    ${email}

Gender Radio Buttons
    [Arguments]     ${gender}
    Select Radio Button    gender    ${gender}

Phone Number Input
    [Arguments]     ${phone_number}
    ${length}    Get Length    ${phone_number}
    Run Keyword If    ${length} > 10    Input Text    ${phone_number_input}    ${phone_number}
    ...    ELSE     Fail    Phone number should have more than 10 numbers

Select Date From Calendar
    [Arguments]    ${date_string}
    ${date_parts}    Evaluate    $date_string.split('-')
    ${year}    Set Variable    ${date_parts}[0]
    ${month}    Set Variable    ${date_parts}[1]
    ${day}    Set Variable    ${date_parts}[2]

    Click Element    ${calendar_open_button_locator}
    Click Element    ${year_dropdown_locator}
    Click Element    xpath://option[text()='${year}']
    Click Element    ${month_dropdown_locator}
    Click Element    xpath://option[text()='${month}']
    Click Element    xpath://div[contains(@class, 'react-datepicker__day') and text()='${day}']

Hobbies Checkbox
    Select Checkbox   xpath=//input[@type='checkbox'][1]
    Select Checkbox   xpath=//input[@type='checkbox'][2]
    Select Checkbox   xpath=//input[@type='checkbox'][3]

Choose File Input
    [Arguments]       ${file_location}
    Choose File       ${file_locator}     ${file_location}

Current Address Input
    [Arguments]     ${address}
    Input Text      ${address_locator}    ${address}

