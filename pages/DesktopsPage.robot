*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${desktops_label}       //h1[text()="Desktops"]
@{PRODUCT_IDS}=         1    2    3

*** Keywords ***
Is Desktop Page Opened
    Element Should Be Visible    ${desktops_label}

Click Product Button
    [Arguments]     ${product_name}
    Click Element    xpath://*[contains(text(), '${product_name}')][1]

Are Products Present
     FOR    ${product_id}    IN    @{PRODUCT_IDS}
        ${element_present}    Run Keyword And Return Status    Element Should Be Visible    xpath=//*[@data-productid="${product_id}"]/div[2]/h2/a
        ${product_text}    Get Text    xpath=//*[@data-productid="${product_id}"]/div[2]/h2/a
        Run Keyword If    ${element_present}    Log    Product with ID ${product_id} is present. Name: ${product_text}
        ...    ELSE    Log    Product with ID ${product_id} is not present.
    END