#!/bin/bash

PROJECT_ID="cv-test-project-433120"
DATASET="cricksheet1"
TABLE="tests_male"

CSV_DIR="/home/chetan/Downloads/tests_male"

# Schema for your CSV files (adjust according to your schema)
SCHEMA="match_id:INTEGER,season:STRING,start_date:DATE,venue:STRING,innings:INTEGER,ball:FLOAT,batting_team:STRING,bowling_team:STRING,striker:STRING,non_striker:STRING,bowler:STRING,runs_off_bat:INTEGER,extras:INTEGER,wides:INTEGER,noballs:INTEGER,byes:INTEGER,legbyes:INTEGER,penalty:STRING,wicket_type:STRING,player_dismissed:STRING,other_wicket_type:STRING,other_player_dismissed:STRING"

# Loop through all CSV files in the specified directory
for F in "$CSV_DIR"/??????.csv; do
    echo "Attempting to load $file into BigQuery..."
    
    bq load --source_format=CSV \
    --skip_leading_rows=1 \
    "$PROJECT_ID:$DATASET.$TABLE" \
    "$F" \
    "$SCHEMA"
    
    if [ $? -eq 0 ]; then
        echo "Successfully loaded $F into BigQuery."
    else
        echo "Error loading $F into BigQuery. Please check the CSV file or BigQuery logs for details."
    fi
done
