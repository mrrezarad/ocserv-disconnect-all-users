این اسکریپت Bash برای دیسکانکت کردن تمامی کاربران متصل به ocserv استفاده می‌شود. عملکرد کد به شرح زیر است:

دریافت لیست کاربران:

با استفاده از دستور occtl show users، لیست کاربران متصل به ocserv را دریافت می‌کند.
با استفاده از awk '{print $2}'، ستون دوم خروجی را استخراج می‌کند که شامل شناسه‌های کاربران است.
با استفاده از grep -E '^[0-9]+$'، فقط شناسه‌هایی که شامل اعداد هستند را فیلتر می‌کند.
دیسکانکت کردن کاربران:

برای هر شناسه کاربر که در مرحله قبل استخراج شده است، دستور occtl disconnect user $user را اجرا می‌کند تا کاربر را دیسکانکت کند.
عملکرد کد به انگلیسی:
This Bash script is used to disconnect all users connected to ocserv. The functionality of the code is as follows:

Get Users list:

It retrieves the list of users connected to ocserv using the command occtl show users.
It extracts the second column of the output using awk '{print $2}', which contains the user IDs.
It filters only the IDs that are numeric using grep -E '^[0-9]+$'.
Disconnect Users:

For each user ID extracted in the previous step, it executes the command occtl disconnect user $user to disconnect the user.
