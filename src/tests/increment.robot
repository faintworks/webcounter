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
    Go To  ${HOME_URL}
    Click Button  Paina
    Click Button  Paina
    Page Should Contain  nappia painettu 2 kertaa

When counter has a nonzero value and it is reset the value becomes zero
    Go To  ${HOME_URL}
    Page Should Contain  nappia painettu 2 kertaa
    Click Button  Nollaa
    Page Should Contain  nappia painettu 0 kertaa

When counter is set to a specific value
    Go To  ${HOME_URL}
    Input Text  new_value  5
    Click Button  Aseta
    Page Should Contain  nappia painettu 5 kertaa