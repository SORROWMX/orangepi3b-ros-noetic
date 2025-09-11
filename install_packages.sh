#!/bin/bash

# Скрипт установки созданных ROS Debian пакетов

echo "Установка ROS Debian пакетов..."

# Получение директории скрипта
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Установка всех .deb файлов
echo "Установка пакетов из $SCRIPT_DIR..."
sudo dpkg -i "$SCRIPT_DIR"/*.deb

# Исправление зависимостей если необходимо
echo "Проверка и исправление зависимостей..."
sudo apt-get install -f

echo "Установка завершена!"
echo "Установленные пакеты:"
dpkg -l | grep ros-
