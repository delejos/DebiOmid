# DebiOmid: Debian 13 (Trixie) Farsi Localization

A professional post-install script to perfectly localize Debian 13 (Trixie) for Farsi speakers. This project focuses on high-quality typography, the Jalali calendar, and modern input methods using 100% official Debian repositories.

---

## Features
* **Modern Typography**: Installs official Debian 13 packages for `fonts-vazirmatn` (Variable and Static) and `fonts-noto-arabic`.
* **Jalali Calendar**: 
    * **GNOME**: Installs the Jalali Calendar extension and the Extension Manager for easy activation.
    * **KDE Plasma 6**: Automatically configures the system clock to use the Persian calendar via `kwriteconfig6`.
* **Modern Input Method**: Sets up **Fcitx5** with Persian layouts and system-wide environment variables for a seamless typing experience.
* **App Localization**: Installs Persian language packs for Firefox-ESR and LibreOffice.
* **System Locale**: Generates `fa_IR.UTF-8` while maintaining system stability.
* **Terminal Optimization**: Adds Right-to-Left (RTL) rendering hints for modern terminal emulators.

## Installation
Run the following one-liner on a fresh Debian 13 install:

wget -O- https://raw.githubusercontent.com/delejos/DebiOmid/main/setup.sh | sudo bash

---

## Post-Installation Steps
Restart: Logout and Log back in to apply environment variables and session settings.

Keyboard Configuration: Open Fcitx5 Configuration and add "Persian" to your input methods. Set your preferred toggle key (e.g., Alt+Shift) in the Global Options tab.

GNOME Users: Open Extension Manager to enable the "Jalali Calendar" extension.

License
This project is licensed under the MIT License.



# دبی‌امید (DebiOmid): فارسی‌سازی دبیان ۱۳

این پروژه شامل یک اسکریپت حرفه‌ای برای بهینه‌سازی دبیان ۱۳ (Trixie) برای کاربران فارسی‌زبان است. تمرکز این اسکریپت بر استفاده از پکیج‌های رسمی دبیان، تایپوگرافی مدرن و پایداری سیستم است.

## ویژگی‌ها

* **تایپوگرافی مدرن:** نصب فونت‌های رسمی `fonts-vazirmatn` و `fonts-noto-arabic` مستقیماً از مخازن دبیان ۱۳.
* **تقویم جلالی:**
    * **در گنوم (GNOME):** نصب افزونه تقویم جلالی و ابزار مدیریت افزونه‌ها (Extension Manager).
    * **در کی‌دی‌ئی (KDE Plasma 6):** تنظیم خودکار ساعت سیستم برای نمایش تاریخ خورشیدی.
* **سیستم ورودی مدرن:** نصب و پیکربندی **Fcitx5** به همراه چیدمان فارسی و تنظیم متغیرهای محیطی.
* **فارسی‌سازی نرم‌افزارها:** نصب بسته‌های زبان فارسی برای مرورگر فایرفاکس و مجموعه لیبره‌آفیس.
* **تنظیمات محلی:** تولید کد زبان `fa_IR.UTF-8` با حفظ پایداری کامل سیستم.
* **بهینه‌سازی ترمینال:** اعمال تنظیمات لازم برای نمایش بهتر متون راست‌به‌چپ.

## روش نصب

دستور زیر را در ترمینال دبیان ۱۳ اجرا کنید:


wget -O- [https://raw.githubusercontent.com/delejos/DebiOmid/main/setup.sh](https://raw.githubusercontent.com/delejos/DebiOmid/main/setup.sh) | sudo bash
## مراحل نهایی پس از نصب

۱. راه‌اندازی مجدد: یک‌بار از سیستم خارج و دوباره وارد شوید (Log out/in).

۲. تنظیم کیبورد: برنامه Fcitx5 Configuration را باز کرده و زبان Persian را اضافه کنید. کلید میانبر (مانند Alt+Shift) را در بخش Global Options تنظیم کنید.

۳. کاربران گنوم: برنامه Extension Manager را باز کرده و افزونه Jalali Calendar را فعال کنید.

لایسنس
این پروژه تحت لایسنس MIT منتشر شده است
