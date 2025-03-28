*** Settings ***
Library     Browser    auto_closing_level=KEEP
Resource    ../resources/Keywords.robot

*** Test Cases ***
Login To Health Diary
    New Browser    chromium    headless=No
    New Page    http://127.0.0.1:3001/Diary-FE-2025-main/vite-project/src/html/login.html

    # Sivun otsikko
    Get Title      ==    Login Form

    # Käyttäjätunnus ja salasana
    Type Text    id=login-username    ${Username}      delay=0.2 s
    Type Secret  id=login-pass        $Password        delay=0.2 s

    # Klikkaa kirjautumisnappia
    Click    css=.login-button


    Sleep    2 s



