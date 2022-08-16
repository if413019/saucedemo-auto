*** Settings ***
Library     Selenium2Library

*** Variables ***
${TITLE}            class:title
${MENU_CART}        class:shopping_cart_link
${CART_BADGE}       class:shopping_cart_badge
${OPTION_SORT}      class:product_sort_container
${PRODUCT}          class:inventory_item
${PRODUCT_NAME}     class:inventory_item_name
${PRODUCT_DESC}     class:inventory_item_desc
${PRODUCT_PRICE}    class:inventory_item_price
${PRODUCT_DESC}     class:inventory_item_desc

*** Keywords ***
Wait until inventory page successfully loaded
    [Documentation]  Verify required elements are displayed in inventory page
    wait until element is visible    ${MENU_CART}
    wait until element is visible    ${OPTION_SORT}
    element text should be           ${TITLE}  PRODUCTS
    wait until element is visible    ${PRODUCT}
    ${count}    get element count    ${PRODUCT}
    should be true  ${count} > 0

Sort products by ${sort_strategy}
    [Documentation]  Select and apply sort-strategy in inventory page
    select from list by value        ${OPTION_SORT}  ${sort_strategy}
    wait until inventory page successfully loaded
    ${selected_strategy}  Get Selected List Value    ${OPTION_SORT}
    should be equal  ${sort_strategy}  ${selected_strategy}
    IF  "${sort_strategy}" == "lohi"
        Verify product sorted by price ascending
    ELSE IF  "${sort_strategy}" == "hilo"
        Verify product sorted by price descending
    ELSE
        Fail  unknown login scenario: ${scenario}
    END

Verify product sorted by price ascending
    [Documentation]  verify product displayed has been sorted by price asc
    ${prices}      Get WebElements    ${PRODUCT_PRICE}
    ${current_price}  Set Variable  0
    FOR    ${price}    IN    @{prices}
        ${price}    get_float_value_of_currency  ${price.text}
        should be true  ${price} >= ${current_price}
    END

Verify product sorted by price descending
    [Documentation]  verify product displayed has been sorted by price desc
    ${prices}      Get WebElements    ${PRODUCT_PRICE}
    ${current_price}  get_float_value_of_currency  ${prices[0].text}
    FOR    ${price}    IN    @{prices}
        ${price}    get_float_value_of_currency  ${price.text}
        should be true  ${price} <= ${current_price}
    END
