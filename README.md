# elmMapboxSpike

***Installation:***

    - neues Verzeichnis anlegen
    - npm init
      -> package.json
    - npm install --save elm-mapbox
      -> Verzeichnis node_modules, package-lock.json
    - (git init)
    - elm init -> /src/, elm.json
    - elm install gampleman/elm-mapbox
    - elm install elm/json
    - (npm install -g parcel-bundler), wenn noch nicht installiert
    - parcel index.html



***Erzeugen elm-Datei aus Swisstopo.json:***

    - https://code.gampleman.eu/elm-mapbox/style-generator/

*Probleme mit (https://vectortiles.geo.admin.ch/gl-styles/ch.swisstopo.leichte-basiskarte.vt/v006/style.json):*

    - !has wird nicht verstanden (:!has)
    - Layer.visibility (str "visible") gibt es nicht; nur Layer.visible
    - Die Datei wird nach Anpassungen kompiliert, aber nicht korrekt ausgeführt.
    - Daten-Fehler in json-Datei: "pass_crossing" im Filter doppelt vorhanden (im Layer mit "id" : "labels_peaks")

