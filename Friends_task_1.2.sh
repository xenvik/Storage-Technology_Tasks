#!/usr/bin/env bash

DATA_DIR="$HOME/dst-stu/d"
PROG_DIR="$HOME/dst-stu/src"

cat "$DATA_DIR/friends.json" |  awk -f "$PROG_DIR/json_to_tree.awk" > "$DATA_DIR/json.dot" && dot -Tsvg -Kdot -o"$DATA_DIR/json.svg" "$DATA_DIR/json.dot" && gwenview "$DATA_DIR/json.svg"


