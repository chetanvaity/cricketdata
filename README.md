# CricketData

## Cricksheet data
- Check cricksheet.org
- Using "new" CSV format
  - There is data for 825 Test matches. Download the zip.
  - There is one CSV per match. Each CSV contains rows for every ball in the match.

## Ingest into BigQuery
- Install Google Cloud SDK (cmdline) and set it up with your Google project
- This comes with "bq" - a BigQuery utility
- A sample command:
    `bq load --source_format=CSV --autodetect cv-test-project-433120:cricksheet1.tests_male /path/to/some.CSV`

### Column types
- The `--autodetect` makes mistakes, so lets try giving explicit types
- ```
   bq load --source_format=CSV cv-test-project-433120:cricksheet1.tests_male /path/to/some.CSV \
      match_id:INTEGER,season:STRING,start_date:DATE,venue:STRING, \
      innings:INTEGER,ball:FLOAT,batting_team:STRING,bowling_team:STRING, \
      striker:STRING,non_striker:STRING,bowler:STRING,runs_off_bat:INTEGER, \
      extras:INTEGER,wides:INTEGER,noballs:INTEGER,byes:INTEGER, \
      legbyes:INTEGER,penalty:STRING,wicket_type:STRING, \
      player_dismissed:STRING,other_wicket_type:STRING, \
      other_player_dismissed:STRING
   ```