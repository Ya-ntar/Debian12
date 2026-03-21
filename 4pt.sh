#!/bin/bash

ROOT_PART=$(findmnt / -o SOURCE -n)

echo "Корневой раздел: $ROOT_PART"
echo "----------------------------------------"

if ! command -v tune2fs &> /dev/null
then
    echo "Ошибка: утилита tune2fs не установлена. Установите пакет e2fsprogs:"
    echo "sudo apt update && sudo apt install e2fsprogs"
    exit 1
fi

tune2fs -l "$ROOT_PART" | grep -E \
"Filesystem state|Magic number|Inode count|Block count|Reserved block count|Reserved block percentage|Free blocks|Free inodes|Last write time|Mount count"
