#!/bin/bash
FILE="testfile.img"
BLOCK_SIZE="1M"   # quote to prevent bash misinterpretation
FILE_SIZE=1024     # number of blocks

if [ ! -f "$FILE" ]; then
    echo "Creating $FILE (~1GB)..."
    dd if=/dev/zero of="$FILE" bs="$BLOCK_SIZE" count=$FILE_SIZE status=none
fi

echo "Starting I/O stress loop..."
while true; do
    # read file to /dev/null
    cat "$FILE" > /dev/null
    # copy file
    dd if="$FILE" of="copy.img" bs="$BLOCK_SIZE" count=$FILE_SIZE status=none
    # overwrite original
    mv copy.img "$FILE"
    echo "Cycle completed"
    sleep 0.5
done
