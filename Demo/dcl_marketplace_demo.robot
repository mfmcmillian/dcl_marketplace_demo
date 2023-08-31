*** Settings ***
Library    Selenium2Library

*** Variables ***
${BROWSER}       Chrome
${URL}           https://market.decentraland.org/
${browser_smart_wearables_exit}   //div[contains(@class, 'dcl') and contains(@class, 'modal-navigation-button') and contains(@class, 'modal-navigation-close')]
${collections_button}   //div[contains(@class, 'dcl') and contains(@class, 'tab') and text()='Collectibles']
${search_bar}    //input[@placeholder='Search' and @type='text']
${radio_button}      //div[contains(@class, 'ui radio checkbox') and text()='flex']
${upper_body}     //div[@class='content' and text()='Upper Body']


*** Test Cases ***
Navigate to My Profile
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    # Wait for the elements to be visible before interacting with them
    Wait Until Element Is Visible    ${browser_smart_wearables_exit}
    Click Element    ${browser_smart_wearables_exit}

    Wait Until Element Is Visible    ${collections_button}
    Click Element    ${collections_button}

    Wait Until Element Is Visible    ${search_bar}
    Input Text    ${search_bar}    Antrom

    ${count}    Get Matching XPath Count    //*[@id="root"]/div[3]/div/div/div[2]/div[2]/div/div
    Log    Number of Antrom Wearables: ${count}

    Close Browser








