متشکرم که به این نکته اشاره کردید. در اینجا نسخه اصلاح شده README آمده است:
README برای GitHub (دو زبانه: فارسی و انگلیسی)

اسکریپت دیسکانکت کردن تمامی کاربران ocserv
این اسکریپت Bash برای دیسکانکت کردن تمامی کاربران متصل به ocserv استفاده می‌شود. این اسکریپت لیست کاربران متصل را دریافت کرده و هر یک را دیسکانکت می‌کند.
نحوه عملکرد


دریافت لیست کاربران:

اسکریپت لیست کاربران متصل به ocserv را با استفاده از دستور occtl show users دریافت می‌کند.
ستون دوم خروجی را با استفاده از awk '{print $2}' استخراج می‌کند که شامل شناسه‌های کاربران است.
فقط شناسه‌هایی که شامل اعداد هستند را با استفاده از grep -E '^[0-9]+$' فیلتر می‌کند.



دیسکانکت کردن کاربران:

برای هر شناسه کاربر که در مرحله قبل استخراج شده است، دستور occtl disconnect user $user را اجرا می‌کند تا کاربر را دیسکانکت کند.



پیش‌نیازها

اطمینان حاصل کنید که occtl نصب و به درستی پیکربندی شده است.
اسکریپت نیاز به دسترسی sudo برای اجرای دستورات occtl دارد.

اسکریپت
    bash
    کپی کد
  #!/bin/bash

# Get Users list
users=$(sudo occtl show users | awk '{print $2}' | grep -E '^[0-9]+$')

# Disconnect Users
for user in $users; do
    sudo occtl disconnect user $user
done

نحوه اجرا
CentOS و Ubuntu

اسکریپت را در یک فایل ذخیره کنید، مثلاً disconnect_ocserv_users.sh.
اسکریپت را اجرایی کنید:    bash
    کپی کد
  chmod +x disconnect_ocserv_users.sh


اسکریپت را با sudo اجرا کنید:    bash
    کپی کد
  sudo ./disconnect_ocserv_users.sh



نکات

اطمینان حاصل کنید که دستور occtl در PATH شما موجود است.
اسکریپت باید با دسترسی sudo اجرا شود تا کاربران را دیسکانکت کند.


Disconnect All ocserv Users Script
This Bash script is used to disconnect all users connected to ocserv. It retrieves the list of connected users and disconnects each one.
How It Works


Get Users list:

The script retrieves the list of users connected to ocserv using the command occtl show users.
It extracts the second column of the output using awk '{print $2}', which contains the user IDs.
It filters only the IDs that are numeric using grep -E '^[0-9]+$'.



Disconnect Users:

For each user ID extracted in the previous step, it executes the command occtl disconnect user $user to disconnect the user.



Prerequisites

Ensure occtl is installed and properly configured on your system.
The script requires sudo privileges to execute occtl commands.

Script
    bash
    کپی کد
  #!/bin/bash

# Get Users list
users=$(sudo occtl show users | awk '{print $2}' | grep -E '^[0-9]+$')

# Disconnect Users
for user in $users; do
    sudo occtl disconnect user $user
done

How to Run
CentOS and Ubuntu

Save the script to a file, e.g., disconnect_ocserv_users.sh.
Make the script executable:    bash
    کپی کد
  chmod +x disconnect_ocserv_users.sh


Run the script with sudo:    bash
    کپی کد
  sudo ./disconnect_ocserv_users.sh



Notes

Ensure that the occtl command is available in your PATH.
The script must be run with sudo privileges to disconnect users.


این README شامل توضیحات کامل به دو زبان فارسی و انگلیسی در مورد عملکرد اسکریپت، نحوه اجرای آن در سیستم‌عامل‌های CentOS و Ubuntu و نکات ضروری است. می‌توانید این متن را در فایل README.md پروژه GitHub خود قرار دهید.
