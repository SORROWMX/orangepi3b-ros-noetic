#!/bin/bash

# Скрипт для настройки Debian репозитория
# Перемещает .deb файлы в правильную структуру

echo "🏗️ Setting up Debian repository structure..."

# Создаем структуру директорий
mkdir -p debian/pool/main/arm64
mkdir -p debian/dists/bookworm/main/binary-arm64

# Перемещаем .deb файлы
if ls *.deb 1> /dev/null 2>&1; then
    echo "📦 Moving .deb files to repository structure..."
    mv *.deb debian/pool/main/arm64/
    echo "✅ Moved $(ls debian/pool/main/arm64/*.deb | wc -l) packages"
else
    echo "⚠️ No .deb files found in current directory"
fi

# Создаем .gitkeep файлы
touch debian/pool/main/arm64/.gitkeep
touch debian/dists/bookworm/main/binary-arm64/.gitkeep

echo "📁 Repository structure created:"
echo "   debian/pool/main/arm64/ - .deb packages"
echo "   debian/dists/bookworm/main/binary-arm64/ - metadata files"

echo ""
echo "🚀 Next steps:"
echo "1. Commit and push these changes"
echo "2. Enable GitHub Pages in repository settings"
echo "3. The repository will be available at:"
echo "   https://$GITHUB_REPOSITORY_OWNER.github.io/$GITHUB_REPOSITORY_NAME/"
echo ""
echo "4. Add to sources.list:"
echo "   deb [trusted=yes] https://$GITHUB_REPOSITORY_OWNER.github.io/$GITHUB_REPOSITORY_NAME/debian/ /"
