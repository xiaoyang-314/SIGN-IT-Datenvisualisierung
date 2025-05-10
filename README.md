# SIGN-IT Datenvisualisierung

Dieses Projekt enthält verschiedene Auswertungen und interaktive Visualisierungen auf Basis von TEI-XML-Daten der SIGN-IT-Initiative. Die Visualisierungen wurden ausschließlich mit X-Technologien (XQuery, XPath, D3.js) und Webstandards (HTML, CSS, JavaScript) umgesetzt.

## 🔧 Technologien

- **XQuery / XPath** – zum Extrahieren und Auswerten von XML-Daten
- **D3.js** – zur Darstellung der Daten als interaktive Diagramme
- **Leaflet.js** – zur Kartendarstellung von Fundorten
- **HTML/CSS/JS** – als Frontend-Basis

## 📁 Projektstruktur

- `index.html` – Startseite mit Verlinkungen auf alle Visualisierungen
- `width.html` – Balkendiagramm zu `<width unit="cm">`, sortiert, mit Durchschnitt & Modalwert
- `bezel.html` – Torten-/Balkendiagramm zu `<decoNote ana="bezel">` (leer/gefüllt/execution/fehlend)
- `texttype.html` – Balkendiagramm zu den verschiedenen `#textType_X`-Kategorien
- `karte.html` – Interaktive Karte mit Fundorten und aktuellen Standorten
- `karte.json`, `width.json`, `texttype.json`, etc. – Daten, exportiert via XQuery
- `README.md` – dieses Dokument

## 🧪 Datenquellen

Alle XML-Dateien stammen aus dem Projektverzeichnis `SIGN-IT-Data/` und wurden über folgende Pfade analysiert:

- **Width-Daten:**  
  `//tei:dimensions[@type="lamina"][@subtype="profile_external"]/tei:width[@unit="cm"]`

- **Bezel-Analyse:**  
  - `noBezel`: `//msDesc[not(.//decoNote[@ana="bezel"])]`  
  - `bezelEmpty`: `//decoNote[@ana="bezel"][not(normalize-space())]`  
  - `bezelExecutionOnly`: `//decoNote[@ana="bezel"][.//rs[@type="execution"]]`  
  - `bezelOtherFilled`: alle weiteren gefüllten Fälle

- **TextType-Kategorien:**  
  `//tei:term[starts-with(@key, "#textType_")]`

- **Geo-Koordinaten (Karte):**  
  `//geo` aus `<settlement>`, `<origPlace>`, `<placeName>` usw.

## 📈 Ergebnisse

Jede Visualisierung enthält:
- Dynamische Skalierung
- Tooltip oder Beschriftungen
- Achsen/Legenden
- Interaktive Darstellung (wo möglich)

## 📌 Hinweise

- JSON-Daten müssen lokal gehostet werden (z. B. via XAMPP oder Live Server Plugin)
- Das Projekt ist vollständig clientseitig und benötigt keinen Server

## 👩‍🎓 Autorin

- **Name:** Xiao Yang  
- **Projekt:** XML-basierte Datenvisualisierung im Rahmen des SIGN-IT-Projekts  
- **Betreuung:** [Dozent/in Name]  
- **Stand:** Mai 2025

---

