# Tehtävä 1: Asennukset

Tässä tehtävässä kuvataan, kuinka asensin tarvittavat työkalut ja kirjastot terveyspäiväkirja-projektiin.

Tämän tehtävän tavoitteena oli asentaa ja ottaa käyttöön Robot Framework ja siihen liittyvät lisäkirjastot seuraavien ohjeiden mukaisesti:   
🔗 [GitHub: 01. Asennukset](https://github.com/sakluk/projekti-terveyssovelluksen-kehitys/blob/main/ohjeet_testaus/01_asennukset.md)

---

## Asennetut työkalut 

- **Robot Framework** – Testiautomaatioalusta  
- **Browser Library** – Web-sovellusten testaukseen  
- **Requests Library** – REST API -testaamiseen  
- **CryptoLibrary** – Salaustestaukseen  
- **Robotidy** – Koodiformatointiin  

### Asennettu versiot tulos `pip freeze` -komennolla:

- robotframework==7.2.2
- robotframework-assertion-engine==3.0.3
- robotframework-browser==19.4.0
- robotframework-crypto==0.4.2
- robotframework-pythonlibcore==4.4.1
- robotframework-requests==0.9.7
- robotframework-tidy==4.16.0

---

# Tehtävä 2: Kirjautumistesti

Tässä tehtävässä automatisoin kirjautumistestin omalle terveyspäiväkirja-sovellukselleni käyttäen Robot Frameworkia ja Browser-kirjastoa seuraavien ohjeiden mukaisesti:   
🔗 [GitHub: 02. Käyttöliittymän (GUI) testaus](https://github.com/sakluk/projekti-terveyssovelluksen-kehitys/blob/main/ohjeet_testaus/02_gui_testaus.md)

---

## Käytetyt tiedostot

- `resources/Keywords.robot` – sisältää muuttujat `${Username}` ja `$Password`

- `tests/login-test.robot` – varsinainen testitapaus

---

## Saatu tulos

Testi suoritettu onnistuneesti. Alla on kuvankaappaus onnistuneesta testistä:
<div style="border: 1px solid #ccc; padding: 12px; border-radius: 8px; background-color: #f9f9f9; max-width: 640px; margin-bottom: 1rem;">

  <img src="./Images/Näyttökuva%202025-3-28%20kello%2021.50.39.png" alt="Terveyspäiväkirja Login" style="max-width: 100%; border-radius: 4px;" />

  <p style="text-align: center; font-style: italic; color: #666; margin-top: 8px;">
    Kuva 1: Kirjautuminen
  </p>

</div>

---

## Havainnot

- Robot Framework toimii hyvin kirjautumistestissä
- Browser-kirjastossa tulee käyttää `css=` tai `xpath=` valitsimia, ei esim. `class=`

---

# Tehtävä 3: Web Form -elementtien testaus

Tässä tehtävässä testattiin Seleniumin tarjoamaa esimerkkilomaketta: [Web Form](https://www.selenium.dev/selenium/web/web-form.html)

Ohjeistus löytyi samasta oppaasta kuin Tehtävä 2: [GitHub: 02. GUI-testaus](https://github.com/sakluk/projekti-terveyssovelluksen-kehitys/blob/main/ohjeet_testaus/02_gui_testaus.md)

---

## Tavoitteet

- Tekstikenttä, salasanakenttä, tekstialue
- Dropdown (select)
- Datalist
- Tiedoston valinta (file input)
- Checkbox ja radiobutton
- Lomakkeen lähetys ja tarkistus

---

## Käytetyt tiedostot

- `tests/webform-test.robot` – kaikki kentät täyttävä testi
- `resources/testfile.txt` – ladattava testitiedosto

---

## Tulokset

Testi suoritettu onnistuneesti. Alla kuvankaappaus:

<div style="border: 1px solid #ccc; padding: 12px; border-radius: 8px; background-color: #f9f9f9; max-width: 640px; margin-bottom: 1rem;">

  <img src="./Images/Näyttökuva%202025-3-28%20kello%2021.52.53.png" alt="Terveyspäiväkirja Login" style="max-width: 100%; border-radius: 4px;" />

  <p style="text-align: center; font-style: italic; color: #666; margin-top: 8px;">
    Kuva 2: Web-Form
  </p>

</div>



---

## Mahdolliset ongelmat

- Elementtejä, joilla on sama `name`, pitää tarkentaa `id`:n tai `css=`-valitsimien avulla

- Tiedostonsyöttö toimii vain oikealla `Upload File By Selector` -avainsanalla

---


# Tehtävä 4: Päiväkirjamerkinnän lisääminen

Tässä tehtävässä automatisoitiin sovelluksen lomake, jolla käyttäjä lisää uuden päiväkirjamerkinnän.

---

## Tavoitteet

- Täyttää kentät (päivämäärä, mieliala, energiataso, stressitaso, uni, muistiinpanot, tavoitteet)
- Klikata “Save My Entry” -painiketta
- Tarkistaa, että popup ilmestyy

---

## Tiedostot

- `resources/entry_data.robot` – muuttujat syötettävistä kentistä
- `tests/new-entry-test.robot` – testi päiväkirjamerkinnän tekemiseksi
  
---

## Tulokset

Testi meni läpi onnistuneesti ja yhteenvetopopup ilmestyi:

<div style="border: 1px solid #ccc; padding: 12px; border-radius: 8px; background-color: #f9f9f9; max-width: 640px; margin-bottom: 1rem;">

  <img src="./Images/Näyttökuva%202025-3-28%20kello%2022.13.33.png" alt="Terveyspäiväkirja Login" style="max-width: 100%; border-radius: 4px;" />

  <p style="text-align: center; font-style: italic; color: #666; margin-top: 8px;">
    Kuva 3: Päiväkirjamerkintä
  </p>

</div>


---

## Huomiot

- HTML-elementtien `id`-kentät toimivat hyvin valitsimina (`id=entry_date` jne.)
- `css=input.createEntry` painikkeen klikkaus toimii testin lopuksi
- Popupin otsikko `"Your Diary Summary"` toimi hyvin varmistuksena.

---


# Tehtävä 5: Ympäristömuuttujien (.env) käyttö kirjautumistestissä

Tässä tehtävässä toteutettiin kirjautumistesti, jossa käyttäjätunnus ja salasana haettiin `.env`-tiedostosta. Testi suoritettiin seuraavien ohjeiden mukaisesti: [GitHub: 03. Tietojen salaus ja piilottaminen](https://github.com/sakluk/projekti-terveyssovelluksen-kehitys/blob/main/ohjeet_testaus/03_tietojen_salaus_ja_piilottaminen.md)

## Tavoitteet
- Parantaa tietoturvaa
- Piilottaa arkaluontoiset tiedot, kuten käyttäjätunnuksen ja salasanan.
- Ladata tiedot `.env`-tiedostosta `python-dotenv`-kirjaston avulla
- Hyödyntää arvoja Robot Framework -testissä.


## Toteus
`.env`-tiedosto sijoitettiin hakemistoon `Diary-BE-2025-main/.env` ja tiedostossa määriteltiin seuraavat muuttujat:

```env
USERNAME= username
PASSWORD=password
BASE_URL=http://127.0.0.1:3001/Diary-FE-2025-main/vite-project/src/html
```

Muuttujat ladattiin load_env.py-tiedoston kautta:

```python
import os
from dotenv import load_dotenv

load_dotenv(dotenv_path="Diary-BE-2025-main/.env")

USERNAME = os.getenv("USERNAME")
PASSWORD = os.getenv("PASSWORD")
BASE_URL = os.getenv("BASE_URL")
```
Robot Framework -testissä käytettiin seuraavat muuttujat:

```python
*** Settings ***
Variables   ../load_env.py

Type Text     id=login-username    ${USERNAME}
Type Secret   id=login-pass        $PASSWORD
```

Testi suoritettiin komennolla:
```robot
robot -d outputs tests/login-test.robot
```


## Lopputulos

Testi suoritettu onnistuneesti. Käyttäjätunnus ja salasana haettiin `.env` -tiedostosta, eikä tietoja kirjoitettu suoraan testikoodiin..
- [Testiloki (log.html)](https://sheepland.github.io/Terveyspaivakirja-2025/outputs/log.html)
- [Testiraportti (report.html)](https://sheepland.github.io/Terveyspaivakirja-2025/outputs/report.html)

## Käytetyt tiedostojen linkit

- [login-test.robot](https://github.com/SHEEPLAND/Terveyspaivakirja-2025/blob/main/tests/login-test.robot) 
- [load_env.py](https://github.com/SHEEPLAND/Terveyspaivakirja-2025/blob/main/load_env.py)  
- [.env](https://github.com/SHEEPLAND/Terveyspaivakirja-2025/blob/main/Diary-BE-2025-main/.env) – (ei näkyvissä julkisesti)


# Tehtävä 6: Tietojen salaaminen CryptoLibraryn avulla

Tässä tehtävässä salattiin käyttäjätunnus ja salasana käyttäen `CryptoLibrary`-kirjastoa. Testi suoritettiin seuraavien ohjeiden mukaisesti:  
🔗 [GitHub: 03. Tietojen salaus ja piilottaminen](https://github.com/sakluk/projekti-terveyssovelluksen-kehitys/blob/main/ohjeet_testaus/03_tietojen_salaus_ja_piilottaminen.md)

## Kirjastot ja työkalut

Tehtävässä käytetyt seuraavat kirjastot ja työkalut:

- CryptoLibrary asennettiin:
```bash
pip install robotframework-crypto
```
- Salausavaimet luotiin komennolla:
```bash
python -m CryptoLibrary 
```

- Tiedot salattiin työkalulla:
```bash
python -m CryptoClient
```


## Toteus
Testissä käytettiin seuraavaa kokoonpanoa:

```python
*** Settings ***
Library     Browser              auto_closing_level=SUITE
Library     CryptoLibrary        variable_decryption=True

*** Variables ***
${Username}    crypt:...     # salattu käyttäjätunnus
${Password}    crypt:...     # salattu salasana
${Message}     Hello, Robot Framework!How are you today?
${BaseUrl}     http://127.0.0.1:3001/Diary-FE-2025-main/vite-project/src/html

Login With Encrypted Credentials
    New Browser    chromium    headless=No
    New Page       ${BaseUrl}/login.html
    Type Text      id=login-username    ${Username}
    Type Secret    id=login-pass        $Password
    Click          css=.login-button
    Sleep          2 s
```


## Lopputulos
Testi suoritettu onnistuneesti.
- Salatut muuttujat alkoivat muodossa crypt:...
- Lokitiedoston tiedot näkyvät muodossa ***, eikä arkaluonteisia tietoja ole vuotanut.
  
- [login-test.robot](https://github.com/SHEEPLAND/Terveyspaivakirja-2025/blob/main/tests/login-test.robot)
- [Testiloki (log.html)](https://sheepland.github.io/Terveyspaivakirja-2025/outputs/log.html)
- [Testiraportti (report.html)](https://sheepland.github.io/Terveyspaivakirja-2025/outputs/report.html)

# Tehtävä 7: Raportit ja lokitiedostot
Tässä tehtävässä tutustuttiin Robot Frameworkin tuottamiin raportti- ja lokitiedostoihin. Tiedostot ohjattiin erilliseen `outputs/`-kansioon testiajon yhteydessä. Tehtävä suoritettiin seuraavien ohjeiden mukaisesti:  
🔗 [GitHub: 04. Raportit ja lokitiedostot](https://github.com/sakluk/projekti-terveyssovelluksen-kehitys/blob/main/ohjeet_testaus/04_raportit_ja_lokitiedostot.md)

## Tavoitteet

- Ohjata testitulokset omaan kansioon
- Ymmärtää mitä tiedostot `log.html`, `report.html` ja `output.xml` sisältävät
- Tarkastella raportteja selaimessa testiajon jälkeen

---
## Toteus
Testit suoritettiin seuraavalla komennolla:

```bash
robot -d outputs tests/login-test.robot
```

Tamän komento:
- Suorittaa testitiedoston `login-test.robot` ja tallenta tulokset `outputs/` hakemistoon seuraavasti:
    - log.html – yksityiskohtainen loki
    - report.html – visuaalinen yhteenveto
    - output.xml – koneluettava testitulos

## Lopputulos
Testi suoritettu onnistuneesti ja kaikki tiedostot löytyyvät `outputs/` kansiosta.

- [Testiloki (log.html)](https://sheepland.github.io/Terveyspaivakirja-2025/outputs/log.html)
- [Testiraportti (report.html)](https://sheepland.github.io/Terveyspaivakirja-2025/outputs/report.html)


# Tehtävä 8: GitHub Pages -julkaisu

Tässä tehtävässä julkaistiin Robot Frameworkin tuottamat log.html- ja report.html-tiedostot GitHub Pagesin kautta, jotta testitulokset näkyvät muille käyttäjille suoraan selaimessa.

Tehtävä suoritettiin seuraavien ohjeiden mukaisesti:  
🔗 [GitHub: 04. Raportit ja lokitiedostot](https://github.com/sakluk/projekti-terveyssovelluksen-kehitys/blob/main/ohjeet_testaus/04_raportit_ja_lokitiedostot.md)

## Tavoitteet

- Julkaista log.html ja report.html GitHub Pagesin kautta
- Mahdollistaa testitulosten katsominen suoraan selaimessa

## Toteutus

1. Lisättiin outputs/-kansio GitHubiin

2. Aktivointiin GitHub Pages:
- Settings → Pages
- Source: main branch, / (root) kansio

3. Odotettiin hetki, kunnes julkinen osoite oli käytettävissä:
- [GitHub Sivu](https://sheepland.github.io/Terveyspaivakirja-2025/)

## Lopputulos
Testiraportit näkyvät julkisesti GitHub Pages -sivulla:

- [Testiloki (log.html)](https://sheepland.github.io/Terveyspaivakirja-2025/outputs/log.html)
- [Testiraportti (report.html)](https://sheepland.github.io/Terveyspaivakirja-2025/outputs/report.html)


# Tehtävä 9: Taustapalvelimen toimintaa testaminen

Tämän tehtävän tarkoituksena oli testata oman taustapalvelimen toimivuutta automaattisten testien avulla. Testauksessa käytettiin Robot Frameworkia ja omaa yksilöprojektin REST-rajapintaa. 

Tehtävä suoritettiin seuraavien ohjeiden mukaisesti:  
🔗 [GitHub: 05. Taustapalvelimen testaus](https://github.com/sakluk/projekti-terveyssovelluksen-kehitys/blob/main/ohjeet_testaus/05_taustapalvelimen_testaus.md)

## Tavoitteet
- Tavoitteena oli testata, että palvelin toimii oikein
- Tarkistaa, että kirjautuminen ja tokenin käyttö onnistuvat
-  Tarkistaa, että API perustoiminnot toimivat 

## Kirjastot ja työkalut
- **Robot Framework** - Testien automatisointi
- **Requests Lbrary** - HTTP-pyyntöjen lähettäminen

## Toteutus
Testit kirjoitettiin tiedostoon `api-test.robot`ja testasivat seuraavia asioita:
1. Kirjautuminen (POST /auth/login)
2. Merkintöjen hakeminen (GET /entries)
3. Uuden merkinnän lisääminen (POST /entries)

```python
*** Settings ***
Library           RequestsLibrary
Library           Collections

Suite Setup       Kirjaudu ja tallenna token

*** Variables ***
${BASE_URL}       http://127.0.0.1:3000/api
${USERNAME}       x345
${PASSWORD}       salasana

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

```

## Testin suorittamisen vaiheet
1. Aktivoi virtuaaliympäristö
    ```bash
    source .venv/bin/activate
    ```

2. Suorita testit:
    ```bash
    robot -d outputs tests/api-test.robot
    ```

## Lopputulos

Testiraportit näkyvät julkisesti GitHub Pages -sivulla:

- [Testiloki (log.html)](https://sheepland.github.io/Terveyspaivakirja-2025/outputs/log.html)

- [Testiraportti (report.html)](https://sheepland.github.io/Terveyspaivakirja-2025/report/log.html)


## Tekoälyn käyttö
Tässä tehtävässä tekoälyä on käytetty virheiden tunnistamiseen, korjaamiseen ja dokumentaation luettavuuden parantamiseen.
