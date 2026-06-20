#!/usr/bin/env bash

# Přesun do složky, kde se nachází skript
cd "$(dirname "$0")"

# 1. KONTROLA ZMĚN V .GITIGNORE
if ! git diff --quiet HEAD .gitignore 2>/dev/null; then
    if whiptail --title "Změna v .gitignore" \
    --yesno "Zjistil jsem změnu v .gitignore. Chceš vyčistit mezipaměť (cache), aby se změny projevily na GitHubu?" 12 65; then
        git rm -r --cached . > /dev/null
    fi
fi

# 2. PŘIDÁNÍ ZMĚN
git add .

# 3. PŘÍPRAVA COMMITU
current_time=$(date +'%d.%m.%Y %H:%M')
msg=$(whiptail --title "Git Sync - QTalarm-Enhanced" \
--inputbox "Zadej popis změn (commit message):" 10 60 \
"Aktualizace $current_time" 3>&1 1>&2 2>&3)

if [ $? != 0 ]; then
    echo "Operace zrušena."
    exit
fi

[ -z "$msg" ] && msg="Pravidelná aktualizace $current_time"
git commit -m "$msg"

# 4. SYNCHRONIZACE (PULL + PUSH)
echo "----------------------------------------------------------"
echo "  STAHUJI ZMĚNY Z GITHUB-U (Rebase)..."
echo "----------------------------------------------------------"
git pull --rebase origin main

echo ""
echo "----------------------------------------------------------"
echo "  ODESÍLÁM DATA NA GITHUB..."
echo "----------------------------------------------------------"
git push -u origin main

echo ""
read -n 1 -s -r -p "Hotovo. Vše proběhlo v pořádku. Stiskni cokoli pro zavření..."
