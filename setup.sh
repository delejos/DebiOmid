#!/bin/bash

# ==========================================================================
# Script Name: setup.sh
# Description: Professional Farsi Localization for Debian 13 (Trixie)
# GitHub: github.com/delejos/debian-13-farsi
# Author: delejos
# ==========================================================================

set -e

# 1. Root Check
if [ "$EUID" -ne 0 ]; then 
  echo "Error: Please run as root (use sudo)."
  exit 1
fi

echo "--- Starting Farsi Localization for Debian 13 (Trixie) ---"

# 2. Prerequisites Safety Check
echo "[1/8] Installing prerequisites..."
apt update
apt install -y curl wget unzip git

# 3. System Locale
echo "[2/8] Generating fa_IR.UTF-8 locale..."
sed -i '/^# fa_IR.UTF-8 UTF-8/s/^# //' /etc/locale.gen
locale-gen

# 4. Modern Fonts (Pure Debian 13 Repos)
echo "[3/8] Installing Vazirmatn and Noto fonts..."
apt install -y fonts-vazirmatn fonts-vazirmatn-variable fonts-noto-arabic fonts-freefarsi

# 5. Input Method (Fcitx5)
echo "[4/8] Configuring Fcitx5 for Persian typing..."
apt install -y fcitx5 fcitx5-farsi fcitx5-config-qt fcitx5-frontend-gtk3 fcitx5-frontend-qt6

# Set system-wide environment variables for Fcitx5
cat <<EOF > /etc/environment
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx
EOF

# 6. Desktop Specific Tweaks
DESKTOP_ENV=$XDG_CURRENT_DESKTOP

if [[ "$DESKTOP_ENV" == *"GNOME"* ]]; then
    echo "[5/8] GNOME detected. Installing Jalali extension and Manager..."
    apt install -y gnome-shell-extension-jalali-calendar gnome-shell-extension-manager
    echo "-> Use 'Extension Manager' to enable the Jalali Calendar."

elif [[ "$DESKTOP_ENV" == *"KDE"* ]]; then
    echo "[5/8] KDE Plasma 6 detected. Setting Jalali calendar via kwriteconfig6..."
    # Configures the Plasma 6 digital clock for the current user
    su - $SUDO_USER -c "kwriteconfig6 --file kdeglobals --group Locale --key CalendarSystem persian"
    echo "-> KDE Calendar system set to Persian (Jalali)."
fi

# 7. App Localization
echo "[6/8] Installing Persian language packs..."
apt install -y firefox-esr-l10n-fa libreoffice-l10n-fa

# 8. Terminal RTL
echo "[7/8] Adding RTL rendering hint for Terminal..."
cat <<EOF > /etc/profile.d/farsi_terminal.sh
export VTE_CJK_WIDTH=1
EOF

echo "-----------------------------------------------------------"
echo "Setup Complete! Please Logout/Login to apply changes."
echo "عملیات با موفقیت انجام شد. لطفا یک‌بار خارج و وارد شوید."
echo "-----------------------------------------------------------"