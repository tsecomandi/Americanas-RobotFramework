*** Settings ***
Resource        P01-HomePage.robot
Resource        P02-SearchResultsPage.robot
Resource        P03-ProductDetailsPage.robot
Resource        P04-ExtendedWarrantyPage.robot

*** Variables ***
${lblHeaderShoppingCart}        css:.page-title
${tblProductList}               css:.basket-products
${lblProductNameShoppingCart}   css:.basket-productTitle
${lblProductPriceShoppingCart}  css:.basket-productPrice
${btnContinueShoppingCart}      id:buy-button
${btnRemoveItem}                css:.basket-productRemoveAct
${tblEmptyShoppingCart}         css:.basket-empty
${lblEmptyShoppingCart}         xpath://section[contains(@class,'basket-empty')]//h2

*** Keywords ***
Then I should see my shopping cart with the item listed in it
    Wait until page contains element    ${lblHeaderShoppingCart}
    Element text should be              ${lblHeaderShoppingCart}        minha cesta
    Element should be visible           ${tblProductList}
    Element should be visible           ${lblProductNameShoppingCart}
    ${productFullNameObtained}          Get text        ${lblProductNameShoppingCart}
    Should be true      '${productFullName}' == '${productFullNameObtained}'
    Element should be visible           ${lblProductPriceShoppingCart}
    ${productPriceObtained}             Get text        ${lblProductPriceShoppingCart}
    Should be true      '${productPrice}' == '${productPriceObtained}'
    Element should be visible           ${btnRemoveItem}
    Element text should be              ${btnContinueShoppingCart}      continuar
    Capture page screenshot

Given that I have an Item in my shopping cart
    Given that I am in Americanas home page
	When I search for a product using the word "Galaxy"
	Then a screen containing the search results is displayed
	When I click on the first product from the result list
	Then a screen containing the product details is displayed
	When I click on the button labeled comprar on product detail screen
	Then I should see a screen containing information about extended warranty is displayed
	When I click on continuar button on extended warranty screen
	Then I should see my shopping cart with the item listed in it

When I click on the button labeled remover on the desired item
    Click element       ${btnRemoveItem}

Then I should see an empty shopping cart
    Wait until element is visible       ${tblEmptyShoppingCart}
    Element text should be              ${lblEmptyShoppingCart}     sua cesta está vazia
    Capture page screenshot