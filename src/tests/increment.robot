*** Settings ***
Resource  resource.robot
Suite Setup  Open And Configure Browser
Suite Teardown  Close Browser

*** Test Cases ***
At start the counter is zero
    Go To  ${HOME_URL}
    Title Should Be  Laskuri
    Page Should Contain  nappia painettu 0 kertaa

When button pressed twice the counter is two
    Reset Counter  # Nollaa laskuri ennen testiä
    Page Should Contain  nappia painettu 0 kertaa
    Click Button  Paina
    Click Button  Paina
    Page Should Contain  nappia painettu 2 kertaa

When counter has a nonzero value and it is reset the value becomes zero
    Reset Counter  # Nollaa laskuri ennen testiä
    Page Should Contain  nappia painettu 0 kertaa
    Click Button  Paina
    Click Button  Paina
    Page Should Contain  nappia painettu 2 kertaa
    Click Button  Nollaa
    Page Should Contain  nappia painettu 0 kertaa

When counter is set to a specific value
    Reset Counter  # Nollaa laskuri ennen testiä
    Page Should Contain  nappia painettu 0 kertaa
    Input Text  new_value  5
    Click Button  Aseta
    Page Should Contain  nappia painettu 5 kertaa

*** Keywords ***
Reset Counter
    Go To  ${HOME_URL}
    Click Button  Nollaa