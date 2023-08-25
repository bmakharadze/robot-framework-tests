*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${cart_btn}             xpath://*[@id="topcartlink"]/a/span[1]

*** Keywords ***
Click Add To Cart Button
    [Arguments]         ${product_name}
    Click Element       //*[@id=concat('add-to-cart-button-', '${product_name}')]

Click Cart(Product) Button
    Wait Until Element Is Visible       ${cart_btn}
    Click Element       ${cart_btn}