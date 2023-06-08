# HyroxApp-CodeCleanupProject

Av: Alexander Carlsson AU22

##Vad som har gjorts
- Sorterat filerna till en mappstruktur som följer MVVM
- Brutit ut structar till egna filer där de ej var helt relevanta till den tidigare filen
- Sett över variabel och funktionsnamn i hela projektet och ändrat vid behov samt där förtydligande behövs
- Flyttat ut kod från views till egna funktioner
- Kommenterat kort vad koden gör där klass-, funktion- eller variabelnamn inte gör det uppenbart
- Tagit bort alla printar som loggar data. Har ersatt vissa med alerts där användaren behöver få feedback (Auth/login error)
- Skapat en struct som returnerar ett felmeddelande om något fält är tomt vid inlogg, alternativt returnerar ett firebase felmeddelande om det är inloggningen som failar
- Indenterat koden
- Skapat en generisk struct som visar upp det inskickade argumentet som en alert. Används för att visa felmeddelanden till användaren.
- Bytte ut databasen till att hosta den själv på min firestore för att kringå läs-fel pga stängd databas
 
