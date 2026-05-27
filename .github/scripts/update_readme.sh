#!/bin/bash

FREQ_RESULT=$1
GITHUB_USER=$2
TIMESTAMP=$(date)

echo -e "\n[$GITHUB_USER - $FREQ_RESULT - $TIMESTAMP]" >> README.md
echo "---" >> README.md