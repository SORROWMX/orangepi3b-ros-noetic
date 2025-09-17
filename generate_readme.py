#!/usr/bin/env python3
"""
Автоматический генератор README для репозитория ROS Noetic пакетов
"""

import os
import glob
from datetime import datetime

def count_deb_files():
    """Подсчитывает количество .deb файлов в текущей директории"""
    deb_files = glob.glob("*.deb")
    return len(deb_files), deb_files

def categorize_packages(deb_files):
    """Категоризирует пакеты по типам"""
    categories = {
        'core': [],
        'communication': [],
        'build_system': [],
        'messages': [],
        'tf': [],
        'image': [],
        'utilities': [],
        'debug': [],
        'other': []
    }
    
    for file in deb_files:
        filename = file.lower()
        if 'ros-core' in filename or 'ros-base' in filename or 'ros-comm' in filename or 'ros_' in filename:
            categories['core'].append(file)
        elif 'roscpp' in filename or 'rospy' in filename or 'rosgraph' in filename or 'rosmaster' in filename:
            categories['communication'].append(file)
        elif 'catkin' in filename or 'cmake' in filename or 'rospack' in filename or 'rosbuild' in filename:
            categories['build_system'].append(file)
        elif 'msgs' in filename and 'dbgsym' not in filename:
            categories['messages'].append(file)
        elif 'tf' in filename and 'dbgsym' not in filename:
            categories['tf'].append(file)
        elif 'image' in filename or 'camera' in filename or 'opencv' in filename:
            categories['image'].append(file)
        elif 'rosbag' in filename or 'roslaunch' in filename or 'roswtf' in filename:
            categories['utilities'].append(file)
        elif 'dbgsym' in filename:
            categories['debug'].append(file)
        else:
            categories['other'].append(file)
    
    return categories

def generate_readme():
    """Генерирует README.md файл"""
    total_count, deb_files = count_deb_files()
    categories = categorize_packages(deb_files)
    current_date = datetime.now().strftime("%Y-%m-%d")
    
    readme_content = f"""# Orange Pi 3B - ROS Noetic Packages

Этот репозиторий содержит предварительно скомпилированные пакеты ROS Noetic для архитектуры ARM64, специально разработанные для одноплатных компьютеров Orange Pi 3B под управлением Ubuntu 20.04 (Focal Fossa).

## 📦 Статистика пакетов

- **Всего .deb файлов**: {total_count}
- **Архитектура**: ARM64 (aarch64)
- **Целевая ОС**: Ubuntu 20.04 Focal Fossa
- **Дистрибуция ROS**: Noetic Ninjemys
- **Дата обновления**: {current_date}

## 🚀 Что включено

Этот репозиторий предоставляет полный набор пакетов для установки ROS Noetic, включая:

### Основные пакеты ROS ({len(categories['core'])} пакетов)
- `ros-noetic-ros-core` - Основная функциональность ROS
- `ros-noetic-ros-base` - Базовая установка ROS
- `ros-noetic-ros-comm` - Библиотеки коммуникации ROS
- `ros-noetic-ros` - Основной метапакет ROS

### Система коммуникации ({len(categories['communication'])} пакетов)
- roscpp, rospy, rosgraph, rosmaster
- rosparam, rostopic, rosservice, rostest

### Система сборки ({len(categories['build_system'])} пакетов)
- catkin, cmake-modules, rospack
- rosmake, rosbuild, rosclean

### Типы сообщений ({len(categories['messages'])} пакетов)
- std-msgs, geometry-msgs, sensor-msgs, nav-msgs
- trajectory-msgs, visualization-msgs и другие

### Библиотека трансформаций ({len(categories['tf'])} пакетов)
- tf, tf2 и все связанные пакеты tf2

### Обработка изображений ({len(categories['image'])} пакетов)
- cv-bridge, image-transport, camera packages
- opencv-tests

### Утилиты ({len(categories['utilities'])} пакетов)
- rosbag, roslaunch, roswtf, rosunit

### Отладочные символы ({len(categories['debug'])} пакетов)
- Пакеты с отладочными символами для разработки

## 🛠 Установка

### Предварительные требования
- Orange Pi 3B с Ubuntu 20.04 (Focal Fossa)
- Архитектура ARM64
- Права root или sudo

### Быстрая установка
```bash
# Установить все пакеты сразу
sudo dpkg -i *.deb

# Исправить проблемы с зависимостями
sudo apt-get install -f
```

### Выборочная установка
```bash
# Установить основные пакеты ROS
sudo dpkg -i ros-noetic-ros-core_*.deb ros-noetic-ros-base_*.deb

# Установить конкретную функциональность
sudo dpkg -i ros-noetic-ros-comm_*.deb
sudo dpkg -i ros-noetic-tf2_*.deb
```

## 📋 Детальная статистика пакетов

### Основные пакеты ROS
"""
    
    # Добавляем список основных пакетов
    for pkg in sorted(categories['core']):
        readme_content += f"- `{pkg}`\n"
    
    readme_content += f"""
### Система коммуникации
"""
    
    for pkg in sorted(categories['communication']):
        readme_content += f"- `{pkg}`\n"
    
    readme_content += f"""
### Система сборки
"""
    
    for pkg in sorted(categories['build_system']):
        readme_content += f"- `{pkg}`\n"
    
    readme_content += f"""
### Типы сообщений
"""
    
    for pkg in sorted(categories['messages']):
        readme_content += f"- `{pkg}`\n"
    
    readme_content += f"""
### Библиотека трансформаций
"""
    
    for pkg in sorted(categories['tf']):
        readme_content += f"- `{pkg}`\n"
    
    readme_content += f"""
### Обработка изображений
"""
    
    for pkg in sorted(categories['image']):
        readme_content += f"- `{pkg}`\n"
    
    readme_content += f"""
### Утилиты
"""
    
    for pkg in sorted(categories['utilities']):
        readme_content += f"- `{pkg}`\n"
    
    readme_content += f"""
### Отладочные символы
"""
    
    for pkg in sorted(categories['debug']):
        readme_content += f"- `{pkg}`\n"
    
    readme_content += f"""
### Прочие пакеты
"""
    
    for pkg in sorted(categories['other']):
        readme_content += f"- `{pkg}`\n"
    
    readme_content += f"""
## 🔧 Зависимости

Пакеты требуют следующих системных зависимостей:
- `libboost-filesystem1.71.0`
- `libboost-system1.71.0` 
- `libboost-thread1.71.0`
- `python3-catkin-pkg-modules`
- `python3-rosdep-modules`
- `hddtemp` (для мониторинга оборудования)

## 🎯 Целевое оборудование

- **Плата**: Orange Pi 3B
- **Процессор**: ARM Cortex-A53 quad-core
- **Архитектура**: ARM64 (aarch64)
- **ОС**: Ubuntu 20.04 LTS Focal Fossa

## 📝 Примечания

- Все пакеты скомпилированы для архитектуры ARM64
- Совместимы с Ubuntu 20.04 Focal Fossa
- Включают как релизные, так и отладочные пакеты
- Некоторые пакеты могут требовать дополнительные системные зависимости

## 🤝 Вклад в проект

Этот репозиторий содержит предварительно скомпилированные пакеты. Для модификации исходного кода обратитесь к официальным исходным репозиториям ROS Noetic.

## 📄 Лицензия

Эти пакеты следуют тем же условиям лицензирования, что и оригинальная дистрибуция ROS Noetic. Обратитесь к лицензиям отдельных пакетов для получения конкретных условий.

---

**Автоматически сгенерировано**: {current_date}  
**Версия ROS**: Noetic Ninjemys  
**Количество пакетов**: {total_count} .deb файлов  
**Скрипт генерации**: generate_readme.py
"""
    
    return readme_content

def main():
    """Основная функция"""
    print("🔄 Генерация README.md...")
    
    readme_content = generate_readme()
    
    with open("README.md", "w", encoding="utf-8") as f:
        f.write(readme_content)
    
    total_count, _ = count_deb_files()
    print(f"✅ README.md успешно сгенерирован!")
    print(f"📦 Найдено {total_count} .deb файлов")
    print(f"📝 Файл сохранен как README.md")

if __name__ == "__main__":
    main()
