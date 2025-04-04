*** Settings ***
Library     Browser              auto_closing_level=SUITE
Library     CryptoLibrary        variable_decryption=True


*** Variables ***
${Username}    crypt:...    # 
${Password}    crypt:...     # 
${Message}     Hello, Robot Framework!\nHow are you today?
${BaseUrl}     http://127.0.0.1:3001/Diary-FE-2025-main/vite-project/src/html

*** Test Cases ***
Login To Health Diary With Encrypted Vars
    New Browser    chromium    headless=No
    New Page       ${BaseUrl}/login.html

    Get Title      ==    Login Form
    Type Text      id=login-username    ${Username}      delay=0.2 s
    Type Secret    id=login-pass        $Password        delay=0.2 s
    Click          css=.login-button

    Sleep          2 s
