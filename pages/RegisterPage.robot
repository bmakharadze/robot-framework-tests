*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${first_name_input}     xpath://*[@id="FirstName"]
${last_name_input}      xpath://*[@id="LastName"]
${birth_day_select}     xpath://*[@name="DateOfBirthDay"]
${birth_month_select}   xpath://*[@name="DateOfBirthMonth"]
${birth_year_select}    xpath://*[@name="DateOfBirthYear"]
${email_input}          xpath://*[@id="Email"]
${newsletter_checkbox}  //*[@id="Newsletter"]

*** Keywords ***
Is Register Page Opened
    Element Should Be Visible    ${first_name_input}

Click Male Gender
    Click Element    xpath://*[@id="gender-male"]

First Name Input
    [Arguments]    ${first_name}
    Input Text    ${first_name_input}    ${first_name}

Last Name Input
    [Arguments]    ${last_name}
    Input Text    ${last_name_input}     ${last_name}

Select Date Of Birth Day
    [Arguments]    ${day_value}
    Select From List By Value    ${birth_day_select}     ${day_value}

Select Date Of Birth Month
    [Arguments]    ${month_value}
    Select From List By Value    ${birth_month_select}    ${month_value}

Select Date Of Birth Year
    [Arguments]    ${year_value}
    Select From List By Value    ${birth_year_select}    ${year_value}

Register Email Input
    [Arguments]     ${email}
    Input Text      ${email_input}      ${email}

Select Newsletter Checkbox
    Select Checkbox   ${newsletter_checkbox}
