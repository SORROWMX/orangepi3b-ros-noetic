#!/bin/bash

# 🔄 Скрипт переименования пакетов для Debian Bookworm
# Переименовывает пакеты с -0focal на -0bookworm

echo "🔄 Переименование пакетов для Debian Bookworm..."

# Проверяем наличие .deb файлов
if [ ! -f *.deb ]; then
    echo "❌ Не найдено .deb файлов в текущей директории"
    exit 1
fi

# Создаем резервную копию
echo "📁 Создание резервной копии..."
mkdir -p backup_original
cp *.deb backup_original/ 2>/dev/null
echo "✅ Резервная копия создана в backup_original/"

# Подсчитываем файлы для переименования
focal_count=$(ls *-0focal*.deb 2>/dev/null | wc -l)
echo "📊 Найдено $focal_count пакетов с суффиксом -0focal"

if [ $focal_count -eq 0 ]; then
    echo "ℹ️ Нет пакетов для переименования"
    exit 0
fi

# Переименовываем файлы
echo "🔄 Начинаем переименование..."
renamed_count=0

for file in *-0focal*.deb; do
    if [ -f "$file" ]; then
        new_name=$(echo "$file" | sed 's/-0focal/-0bookworm/g')
        
        # Проверяем, что новый файл не существует
        if [ -f "$new_name" ]; then
            echo "⚠️ Файл $new_name уже существует, пропускаем $file"
            continue
        fi
        
        mv "$file" "$new_name"
        echo "✅ Renamed: $file -> $new_name"
        ((renamed_count++))
    fi
done

# Удаляем оставшиеся focal файлы (если есть)
echo ""
echo "🗑️ Проверяем наличие старых focal файлов..."
remaining_focal=$(ls *-0focal*.deb 2>/dev/null | wc -l)
if [ $remaining_focal -gt 0 ]; then
    echo "Найдено $remaining_focal старых focal файлов для удаления:"
    for file in *-0focal*.deb; do
        if [ -f "$file" ]; then
            rm "$file"
            echo "🗑️ Удален: $file"
        fi
    done
else
    echo "ℹ️ Старых focal файлов не найдено"
fi

echo ""
echo "🎉 Переименование завершено!"
echo "📊 Переименовано файлов: $renamed_count из $focal_count"
echo "📁 Оригинальные файлы сохранены в backup_original/"

# Показываем статистику
echo ""
echo "📋 Статистика пакетов:"
echo "   - Всего .deb файлов: $(ls *.deb 2>/dev/null | wc -l)"
echo "   - С суффиксом -0bookworm: $(ls *-0bookworm*.deb 2>/dev/null | wc -l)"
echo "   - С суффиксом -0focal: $(ls *-0focal*.deb 2>/dev/null | wc -l)"

# Создаем отчет
echo ""
echo "📝 Создание отчета..."
cat > rename_report.txt << EOF
Отчет о переименовании пакетов
Дата: $(date)
Исходное количество файлов с -0focal: $focal_count
Переименовано файлов: $renamed_count
Ошибок: $((focal_count - renamed_count))

Список переименованных файлов:
$(ls *-0bookworm*.deb 2>/dev/null | head -10)
$(if [ $(ls *-0bookworm*.deb 2>/dev/null | wc -l) -gt 10 ]; then echo "... и еще $(($(ls *-0bookworm*.deb 2>/dev/null | wc -l) - 10)) файлов"; fi)
EOF

echo "📄 Отчет сохранен в rename_report.txt"
echo ""
echo "✅ Готово! Теперь можно использовать пакеты с Debian Bookworm"
