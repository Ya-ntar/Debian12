#!/bin/bash

# Скрипт disk_info.sh
# Выводит информацию о всех подключённых дисках

echo "Информация о дисках:"
echo "===================="

# Перебираем все блоковые устройства типа "disk"
for disk in $(lsblk -dn -o NAME,TYPE | awk '$2=="disk"{print $1}'); do
    echo "--------------------"
    echo "Имя диска: /dev/$disk"
    
    # UUID (если есть)
    uuid=$(blkid /dev/$disk | awk -F '"' '{print $2}')
    if [ -z "$uuid" ]; then
        uuid="Отсутствует"
    fi
    echo "UUID: $uuid"
    
    # Размер диска в ГБ
    size_gb=$(lsblk -dn -o SIZE /dev/$disk)
    echo "Объем диска: $size_gb"
    
    # Размер сектора и количество секторов
    sector_size=$(cat /sys/block/$disk/queue/logical_block_size)
    total_sectors=$(cat /sys/block/$disk/size)
    echo "Размер сектора: $sector_size байт"
    echo "Количество секторов: $total_sectors"
done