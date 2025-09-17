#!/bin/bash

# 🗑️ Скрипт очистки старых focal пакетов
# Удаляет все пакеты с суффиксом -0focal после переименования

echo "🗑️ Очистка старых focal пакетов..."

# Проверяем наличие focal файлов
focal_count=$(ls *-0focal*.deb 2>/dev/null | wc -l)

if [ $focal_count -eq 0 ]; then
    echo "ℹ️ Нет focal пакетов для удаления"
    exit 0
fi

echo "📊 Найдено $focal_count focal пакетов для удаления"

# Показываем список файлов
echo "📋 Список файлов для удаления:"
ls -la *-0focal*.deb

# Спрашиваем подтверждение
echo ""
read -p "❓ Удалить эти файлы? (y/N): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "❌ Операция отменена"
    exit 0
fi

# Создаем резервную копию перед удалением
echo "📁 Создание резервной копии перед удалением..."
mkdir -p backup_before_cleanup
cp *-0focal*.deb backup_before_cleanup/ 2>/dev/null
echo "✅ Резервная копия создана в backup_before_cleanup/"

# Удаляем файлы
echo "🗑️ Удаляем focal пакеты..."
deleted_count=0

for file in *-0focal*.deb; do
    if [ -f "$file" ]; then
        rm "$file"
        echo "🗑️ Удален: $file"
        ((deleted_count++))
    fi
done

echo ""
echo "🎉 Очистка завершена!"
echo "📊 Удалено файлов: $deleted_count из $focal_count"
echo "📁 Резервная копия сохранена в backup_before_cleanup/"

# Показываем статистику
echo ""
echo "📋 Текущая статистика пакетов:"
echo "   - Всего .deb файлов: $(ls *.deb 2>/dev/null | wc -l)"
echo "   - С суффиксом -0bookworm: $(ls *-0bookworm*.deb 2>/dev/null | wc -l)"
echo "   - С суффиксом -0focal: $(ls *-0focal*.deb 2>/dev/null | wc -l)"

echo ""
echo "✅ Репозиторий очищен от старых focal пакетов!"
