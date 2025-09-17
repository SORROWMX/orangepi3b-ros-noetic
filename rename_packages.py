#!/usr/bin/env python3
"""
🔄 Скрипт переименования пакетов для Debian Bookworm
Переименовывает пакеты с -0focal на -0bookworm
"""

import os
import shutil
import glob
from datetime import datetime

def main():
    print("🔄 Переименование пакетов для Debian Bookworm...")
    
    # Проверяем наличие .deb файлов
    deb_files = glob.glob("*.deb")
    if not deb_files:
        print("❌ Не найдено .deb файлов в текущей директории")
        return 1
    
    # Фильтруем файлы с -0focal
    focal_files = [f for f in deb_files if "-0focal" in f]
    
    print(f"📊 Найдено {len(focal_files)} пакетов с суффиксом -0focal")
    
    if not focal_files:
        print("ℹ️ Нет пакетов для переименования")
        return 0
    
    # Создаем резервную копию
    backup_dir = "backup_original"
    print(f"📁 Создание резервной копии в {backup_dir}/...")
    os.makedirs(backup_dir, exist_ok=True)
    
    for file in deb_files:
        shutil.copy2(file, backup_dir)
    print("✅ Резервная копия создана")
    
    # Переименовываем файлы
    print("🔄 Начинаем переименование...")
    renamed_count = 0
    errors = []
    
    for file in focal_files:
        new_name = file.replace("-0focal", "-0bookworm")
        
        # Проверяем, что новый файл не существует
        if os.path.exists(new_name):
            print(f"⚠️ Файл {new_name} уже существует, пропускаем {file}")
            continue
        
        try:
            os.rename(file, new_name)
            print(f"✅ Renamed: {file} -> {new_name}")
            renamed_count += 1
        except Exception as e:
            error_msg = f"❌ Ошибка переименования {file}: {e}"
            print(error_msg)
            errors.append(error_msg)
    
    # Статистика
    print("\n🎉 Переименование завершено!")
    print(f"📊 Переименовано файлов: {renamed_count} из {len(focal_files)}")
    print(f"📁 Оригинальные файлы сохранены в {backup_dir}/")
    
    if errors:
        print(f"\n⚠️ Ошибок: {len(errors)}")
        for error in errors:
            print(f"   {error}")
    
    # Показываем статистику
    print("\n📋 Статистика пакетов:")
    all_deb = glob.glob("*.deb")
    bookworm_deb = glob.glob("*-0bookworm*.deb")
    remaining_focal = glob.glob("*-0focal*.deb")
    
    print(f"   - Всего .deb файлов: {len(all_deb)}")
    print(f"   - С суффиксом -0bookworm: {len(bookworm_deb)}")
    print(f"   - С суффиксом -0focal: {len(remaining_focal)}")
    
    # Создаем отчет
    create_report(renamed_count, len(focal_files), len(errors), bookworm_deb)
    
    print("\n✅ Готово! Теперь можно использовать пакеты с Debian Bookworm")
    return 0

def create_report(renamed_count, total_focal, error_count, bookworm_files):
    """Создает отчет о переименовании"""
    report_content = f"""Отчет о переименовании пакетов
Дата: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}
Исходное количество файлов с -0focal: {total_focal}
Переименовано файлов: {renamed_count}
Ошибок: {error_count}

Список переименованных файлов:
"""
    
    for file in bookworm_files[:10]:  # Показываем первые 10
        report_content += f"- {file}\n"
    
    if len(bookworm_files) > 10:
        report_content += f"... и еще {len(bookworm_files) - 10} файлов\n"
    
    with open("rename_report.txt", "w", encoding="utf-8") as f:
        f.write(report_content)
    
    print("📄 Отчет сохранен в rename_report.txt")

if __name__ == "__main__":
    exit(main())
