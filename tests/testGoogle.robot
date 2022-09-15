*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library           SeleniumLibrary
Suite Setup       Open Browser and Maximize Browser Window
Suite Teardown    Close Browser

*** Variables ***
${URL}              https://www.google.com/
${BROWSER}          chrome
${search_form}      xpath=//form[@action='/search']
${search_input}     xpath=//input[@name='q']
${search_value}     Robot Framework
${search_result}    xpath=//a[@href="https://robotframework.org/"]

*** Test Cases ***
Google Search
    Wait Until Element Is Visible   ${search_input}
    Input Text    ${search_input}   ${search_value}
    Submit Form
    Wait Until Element Is Visible   ${search_result}
    Element Should Be Visible   ${search_result}
    Click Element   ${search_result}

*** Keywords ***
Open Browser and Maximize Browser Window
    Open Browser  ${URL}      ${BROWSER}
    Maximize Browser Window