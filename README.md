# Tehtävä 1: Asennukset

Tässä tehtävässä kuvataan, kuinka asensin tarvittavat työkalut ja kirjastot terveyspäiväkirja-projektiin.

Tämän tehtävän tavoitteena oli asentaa ja ottaa käyttöön Robot Framework ja siihen liittyvät lisäkirjastot seuraavien ohjeiden mukaisesti:   [GitHub: 01. Asennukset](https://github.com/sakluk/projekti-terveyssovelluksen-kehitys/blob/main/ohjeet_testaus/01_asennukset.md)

---

## Asennetut työkalut

- **Robot Framework** – Testiautomaatioalusta  
- **Browser Library** – Web-sovellusten testaukseen  
- **Requests Library** – REST API -testaamiseen  
- **CryptoLibrary** – Salaustestaukseen  
- **Robotidy** – Koodiformatointiin  

### Saatu tulos

![Asennustulokset](./Images/asennus.png)

---

# Tehtävä 2: Kirjautumistesti

Tässä tehtävässä automatisoin kirjautumistestin omalle terveyspäiväkirja-sovellukselleni käyttäen Robot Frameworkia ja Browser-kirjastoa. [GitHub: 02. Käyttöliittymän (GUI) testaus](https://github.com/sakluk/projekti-terveyssovelluksen-kehitys/blob/main/ohjeet_testaus/02_gui_testaus.md)

---

## Käytetyt tiedostot

- `resources/Keywords.robot` – sisältää muuttujat `${Username}` ja `$Password`

- `tests/login-test.robot` – varsinainen testitapaus

---

## Saatu tulos

Testi suoritettu onnistuneesti. Alla on kuvankaappaus onnistuneesta testistä:

![Terveyspäiväkirja Login](./Images/Näyttökuva%202025-3-28%20kello%2021.50.39.png)

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

![Web-Form](./Images/Näyttökuva%202025-3-28%20kello%2021.52.53.png)

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

![Päiväkirjamerkintä](./Images/Näyttökuva%202025-3-28%20kello%2022.13.33.png)

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
  
https://sheepland.github.io/Terveyspaivakirja-2025/outputs/report.html


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
- [Testiloki](http://127.0.0.1:3001/outputs/log.html)
- [Testiraportti](http://127.0.0.1:3001/outputs/report.html)


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

- [Testiloki](http://127.0.0.1:3001/outputs/log.html)
- [Testiraportti](http://127.0.0.1:3001/outputs/report.html)



## Tekoälyn käyttö
Tässä tehtävässä tekoälyä on käytetty virheiden tunnistamiseen, korjaamiseen ja dokumentaation luettavuuden parantamiseen.
