*** Variables ***
${lblHeaderExtendedWarranty}            xpath://h1
${lblSubHeaderExtendedWarranty}         xpath://div[@class='service-flow--title']//p
${btnContinue}                          id:btn-continue

*** Keywords ***
When I click on continuar button on extended warranty screen
    Click element           ${btnContinue}

Then I should see a screen containing information about extended warranty is displayed
    Wait until element is visible       ${lblHeaderExtendedWarranty}
    Element text should be              ${lblHeaderExtendedWarranty}            Agora que você já escolheu seu produto, saiba como protegê-lo por mais tempo.
    Element text should be              ${lblSubHeaderExtendedWarranty}         A contratação de seguros é opcional
    Element text should be              ${btnContinue}                          continuar
    Capture page screenshot