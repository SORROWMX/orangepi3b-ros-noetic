#!/bin/bash

# Скрипт установки полной ROS системы

echo "=== Установка полной ROS системы ==="

# Получение директории скрипта
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Установка всех ROS пакетов из $SCRIPT_DIR..."

# Установка всех .deb файлов
sudo dpkg -i "$SCRIPT_DIR"/*.deb

# Исправление зависимостей если необходимо
echo "Проверка и исправление зависимостей..."
sudo apt-get install -f

echo "Установка завершена!"
echo ""
echo "Установленные ROS пакеты:"
dpkg -l | grep ros-noetic

echo ""
echo "Для активации ROS окружения выполните:"
echo "source /opt/ros/noetic_src/setup.bash"
