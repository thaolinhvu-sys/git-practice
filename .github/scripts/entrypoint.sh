#!/bin/bash

echo "Executing todo.py"

TASK_OUTPUT=$(python3 /app/.github/scripts/todo.py)
echo "$TASK_OUTPUT" > /app/task_output.txt


echo "Executing todo-test.py"

TEST_OUTPUT=$(python3 -m unittest discover -v /app/.github/scripts 2>&1)
echo "$TEST_OUTPUT" > /app/test_output.txt


echo "Executing update_index.sh"

bash /app/.github/scripts/update_index.sh /app/task_output.txt /app/test_output.txt

echo "Done!"