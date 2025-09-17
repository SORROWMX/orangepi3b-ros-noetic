#!/bin/bash

# 🧹 Автоматический скрипт очистки дублирующихся пакетов
# Удаляет старые -0focal файлы без подтверждения (для GitHub Actions)

echo "🧹 Автоматическая очистка дублирующихся пакетов..."

# Проверяем наличие .deb файлов
if [ ! -f *.deb ]; then
    echo "❌ Не найдено .deb файлов в текущей директории"
    exit 1
fi

# Подсчитываем файлы
total_deb=$(ls *.deb 2>/dev/null | wc -l)
focal_deb=$(ls *-0focal*.deb 2>/dev/null | wc -l || echo "0")
bookworm_deb=$(ls *-0bookworm*.deb 2>/dev/null | wc -l || echo "0")

echo "📊 Текущая статистика:"
echo "   - Всего .deb файлов: $total_deb"
echo "   - С суффиксом -0focal: $focal_deb"
echo "   - С суффиксом -0bookworm: $bookworm_deb"

if [ $focal_deb -eq 0 ]; then
    echo "ℹ️ Нет focal файлов для удаления"
    exit 0
fi

# Создаем резервную копию
echo ""
echo "📁 Создание резервной копии focal файлов..."
backup_dir="backup_focal_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$backup_dir"
cp *-0focal*.deb "$backup_dir"/ 2>/dev/null
echo "✅ Резервная копия создана в $backup_dir/"

# Показываем файлы для удаления
echo ""
echo "🗑️ Удаляем $focal_deb focal файлов..."

# Удаляем focal файлы
deleted_count=0

for file in *-0focal*.deb; do
    if [ -f "$file" ]; then
        rm "$file"
        echo "🗑️ Удален: $file"
        ((deleted_count++))
    fi
done

# Дополнительная проверка на все файлы с 'focal'
echo ""
echo "🔍 Дополнительная проверка на файлы с 'focal'..."
all_focal=$(ls *focal*.deb 2>/dev/null || true)
if [ -n "$all_focal" ]; then
    echo "Найдены дополнительные focal файлы:"
    echo "$all_focal"
    for file in *focal*.deb; do
        if [ -f "$file" ]; then
            rm "$file"
            echo "🗑️ Удален: $file"
            ((deleted_count++))
        fi
    done
else
    echo "ℹ️ Дополнительных focal файлов не найдено"
fi

# Финальная статистика
echo ""
echo "🎉 Очистка завершена!"
echo "📊 Удалено файлов: $deleted_count"

# Проверяем результат
remaining_focal=$(ls *-0focal*.deb 2>/dev/null | wc -l || echo "0")
final_bookworm=$(ls *-0bookworm*.deb 2>/dev/null | wc -l || echo "0")
final_total=$(ls *.deb 2>/dev/null | wc -l)

echo ""
echo "📋 Финальная статистика:"
echo "   - Всего .deb файлов: $final_total"
echo "   - С суффиксом -0focal: $remaining_focal"
echo "   - С суффиксом -0bookworm: $final_bookworm"

if [ $remaining_focal -eq 0 ]; then
    echo "✅ Все focal файлы успешно удалены!"
else
    echo "⚠️ Осталось $remaining_focal focal файлов"
fi

echo ""
echo "📁 Резервная копия сохранена в $backup_dir/"
