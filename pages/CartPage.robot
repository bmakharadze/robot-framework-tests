*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${remove_btn}           xpath://*[@class="remove-btn"]
${discount_input}       xpath://*[@id="discountcouponcode""]
${discount_btn}         xpath://*[@id="applydiscountcouponcode"]
${gift_card_input}      xpath://*[@id="giftcardcouponcode"]
${gift_card_btn}        xpath://*[@id="applygiftcardcouponcode"]
${update_cart_btn}      xpath://*[@id="updatecart"]
${continue_shop_btn}    xpath://*[@name="continueshopping"]
${estimate_btn}         xpath://*[@id="open-estimate-shipping-popup"]
${checkout_brn}         xpath://*[@id="checkout"]
${agree_tos_btn}        xpath://*[@id="termsofservice"]

*** Keywords ***
Click Update Shopping Cart Button
    Click Element    ${update_cart_btn}

Click Continue Shopping Button
    Click Element    ${continue_shop_btn}

Click Estimate Shipping Button
    Click Element    ${estimate_btn}

Click Checkout Button
    Click Element    ${checkout_brn}

Click Remove Button
    Click Element    ${remove_btn}

Discount Code Input
    [Arguments]     ${discount_code}
    Input Text      ${discount_input}    ${discount_code}

Click Add Discount Code Button
    Click Element    ${discount_btn}

Gift Card Input
    [Arguments]     ${gift_card}
    Input Text      ${gift_card_input}    ${gift_card}

Click Add Gift Card Button
    Click Element    ${gift_card_btn}

Click Agree To TOS Button
    Click Element    ${agree_tos_btn}
