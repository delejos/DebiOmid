#!/bin/bash

# ==========================================================================
# Script Name: setup.sh (DebiOmid)
# Description: Professional Farsi Localization for Debian 13 (Trixie)
# GitHub: github.com/delejos/DebiOmid
# Author: delejos
# ==========================================================================

set -e

# 1. Root Check
if [ "$EUID" -ne 0 ]; then 
  echo "❌ Error: Please run as root (use sudo)."
  exit 1
fi

echo "-----------------------------------------------------------"
echo "🌟 Starting DebiOmid: Farsi Localization for Debian 13 🌟"
echo "-----------------------------------------------------------"

# 2. Prerequisites
echo "🔍 [1/8] Updating repositories and installing tools..."
apt update
apt install -y curl wget unzip git

# 3. System Locale
echo "🌍 [2/8] Generating Persian Locale (fa_IR)..."
sed -i '/^# fa_IR.UTF-8 UTF-8/s/^# //' /etc/locale.gen
locale-gen fa_IR.UTF-8 en_CA.UTF-8
echo "✅ Locale generated."

# 4. Modern Fonts
echo "🔤 [3/8] Installing Farsi fonts (Vazirmatn & Noto)..."
# Changed to fonts-noto-core for Debian 13 compatibility
apt install -y fonts-vazirmatn fonts-vazirmatn-variable fonts-noto-core fonts-freefarsi

# 5. Input Method (Fcitx5)
echo "⌨️ [4/8] Setting up Fcitx5..."
# Changed fcitx5-farsi to fcitx5-m17n for Debian 13 compatibility
apt install -y fcitx5 fcitx5-m17n fcitx5-config-qt fcitx5-frontend-gtk3 fcitx5-frontend-qt6

cat <<EOF > /etc/environment
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx
EOF

# 6. Desktop Specific Tweaks
DESKTOP_ENV=$XDG_CURRENT_DESKTOP

if [[ "$DESKTOP_ENV" == *"GNOME"* ]]; then
    echo "🎨 [5/8] GNOME detected. Installing Extension Manager..."
    # Removed missing jalali-calendar package; users will use Extension Manager
    apt install -y gnome-shell-extension-manager
    echo "💡 Hint: Open 'Extension Manager' later and search for 'Jalali'."

elif [[ "$DESKTOP_ENV" == *"KDE"* ]]; then
    echo "🎨 [5/8] KDE Plasma 6 detected. Setting Jalali Calendar..."
    if [ -n "$SUDO_USER" ]; then
        su - $SUDO_USER -c "kwriteconfig6 --file kdeglobals --group Locale --key CalendarSystem persian"
    else
        kwriteconfig6 --file kdeglobals --group Locale --key CalendarSystem persian
    fi
fi

# 7. App Localization
echo "📦 [6/8] Installing Persian language packs..."
apt install -y firefox-esr-l10n-fa libreoffice-l10n-fa

# 8. Terminal RTL
echo "💻 [7/8] Optimizing Terminal for RTL text..."
cat <<EOF > /etc/profile.d/farsi_terminal.sh
export VTE_CJK_WIDTH=1
EOF

echo "-----------------------------------------------------------"
echo "🎉 Setup Complete! / عملیات با موفقیت انجام شد"
echo "Please Logout and Login again to apply changes."
echo "-----------------------------------------------------------"
