#!/bin/bash

# Диагностический скрипт для проверки зависимостей ROS пакетов

echo "=== ДИАГНОСТИКА ЗАВИСИМОСТЕЙ ROS ==="
echo "Дата: $(date)"
echo ""

# Цвета для вывода
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Проверка ROS окружения
print_status "Проверка ROS окружения..."
if [ -f "/opt/ros/noetic_src/setup.bash" ]; then
    print_success "ROS Noetic найден в /opt/ros/noetic_src/"
    source /opt/ros/noetic_src/setup.bash
else
    print_error "ROS Noetic не найден в /opt/ros/noetic_src/"
fi

echo "CMAKE_PREFIX_PATH: $CMAKE_PREFIX_PATH"
echo "ROS_PACKAGE_PATH: $ROS_PACKAGE_PATH"
echo ""

# Проверка базовых пакетов
print_status "Проверка базовых ROS пакетов..."
basic_packages=(
    "actionlib_msgs"
    "std_msgs"
    "message_generation"
    "message_runtime"
    "roscpp"
    "rosconsole"
    "pluginlib"
)

for pkg in "${basic_packages[@]}"; do
    if [ -d "/opt/ros/noetic_src/share/$pkg" ]; then
        print_success "$pkg найден"
    else
        print_error "$pkg НЕ найден"
    fi
done

echo ""

# Проверка CMake конфигурационных файлов
print_status "Проверка CMake конфигурационных файлов..."
for pkg in "${basic_packages[@]}"; do
    cmake_file="/opt/ros/noetic_src/share/$pkg/cmake/${pkg}Config.cmake"
    if [ -f "$cmake_file" ]; then
        print_success "${pkg}Config.cmake найден"
    else
        print_warning "${pkg}Config.cmake НЕ найден"
        # Ищем альтернативные имена
        alt_files=$(find /opt/ros/noetic_src -name "*${pkg}*Config.cmake" 2>/dev/null)
        if [ -n "$alt_files" ]; then
            print_status "Найдены альтернативные файлы:"
            echo "$alt_files" | sed 's/^/  /'
        fi
    fi
done

echo ""

# Проверка зависимостей для control_msgs
print_status "Проверка зависимостей для control_msgs..."
if [ -d "/opt/ros/noetic_src/share/actionlib_msgs" ]; then
    print_success "actionlib_msgs найден"
    
    # Проверяем CMake файл
    if [ -f "/opt/ros/noetic_src/share/actionlib_msgs/cmake/actionlib_msgsConfig.cmake" ]; then
        print_success "actionlib_msgsConfig.cmake найден"
    else
        print_error "actionlib_msgsConfig.cmake НЕ найден"
    fi
else
    print_error "actionlib_msgs НЕ найден - это критично для control_msgs"
    print_status "РЕШЕНИЕ: Сначала соберите actionlib_msgs"
fi

echo ""

# Проверка системных зависимостей
print_status "Проверка системных зависимостей..."
sys_deps=(
    "cmake"
    "build-essential"
    "python3-dev"
    "libboost-all-dev"
    "libeigen3-dev"
)

for dep in "${sys_deps[@]}"; do
    if dpkg -l | grep -q "^ii.*$dep"; then
        print_success "$dep установлен"
    else
        print_warning "$dep НЕ установлен"
    fi
done

echo ""

# Рекомендации
print_status "РЕКОМЕНДАЦИИ:"
echo "1. Если actionlib_msgs отсутствует, выполните:"
echo "   ./build_debian_packages.sh actionlib_msgs"
echo ""
echo "2. Если control_msgs отсутствует, выполните:"
echo "   ./build_debian_packages.sh control_msgs"
echo ""
echo "3. Если системные зависимости отсутствуют, выполните:"
echo "   sudo apt update && sudo apt install cmake build-essential python3-dev libboost-all-dev libeigen3-dev"
echo ""

print_status "Диагностика завершена"
