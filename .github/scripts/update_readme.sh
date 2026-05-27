#!/bin/bash

TASK_FILE=$1
TEST_FILE=$2


TODO_TASKS=$(grep -A 1000 "ToDo Tasks:" "$TASK_FILE" | sed '1d; /Done Tasks:/,$d')

DONE_TASKS=$(awk '/Done Tasks:/,EOF { 
    if (NR > 1 && !/Done Tasks:/) print 
}' "$TASK_FILE")


TEST_RESULTS=$(cat "$TEST_FILE")

update_pre() {
    local id=$1
    local content=$2
    local file=$3

    perl -0777 -i -pe "s|<pre id=\"$id\">.*?</pre>|<pre id=\"$id\">$content</pre>|s" "$file"
}

# Update HTML
update_pre "todo" "$TODO_TASKS" "index.html"
update_pre "done" "$DONE_TASKS" "index.html"
update_pre "tests" "$TEST_RESULTS" "index.html"


git config --global user.email "github-actions@users.noreply.github.com"

git add index.html
git commit -m "Update index with task and test data" || echo "No changes"
git push