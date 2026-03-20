#!/bin/bash

FILE="testfile.img"
COPY="copy.img"
if [ ! -f "$FILE" ]; then
    fallocate -l 1G "$FILE"
fi

while true; do
    cat "$FILE" > /dev/null
    cp "$FILE" "$COPY"
    rm "$FILE"
    mv "$COPY" "$FILE"
    echo "Cycle completed"
done