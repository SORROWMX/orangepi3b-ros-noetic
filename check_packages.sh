#!/bin/bash

# 📊 Скрипт проверки пакетов в репозитории
# Показывает статистику по focal и bookworm пакетам

echo "📊 Проверка пакетов в репозитории..."

# Проверяем наличие .deb файлов
if [ ! -f *.deb 2>/dev/null ]; then
    echo "❌ Не найдено .deb файлов в текущей директории"
    exit 1
fi

# Подсчитываем файлы
total_deb=$(ls *.deb 2>/dev/null | wc -l)
focal_deb=$(ls *-0focal*.deb 2>/dev/null | wc -l || echo "0")
bookworm_deb=$(ls *-0bookworm*.deb 2>/dev/null | wc -l || echo "0")
other_deb=$((total_deb - focal_deb - bookworm_deb))

echo ""
echo "📋 Статистика пакетов:"
echo "   - Всего .deb файлов: $total_deb"
echo "   - С суффиксом -0focal: $focal_deb"
echo "   - С суффиксом -0bookworm: $bookworm_deb"
echo "   - Другие пакеты: $other_deb"

# Показываем примеры файлов
if [ $focal_deb -gt 0 ]; then
    echo ""
    echo "📦 Примеры focal пакетов:"
    ls *-0focal*.deb | head -5
    if [ $focal_deb -gt 5 ]; then
        echo "... и еще $((focal_deb - 5)) файлов"
    fi
fi

if [ $bookworm_deb -gt 0 ]; then
    echo ""
    echo "📦 Примеры bookworm пакетов:"
    ls *-0bookworm*.deb | head -5
    if [ $bookworm_deb -gt 5 ]; then
        echo "... и еще $((bookworm_deb - 5)) файлов"
    fi
fi

# Рекомендации
echo ""
echo "💡 Рекомендации:"

if [ $focal_deb -gt 0 ] && [ $bookworm_deb -gt 0 ]; then
    echo "⚠️ Обнаружены и focal, и bookworm пакеты"
    echo "   Рекомендуется переименовать focal пакеты:"
    echo "   ./rename_packages.sh"
elif [ $focal_deb -gt 0 ]; then
    echo "🔄 Найдены только focal пакеты"
    echo "   Рекомендуется переименовать их:"
    echo "   ./rename_packages.sh"
elif [ $bookworm_deb -gt 0 ]; then
    echo "✅ Найдены только bookworm пакеты - все в порядке!"
else
    echo "ℹ️ Нет пакетов с известными суффиксами"
fi

echo ""
echo "🔧 Доступные команды:"
echo "   ./rename_packages.sh - переименовать focal -> bookworm"
echo "   ./cleanup_focal_packages.sh - удалить старые focal пакеты"
echo "   ./check_packages.sh - проверить статистику пакетов"
