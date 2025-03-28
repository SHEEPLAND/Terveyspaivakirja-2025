*** Settings ***
Library    Browser    auto_closing_level=KEEP
Resource   ../resources/entry_data.robot

*** Test Cases ***
Lisää uusi päiväkirjamerkintä
    New Browser    chromium    headless=No
    New Page       http://127.0.0.1:3001/Diary-FE-2025-main/vite-project/src/html/diary-page.html
    Get Title      ==    Päiväkirja

    # Täytä lomake
    Type Text    id=entry_date       ${DATE}
    Type Text    id=mood             ${MOOD}
    Type Text    id=energy_level     ${ENERGY}
    Type Text    id=stress_level     ${STRESS}
    Type Text    id=sleep_hours      ${SLEEP}
    Type Text    id=notes            ${NOTES}
    Type Text    id=goals            ${GOALS}

    # Klikkaa tallenna-painiketta
    Click    css=input.createEntry

    Sleep    2s  # odotetaan, että popup tai vahvistus ilmestyy

    # Tarkista, että popup näkyy
    Get Text    css=h2    ==    Your Diary Summary
