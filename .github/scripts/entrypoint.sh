#!/bin/bash

echo "Staring Frequency Analyzer"

# Run Python script and capture output
FREQ_RESULT=$(python3 .github/scripts/frequency.py /app/data.txt)

# Pass result to README updater
bash .github/scripts/update_readme.sh "$FREQ_RESULT" "$GITHUB_USER"

echo "Process completed"