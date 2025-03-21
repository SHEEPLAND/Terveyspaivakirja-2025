# Päiväkirja 2025 - Insightly
Päiväkirja 2025 on moderni päiväkirjasovellus, joka auttaa käyttäjiä seuraamaan hyvinvointiaan yksinkertaisella ja intuitiivisella tavalla. Sovellus mahdollistaa käyttäjien mielialan, energiatasojen, unen ja stressin seurannan. Tämän avulla käyttäjä voi havaita elämänsä trendejä ja parantaa arkeaan tietoisten päätösten avulla.  

Sovellus on toteutettu **englanniksi**, ja se koostuu **front-endista (käyttöliittymä) ja back-endista (palvelin ja tietokanta)**, jotka toimivat yhdessä tarjoten sujuvan käyttökokemuksen.

##  Kuvakaappaukset

1. **Etusivu**  
    ![Kuvateksti](./img/Näyttökuva%202025-3-11%20kello%201.38.23.png)
    ![Kuvateksti](./img/Näyttökuva%202025-3-11%20kello%201.38.43.png)


2. **Kirjautuminen** 
    ![Kuvateksti](./img/Näyttökuva%202025-3-11%20kello%201.35.24.png)


3. **Rekisteröinti**
    ![Kuvateksti](./img/Näyttökuva%202025-3-12%20kello%2014.31.02.png)


4. **Päiväkirjanäkymä**

    ![Kuvateksti](./img/Näyttökuva%202025-3-11%20kello%201.37.49.png)

    ![Kuvateksti](./img/Näyttökuva%202025-3-12%20kello%2014.26.11.png)


5. **Lisää vinkkejä- sivu**

    ![Kuvateksti](./img/Näyttökuva%202025-3-12%20kello%2014.27.49.png)

    ![Kuvateksti](./img/Näyttökuva%202025-3-12%20kello%2014.29.27.png)
    ![Kuvateksti](./img/Näyttökuva%202025-3-12%20kello%2014.29.08.png)


## Repository-linkit
- **Frontend:** [https://github.com/SHEEPLAND/Diary-FE-2025](https://github.com/SHEEPLAND/Diary-FE-2025)
- **Backend:**  [https://github.com/SHEEPLAND/Diary-BE-2025](https://github.com/SHEEPLAND/Diary-BE-2025)


## Palvelin & Tietokanta
- Node.js + Express.js – Palvelimen ja API-reittien hallintaan.

- MariaDB – Tietokanta käyttäjä- ja päiväkirjatietojen tallentamiseen.

- JWT (jsonwebtoken) – Käyttäjän autentikointi (rekisteröinti & kirjautuminen).

- Bcrypt.js – Salasanojen salaaminen ennen tallennusta.
- Cors – Turvallisuuden parantaminen

## Frontend (Käyttöliittymä)
- Vite.js – Kevyt kehitysympäristö ja build-työkalu

- Vanilla JavaScript – Frontendin toiminnallisuuden toteuttaminen ilman frameworkia

- CSS – Responsiivinen ulkoasu

- Fetch API – HTTP-pyyntöjen lähettäminen backendille

- Google Fonts – Fonttien (Lora & Montserrat) käyttöönotto

## Tietokannan rakenne (MariaDB)

### Users Taulu
![Kuvateksti](./img/Näyttökuva%202025-3-11%20kello%201.33.59.png)

### Entries Taulu
![Kuvateksti](./img/Näyttökuva%202025-3-11%20kello%201.34.10.png)


## API-endpointit
- Autentikointi

1. POST /api/auth/register - Rekisteröi uusi käyttäjä
2. POST /api/auth/login - Kirjaudu sisään ja saa token.

- Käyttäjät
1. GET /api/users/ - Hae kaikki käyttäjät 
2. GET /api/users/:id - Hae käyttäjä ID:llä

- Päiväkirjamerkinnät
1. POST /api/entries/ - Luo uusi merkintä
2. GET /api/entries/ - Hae kaikki merkinnät 
3. PUT /api/entries/:id - Päivitä merkintä
4. DELETE /api/entries/:id - Poista merkintä

## Ominaisuudet

- Käyttäjäautentikointi (rekisteröinti, kirjautuminen)
- Suojattu salasanojen käsittely
- Päiväkirjamerkintöjen hallinta 
- Itsehoitovinkit ja tilastot
- Responsiivinen käyttöliittymä

## Tiedossa olevat bugit

- Joillakin laitteilla CSS-tyylit eivät skaalaudu oikein.

- API:n virheenkäsittelyä voidaan kehittää.

