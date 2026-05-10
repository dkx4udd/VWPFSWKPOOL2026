# Requirements Document: FIFA World Cup 2026 Pool App

## 1. Projectoverzicht
Een interactieve webapplicatie waarmee gebruikers een pool kunnen organiseren voor het WK 2026. De app focust op gebruiksvriendelijkheid, een vrolijke voetbaluitstraling en competitie tussen deelnemers.

## 2. Visuele Identiteit (Brand System)
- **Stijl:** Modern, energiek en vrolijk.
- **Kleurenpalet:** Geïnspireerd door de FIFA World Cup 2026 host city branding (paars, roze, teal en wit).
- **Typografie:** Lexend (voor optimale leesbaarheid en een moderne sportuitstraling).
- **Vormgeving:** Ronde hoeken (8px), gebruik van geometrische patronen en officiële FIFA-stijlelementen.

## 3. Functionele Requirements

### 3.1 Gebruikersbeheer & Dashboard
- **Dashboard:** Persoonlijk overzicht voor de gebruiker met:
    - Actuele globale ranglijst en totaal aantal behaalde punten.
    - Directe toegang tot 'Live' wedstrijden en de mogelijkheid om voorspellingen aan te passen.
    - Top 5 spelers van het klassement.
- **Navigatie:** Een vaste navigatiebalk (onderaan op mobiel, boven/onder op desktop) voor snelle toegang tot Home, Voorspellen, Ranks en Wedstrijden.

### 3.2 Voorspellingen Systeem
- **Invullen scores:** Gebruikers moeten de eindstand per wedstrijd kunnen voorspellen.
- **Opslaan:** Een intuïtieve 'Opslaan' of 'Quick Save' functie per wedstrijd.
- **Voortgang:** Een visuele indicatie (progress bar) die laat zien hoeveel voorspellingen van de huidige ronde al zijn ingevuld (bijv. 6/10).
- **Validatie:** Voorspellingen kunnen alleen worden aangepast tot aan het begin van de betreffende wedstrijd.

### 3.3 Klassement & Standen
- **Top 3 Podium:** Visuele weergave van de nummers 1, 2 en 3 met profielfoto's en badges.
- **Volledige Ranglijst:** Tabel met positie, naam, aantal correcte voorspellingen en totale punten.
- **Zoeken/Filteren:** Mogelijkheid om jezelf terug te vinden in de lijst en te filteren op specifieke rondes of groepen.

### 3.4 Wedstrijdschema & Uitslagen
- **Live Updates:** Weergave van live scores met statusindicatie (bijv. "74' minuut").
- **Groepsfase vs. Knock-out:** Duidelijk onderscheid tussen verschillende toernoofasen.
- **Filteropties:** Filteren op 'Alle wedstrijden', 'Groepsfase' of 'Knock-out fase'.

## 4. Technische & Design Requirements
- **Responsive Design:** De applicatie moet naadloos werken op Desktop en Mobile.
- **Interacties:** Gebruik van micro-interacties (bijv. hover-states op knoppen, schalen van kaarten bij interactie) om de sportbeleving te versterken.
- **Consistentie:** Alle schermen moeten gebruikmaken van de gedeelde 'World Cup 2026' componentenbibliotheek (TopAppBar, BottomNavBar, MatchCards).

## 5. Gebruikersflows
1. **Inloggen/Dashboard:** Gebruiker landt op het dashboard en ziet direct zijn status.
2. **Voorspellen:** Gebruiker navigeert naar 'Predict', vult scores in en slaat deze op.
3. **Controleren:** Gebruiker bekijkt het klassement om zijn positie te vergelijken met vrienden.
4. **Wedstrijddag:** Gebruiker volgt live uitslagen via het wedstrijdschema.
