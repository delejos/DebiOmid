# DebiOmid: Debian 13 (Trixie) Farsi Localization

DebiOmid (Debian + Omid/Hope) is a professional post-install script designed to perfectly localize Debian 13 (Trixie) for Farsi-speaking users. It automates the installation of high-quality fonts, input methods, and calendar systems using 100% official Debian repositories.

---

## Features
- **Modern Typography:** Installs official `fonts-vazirmatn` and `fonts-noto-core` for crisp Persian rendering.
- **Improved Typing:** Sets up **Fcitx5** with the `m17n` backend for accurate Persian (ISIRI 2901) keyboard layouts.
- **Jalali Calendar:** 
    - **GNOME:** Installs "Extension Manager" to easily find and install the Jalali Calendar extension.
    - **KDE Plasma 6:** Automatically configures the system clock to use the Persian calendar.
- **App Localization:** Installs Persian language packs for **Firefox-ESR** and **LibreOffice**.
- **System Standards:** Uses `im-config` and official locale generation to ensure system stability.
- **Terminal Optimization:** Optimizes RTL text rendering hints for modern terminal emulators.

---

## Installation Steps

To install DebiOmid on a fresh install of Debian 13 (Trixie), follow these steps:
1. Run the Installation Script
Open your terminal and run the following one-liner command. It will download and execute the script with the necessary administrative privileges:

sudo wget -O- https://raw.githubusercontent.com/delejos/DebiOmid/main/setup.sh | sudo bash

2. Apply Changes
Once the script finishes, you must Logout and Login again (or restart your computer) to activate the new system environment variables and the input method framework.

4. Configure the Persian Keyboard
Open the Fcitx5 Configuration tool from your application menu.
Click the Add (+) button (uncheck "Only Show Current Language" if necessary).
Search for Persian (m17n) and add it.
Go to the Global Options tab to verify or set your preferred toggle shortcut (default is usually Ctrl+Space or Alt+Shift).

5. Enable Jalali Calendar (GNOME Users Only)
Open the Extension Manager app installed by the script.
Go to the Browse tab.
Search for "Persian Calendar" or "Jalali" and click Install.

---

## Post-Installation Steps
1. **Restart:** Logout and Log back in to apply the new environment variables.
2. **Keyboard Configuration:** Open **Fcitx5 Configuration**, click the "Add" (+) button, and search for **Persian (m17n)**.
3. **GNOME Users:** Open the **Extension Manager** app, go to the "Browse" tab, and search for **"Persian Calendar"** to install it.

## License
This project is licensed under the MIT License.

---

<div dir="rtl">

# دبی‌امید (DebiOmid): فارسی‌سازی دبیان ۱۳
پروژه‌ی «دبی‌امید» (ترکیبی از دبیان و امید) یک اسکریپت حرفه‌ای برای آماده‌سازی و فارسی‌سازی کامل دبیان ۱۳ (Trixie) است. این اسکریپت با استفاده از مخازن رسمی دبیان، فونت‌های باکیفیت، سیستم ورودی مدرن و تقویم جلالی را به سیستم شما اضافه می‌کند.

## ویژگی‌ها
- **تایپوگرافی مدرن:** نصب پکیج‌های رسمی `fonts-vazirmatn` و `fonts-noto-core` برای نمایش بی‌نقص متون فارسی.
- **تایپ فارسی:** تنظیم و پیکربندی **Fcitx5** به همراه موتور `m17n` برای دقیق‌ترین چیدمان کیبورد فارسی (استاندارد ۲۹۰۱).
- **تقویم جلالی:**
    - **در گنوم (GNOME):** نصب Extension Manager برای جستجو و نصب آسان افزونه تقویم جلالی.
    - **در کی‌دی‌ئی (KDE Plasma 6):** تنظیم خودکار ساعت سیستم برای نمایش تاریخ خورشیدی.
- **فارسی‌سازی برنامه‌ها:** نصب بسته‌های زبان فارسی برای مرورگر **Firefox** و مجموعه **LibreOffice**.
- **استاندارد دبیان:** استفاده از `im-config` و تولید Localeهای سیستمی طبق استانداردهای رسمی دبیان.
- **بهینه‌سازی ترمینال:** اعمال تنظیمات لازم برای نمایش بهتر متون راست‌به‌چپ در محیط ترمینال.

---


برای نصب دبی‌امید (DebiOmid) روی دبیان ۱۳ (Trixie)، مراحل زیر را دنبال کنید:
۱. اجرای اسکریپت نصب
ترمینال خود را باز کرده و دستور تک‌خطی زیر را اجرا کنید. این دستور اسکریپت را دانلود کرده و با دسترسی مدیریت (root) اجرا می‌کند:

---
wget -O- https://raw.githubusercontent.com/delejos/DebiOmid/main/setup.sh | sudo bash
---

۲. اعمال تغییرات
پس از پایان کار اسکریپت، حتماً یک‌بار از سیستم خارج (Logout) و دوباره وارد (Login) شوید (یا سیستم را ری‌استارت کنید) تا متغیرهای محیطی و سیستم ورودی جدید فعال شوند.
۳. تنظیم صفحه‌کلید فارسی
۱. برنامه Fcitx5 Configuration را از منوی برنامه‌های خود باز کنید.
۲. روی دکمه اضافه کردن (+) کلیک کنید (در صورت نیاز تیک گزینه Only Show Current Language را بردارید).
۳. عبارت Persian (m17n) را جستجو کرده و آن را اضافه کنید.
۴. در تب Global Options می‌توانید کلید میانبر برای تعویض زبان (معمولاً Alt+Shift یا Ctrl+Space) را بررسی یا تنظیم کنید.
۴. فعال‌سازی تقویم جلالی (فقط مخصوص کاربران گنوم)
۱. برنامه Extension Manager را که توسط اسکریپت نصب شده است، باز کنید.
۲. به تب Browse بروید.
۳. عبارت "Persian Calendar" یا "Jalali" را جستجو کرده و روی دکمه Install کلیک کنید.

---

## مراحل نهایی پس از نصب
۱. **راه‌اندازی مجدد:** یک‌بار از سیستم خارج و دوباره وارد شوید (Log out/in).
۲. **تنظیم کیبورد:** برنامه **Fcitx5 Configuration** را باز کرده، روی علامت «+» کلیک کنید و عبارت **Persian (m17n)** را جستجو و اضافه کنید.
۳. **کاربران گنوم:** برنامه **Extension Manager** را باز کنید، به بخش **Browse** بروید و با جستجوی عبارت **Persian Calendar**، آن را نصب کنید.

## لایسنس
این پروژه تحت لایسنس MIT منتشر شده است.

</div>
</div>
