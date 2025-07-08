#!/bin/bash

# اسم المجلد اللي راح نثبت فيه المشروع
PROJECT_DIR="$HOME/cam-capture"

# نطبع بداية التثبيت
echo "📦 جاري تثبيت المشروع..."

# تحميل المشروع من GitHub
git clone https://github.com/aissaboukortt/Termux-Scripts.git $PROJECT_DIR

# ندخل للمجلد
cd $PROJECT_DIR || exit

# تثبيت Flask (نتأكد أنه موجود)
pkg install -y python
pip install flask

# إنشاء المجلدات الضرورية
mkdir -p images
mkdir -p metadata

# نعطي صلاحية تشغيل لملف app.py
chmod +x app.py

# إنهاء
echo "✅ التثبيت كمل بنجاح!"
echo "🚀 لتشغيل المشروع: cd $PROJECT_DIR && python app.py"
