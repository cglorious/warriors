- A command line interface coaching simulation to create a Warriors starting lineup

User greeted as a coach
- show roster in a numbered list
- search by number (based on number of players on roster)
- show bio
- ask to add player to lineup
- what next: view lineup, change lineup, view roster, exit

Data: https://www.nba.com/warriors/roster
- Bio: name, position, jersey_number
- More: bio_url, Height, Weight, Country, Last Attended, Age, Birthdate, Draft, Experience

Classes:
- Player
- CLI
- Scraper

What is a Player?
- Name
- position
- jersey_number

Additional Features:
1. Add bio_url
2. Full bio
- scrape data from bio_url link (height, weight, height, birthdate, last attended, draft)
3. Conditionals to only allow 2 guards and 3 forwards

Debugging:
- Should the info include bio_url?