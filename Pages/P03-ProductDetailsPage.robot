*** Variables ***
${imgProductPicture}        xpath://div[contains(@class,'WrapperItem')]//div[contains(@class,'WrapperImages')]//picture/img
${lblProductFullName}       xpath://div[contains(@class,'ProductInfo')]//span[contains(@class,'Title')]
${lblProductDescription}    xpath://div[contains(@class,'ProductInfo')]//span[contains(@class,'description-text')]
${lblProductPrice}          xpath://div[contains(@class,'BestPrice')]
${btnAddToCart}             id:buy-button

*** Keywords ***
Then a screen containing the product details is displayed
    Wait until element is visible       ${imgProductPicture}
    Element should be visible           ${lblProductFullName}
    ${productFullName}      Get text    ${lblProductFullName}
    Set test variable       ${productFullName}
    Element should be visible           ${lblProductDescription}
    ${productDescription}   Get text    ${lblProductDescription}
    Set test variable       ${productDescription}
    Element should be visible           ${lblProductPrice}
    ${productPrice}         Get text    ${lblProductPrice}
    Set test variable       ${productPrice}
    Element text should be              ${btnAddToCart}         comprar

When I click on the button labeled comprar on product detail screen
    Click element       ${btnAddToCart}