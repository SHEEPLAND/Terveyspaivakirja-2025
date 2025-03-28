*** Settings ***
Library    Browser    auto_closing_level=KEEP

*** Test Cases ***
Test Web Form Elements
    New Browser    chromium    headless=No
    New Page       https://www.selenium.dev/selenium/web/web-form.html
    Get Title      ==    Web form

    # Dropdown (select)
    Select Options By    css=select[name="my-select"]    value    2

    # Datalist
    Type Text    css=input[name="my-datalist"]    New York

    # File input (tiedoston syöttö)
    Upload File By Selector    css=input[name="my-file"]    ${CURDIR}/../resources/testfile.txt

    # Checkbox
    Click    css=input[id="my-check-1"]

    # Radiobutton
    Click    css=input[id="my-radio-1"]

    # Lähetä lomake
    Click With Options    css=button    delay=2 s

    # Tarkista onnistunut lähetys
    Get Text       id=message    ==    Received!
