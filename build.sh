#!/usr/bin/env bash

# 1. Přesun do složky se skriptem
cd "$(dirname "$0")"

# 2. Vyčištění starých souborů
echo "--- Čistím staré build soubory ---"
make clean > /dev/null 2>&1
rm -f Makefile

# 3. Konfigurace projektu (qmake)
echo "--- Spouštím qmake ---"
qmake

# 4. Kompilace (make)
# Použijeme parametr -j$(nproc), který využije všechna jádra procesoru pro rychlejší build
echo "--- Kompiluji projekt ---"
if make -j$(nproc); then
    echo ""
    echo "------------------------------------------"
    echo "  BUILD ÚSPĚŠNĚ DOKONČEN!"
    echo "------------------------------------------"
else
    echo ""
    echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    echo "  BUILD SELHAL! Zkontroluj chyby výše."
    echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    exit 1
fi
