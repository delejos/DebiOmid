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
  echo "خطا: لطفا اسکریپت را با دسترسی root اجرا کنید."
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
echo "🌍 [2/8] Generating Persian & English Locales..."
# Enable fa_IR in locale.gen
sed -i '/^# fa_IR.UTF-8 UTF-8/s/^# //' /etc/locale.gen
# Explicitly generate both to ensure stability
locale-gen fa_IR.UTF-8 en_CA.UTF-8
echo "✅ Locales generated."

# 4. Modern Fonts
echo "🔤 [3/8] Installing Farsi fonts (Vazirmatn & Noto Core)..."
# FIX: fonts-noto-arabic is now part of fonts-noto-core in Debian 13
apt install -y fonts-vazirmatn fonts-vazirmatn-variable fonts-noto-core fonts-freefarsi

# 5. Input Method (Fcitx5)
echo "⌨️ [4/8] Setting up Fcitx5 for modern Persian typing..."
# FIX: fcitx5-farsi is replaced by fcitx5-m17n in the Trixie repos
apt install -y fcitx5 fcitx5-m17n fcitx5-config-qt fcitx5-frontend-gtk3 fcitx5-frontend-qt6

# Configure system-wide environment variables for Fcitx5
cat <<EOF > /etc/environment
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx
EOF

# 6. Desktop Specific Tweaks
DESKTOP_ENV=$XDG_CURRENT_DESKTOP

if [[ "$DESKTOP_ENV" == *"GNOME"* ]]; then
    echo "🎨 [5/8] GNOME detected. Installing Extension Manager..."
    # FIX: We use Extension Manager so user can get the latest Jalali Calendar
    apt install -y gnome-shell-extension-manager
    echo "💡 Hint: Open 'Extension Manager' after reboot and search for 'Jalali'."

elif [[ "$DESKTOP_ENV" == *"KDE"* ]]; then
    echo "🎨 [5/8] KDE Plasma 6 detected. Setting Jalali Calendar..."
    # Configures the Plasma 6 digital clock for the current user
    if [ -n "$SUDO_USER" ]; then
        su - $SUDO_USER -c "kwriteconfig6 --file kdeglobals --group Locale --key CalendarSystem persian"
    else
        kwriteconfig6 --file kdeglobals --group Locale --key CalendarSystem persian
    fi
    echo "✅ KDE Calendar set to Persian."
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
echo "-----------------------------------------------------------"
echo "1. Please Logout and Login again (or Restart)."
echo "2. Open 'Fcitx5 Configuration' to add the Persian layout."
echo "3. Use Alt+Shift to switch languages."
echo "-----------------------------------------------------------"
