#!/bin/bash

# Путь к рабочему файлу
FILE_DIR="/var/tmp"
FILE_NAME="image_file.img"
FILE_PATH="$FILE_DIR/$FILE_NAME"

# Размер файла 1 ГБ
FILE_SIZE="1G"

# Создаём директорию если не существует
mkdir -p "$FILE_DIR"

# Инициализация исходного файла
if [ ! -f "$FILE_PATH" ]; then
    echo "Создаём исходный файл $FILE_PATH размером $FILE_SIZE"
    fallocate -l "$FILE_SIZE" "$FILE_PATH"
fi

while true; do
    # Буфер временного файла
    COPY_PATH="$FILE_PATH.copy"

    # Чтение исходного файла и запись в копию
    cat "$FILE_PATH" > "$COPY_PATH"

    # Удаление исходного файла
    rm -f "$FILE_PATH"

    # Переименование копии в исходное имя
    mv "$COPY_PATH" "$FILE_PATH"

    # Маленькая пауза (чтобы снизить нагрузку)
    sleep 0.1
done
