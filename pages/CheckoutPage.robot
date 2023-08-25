*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${country_select}           //*[@id="BillingNewAddress_CountryId"]
${city_input}               //*[@id="BillingNewAddress_City"]
${address1_input}           //*[@id="BillingNewAddress_Address1"]
${zip_input}                //*[@id="BillingNewAddress_ZipPostalCode"]
${phone_input}              //*[@id="BillingNewAddress_PhoneNumber"]
${continue_btn}             //*[@id="billing-buttons-container"]/button[4]

${ground_radio}             //*[@id="shippingoption_0"]
${next_day_radio}           //*[@id="shippingoption_1"]
${2nd_day_radio}            //*[@id="shippingoption_2"]
${shipping_continue_btn}    //*[@id="shipping-method-buttons-container"]/button
${back_btn}                 //*[@id="shipping-method-buttons-container"]/p/a

*** Keywords ***
Select Country
    Click Element    ${country_select}

City Input
    [Arguments]     ${city}
    Input Text      ${city_input}       ${city}

Address1 Input
    [Arguments]     ${address1}
    Input Text      ${address1_input}       ${address1}

Zip Input
    [Arguments]     ${zip_code}
    Input Text      ${zip_input}       ${zip_code}

Phone Input
    [Arguments]     ${phone_number}
    Input Text      ${phone_input}       ${phone_number}

Click Continue Button
    Click Element    ${continue_btn}

Click Ground Method Radio
    Click Element           ${ground_radio}

Click Next Day Method Radio
    Click Element           ${next_day_radio}

Click 2nd Day Method Radio
    Click Element           ${2nd_day_radio}

Click Back Button (Shipping Method)
    Click Element           ${back_btn}

Click Continue Button (Shipping Method)
    Click Element           ${shipping_continue_btn}

