*** Settings ***
Resource        ../Common/TestSettings.robot

*** Variables ***
${imgLogoAmericanas}        id:brd-link
${txtSearchYourProduct}     id:h_search-input
${btnGoogles}               id:h_search-btn

*** Keywords ***
Given that I am in Americanas home page
    Go to           ${mainURL}
    Wait until element is visible       ${imgLogoAmericanas}
    Element should be visible           ${txtSearchYourProduct}
    Capture page screenshot

When I search for a product using the word "${wordToSearch}"
    Input text      ${txtSearchYourProduct}     ${wordToSearch}
    Click element   ${btnGoogles}