#!/bin/bash

# 🔧 Скрипт исправления синхронизации Git
# Решает проблему "Updates were rejected because the remote contains work"

echo "🔧 Исправление синхронизации Git..."

# Проверяем статус
echo "📊 Текущий статус Git:"
git status --short

# Получаем последние изменения
echo ""
echo "📥 Получение последних изменений..."
if git pull --rebase origin main 2>/dev/null; then
    echo "✅ Успешно получены изменения из main"
elif git pull --rebase origin master 2>/dev/null; then
    echo "✅ Успешно получены изменения из master"
else
    echo "⚠️ Не удалось получить изменения, пробуем merge..."
    git pull origin main || git pull origin master
fi

# Проверяем статус после pull
echo ""
echo "📊 Статус после pull:"
git status --short

# Если есть незакоммиченные изменения, коммитим их
if [ -n "$(git status --porcelain)" ]; then
    echo ""
    echo "📝 Есть незакоммиченные изменения, коммитим их..."
    
    # Добавляем все изменения
    git add .
    
    # Коммитим с автоматическим сообщением
    git commit -m "🤖 Auto-sync: $(date)"
    
    echo "✅ Изменения закоммичены"
fi

# Пытаемся запушить
echo ""
echo "📤 Попытка push..."
if git push origin main 2>/dev/null; then
    echo "✅ Успешно запушено в main"
elif git push origin master 2>/dev/null; then
    echo "✅ Успешно запушено в master"
else
    echo "❌ Push не удался, попробуйте вручную:"
    echo "   git push origin main"
    echo "   или"
    echo "   git push origin master"
    exit 1
fi

echo ""
echo "🎉 Синхронизация завершена успешно!"
