*** Variables ***
${tblSearchResults}         xpath://div[contains(@class,'StyledGrid')][not(contains(@class,'GridUI'))]
${divFirstElement}          xpath://div[contains(@class,'ColGridItem')][1]
${lblNameFirstElement}      xpath:(//div[contains(@class,'ColGridItem')][1]//span)[1]

*** Keywords ***
Then a screen containing the search results is displayed
    Wait until element is visible       ${tblSearchResults}
    Element should be visible           ${divFirstElement}          
    Element should be visible           ${lblNameFirstElement}
    Capture page screenshot

When I click on the first product from the result list
    Click element       ${lblNameFirstElement}