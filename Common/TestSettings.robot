*** Settings ***
Library         Selenium2Library

*** Variables ***
${mainURL}                  https://www.americanas.com
${browser}                  Chrome

*** Keywords ***
Open web browser
    ${chromeOptions}                Evaluate                    sys.modules['selenium.webdriver'].ChromeOptions()           sys, selenium.webdriver
    Call method                     ${chromeOptions}            add_argument                    --start-maximized
    Create webdriver                ${browser}                  chrome_options=${chromeOptions}
    Set selenium speed              0.3 seconds
    Set selenium implicit wait      15 seconds