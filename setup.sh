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
  echo "خطا: لطفا اسکریپت را با دسترسی root اجرا کنید (از sudo استفاده کنید)."
  exit 1
fi

echo "-----------------------------------------------------------"
echo "🌟 Starting DebiOmid: Farsi Localization for Debian 13 🌟"
echo "در حال شروع پیکربندی فارسی برای دبیان ۱۳"
echo "-----------------------------------------------------------"

# 2. Prerequisites Safety Check
echo "🔍 [1/8] Updating repositories and installing tools..."
echo "در حال به‌روزرسانی مخازن و نصب ابزارهای پیش‌نیاز..."
apt update
apt install -y curl wget unzip git

# 3. System Locale
echo "🌍 [2/8] Generating Persian Locale (fa_IR)..."
echo "در حال ایجاد لوکال فارسی..."
# Enable fa_IR in locale.gen
sed -i '/^# fa_IR.UTF-8 UTF-8/s/^# //' /etc/locale.gen
# Trigger generation for both English and Farsi to ensure stability
locale-gen fa_IR.UTF-8 en_CA.UTF-8
echo "✅ Locale generated successfully. / لوکال با موفقیت ایجاد شد."

# 4. Modern Fonts
echo "🔤 [3/8] Installing high-quality Farsi fonts (Vazirmatn & Noto)..."
echo "در حال نصب فونت‌های استاندارد (وزیرمتن و نوتو)..."
# Updated for Debian 13: Using fonts-noto-core which is more reliable
apt install -y fonts-vazirmatn fonts-vazirmatn-variable fonts-noto-core fonts-freefarsi

# 5. Input Method (Fcitx5)
echo "⌨️ [4/8] Setting up Fcitx5 for modern Persian typing..."
echo "در حال نصب و تنظیم سیستم ورودی Fcitx5..."
apt install -y fcitx5 fcitx5-chinese-addons fcitx5-config-qt fcitx5-frontend-gtk3 fcitx5-frontend-qt6
# Configure environment variables so Fcitx5 works in all apps
cat <<EOF > /etc/environment
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx
EOF

# 6. Desktop Specific Tweaks
DESKTOP_ENV=$XDG_CURRENT_DESKTOP

if [[ "$DESKTOP_ENV" == *"GNOME"* ]]; then
    echo "🎨 [5/8] GNOME detected. Preparing Jalali Calendar..."
    echo "میزکار گنوم شناسایی شد. در حال آماده‌سازی تقویم جلالی..."
    apt install -y gnome-shell-extension-jalali-calendar gnome-shell-extension-manager
    echo "💡 Hint: Open 'Extension Manager' after reboot to enable Jalali Calendar."
    echo "نکته: بعد از ورود مجدد، برنامه Extension Manager را برای فعال‌سازی تقویم باز کنید."

elif [[ "$DESKTOP_ENV" == *"KDE"* ]]; then
    echo "🎨 [5/8] KDE Plasma 6 detected. Setting Jalali Calendar..."
    echo "میزکار کی‌دی‌ئی شناسایی شد. در حال تنظیم تقویم جلالی..."
    # Configures the Plasma 6 digital clock for the current user
    if [ -n "$SUDO_USER" ]; then
        su - $SUDO_USER -c "kwriteconfig6 --file kdeglobals --group Locale --key CalendarSystem persian"
    else
        kwriteconfig6 --file kdeglobals --group Locale --key CalendarSystem persian
    fi
    echo "✅ KDE Calendar set to Persian. / تقویم کی‌دی‌ئی روی خورشیدی تنظیم شد."
else
    echo "ℹ️ [5/8] Generic Desktop detected. Skipping specific UI tweaks."
fi

# 7. App Localization
echo "📦 [6/8] Installing Persian language packs for Firefox & LibreOffice..."
echo "در حال نصب بسته‌های زبان فارسی برای نرم‌افزارها..."
apt install -y firefox-esr-l10n-fa libreoffice-l10n-fa

# 8. Terminal RTL
echo "💻 [7/8] Optimizing Terminal for Right-to-Left text..."
echo "بهینه‌سازی ترمینال برای متون راست‌به‌چپ..."
cat <<EOF > /etc/profile.d/farsi_terminal.sh
export VTE_CJK_WIDTH=1
EOF

echo "-----------------------------------------------------------"
echo "🎉 Setup Complete! / عملیات با موفقیت انجام شد"
echo "-----------------------------------------------------------"
echo "English:"
echo "1. Please Logout and Login again (or Restart)."
echo "2. Open 'Fcitx5 Configuration' to add the Persian layout."
echo "3. Use Alt+Shift to switch languages."
echo ""
echo "فارسی:"
echo "۱. لطفا یک‌بار از سیستم خارج شده و دوباره وارد شوید (یا ری‌استارت کنید)."
echo "۲. برنامه Fcitx5 Configuration را باز کرده و چیدمان Persian را اضافه کنید."
echo "۳. از کلیدهای Alt+Shift برای تغییر زبان استفاده کنید."
echo "-----------------------------------------------------------"
