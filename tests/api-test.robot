*** Settings ***
Library           RequestsLibrary
Library           Collections

Suite Setup       Kirjaudu ja tallenna token

*** Variables ***
${BASE_URL}       http://127.0.0.1:3000/api
${USERNAME}       x345
${PASSWORD}       x1234567

*** Keywords ***
Kirjaudu ja tallenna token
   
    Create Session    api    ${BASE_URL}
    ${payload}=    Create Dictionary    username=${USERNAME}    password=${PASSWORD}
    ${response}=    POST On Session    api    /auth/login    json=${payload}
    Should Be Equal As Integers    ${response.status_code}    200
    ${json}=    Set Variable    ${response.json()}
    ${token}=    Set Variable    Bearer ${json['token']}
    Set Suite Variable    ${token}
    Log    Token haettu ja tallennettu: ${token}

*** Test Cases ***

Hae kaikki merkinnät tokenilla
    ${headers}=    Create Dictionary    Authorization=${token}
    ${response}=    GET On Session    api    /entries    headers=${headers}
    Status Should Be    200    ${response}
    Log    Merkinnät: ${response.json()}

Lisää uusi merkintä tokenilla    
    ${headers}=    Create Dictionary
    ...    Authorization=${token}
    ...    Content-Type=application/json

    ${data}=    Create Dictionary
    ...    entry_date=2025-04-17
    ...    mood=Happy
    ...    energy_level=7
    ...    stress_level=3
    ...    sleep_hours=8
    ...    notes=Testimerkintä Robot Frameworkista
    ...    goals=Syödä terveellisemmin

    ${response}=    POST On Session    api    /entries    headers=${headers}    json=${data}
    Log    Vastauksen status: ${response.status_code}
    Log    Palautettu sisältö: ${response.json()}
    Status Should Be    201    ${response}

