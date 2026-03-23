
Task 1

![[Pasted image 20260323132131.png]]


d/s     dkB/s   drqm/s  %drqm d_await dareq-sz     f/s f_await  aqu-sz  %util
sda              0.00      0.00     0.00   0.00    0.00     0.00    0.00      0.00     0.00   0.00    0.00     0.00    0.00      0.00     0.00   0.00    0.00     0.00    0.00    0.00    0.00   0.00
sdb              0.00      0.00     0.00   0.00    0.00     0.00    0.00      0.00     0.00   0.00    0.00     0.00    0.00      0.00     0.00   0.00    0.00     0.00    0.00    0.00    0.00   0.00
sdc              0.00      0.00     0.00   0.00    0.00     0.00    0.00      0.00     0.00   0.00    0.00     0.00    0.00      0.00     0.00   0.00    0.00     0.00    0.00    0.00    0.00   0.00
sdd              0.00      0.00     0.00   0.00    0.00     0.00    2.00     28.00     5.00  71.43    4.00    14.00    0.00      0.00     0.00   0.00    0.00     0.00    2.00    1.00    0.01   0.80


avg-cpu:  %user   %nice %system %iowait  %steal   %idle
           0.00    0.00    0.00    0.00    0.00  100.00

Device            r/s     rkB/s   rrqm/s  %rrqm r_await rareq-sz     w/s     wkB/s   wrqm/s  %wrqm w_await wareq-sz     d/s     dkB/s   drqm/s  %drqm d_await dareq-sz     f/s f_await  aqu-sz  %util
sda              0.00      0.00     0.00   0.00    0.00     0.00    0.00      0.00     0.00   0.00    0.00     0.00    0.00      0.00     0.00   0.00    0.00     0.00    0.00    0.00    0.00   0.00
sdb              0.00      0.00     0.00   0.00    0.00     0.00    0.00      0.00     0.00   0.00    0.00     0.00    0.00      0.00     0.00   0.00    0.00     0.00    0.00    0.00    0.00   0.00
sdc              0.00      0.00     0.00   0.00    0.00     0.00    0.00      0.00     0.00   0.00    0.00     0.00    0.00      0.00     0.00   0.00    0.00     0.00    0.00    0.00    0.00   0.00
sdd              0.00      0.00     0.00   0.00    0.00     0.00    0.00      0.00     0.00   0.00    0.00     0.00    0.00      0.00     0.00   0.00    0.00     0.00    0.00    0.00    0.00   0.00

Total DISK READ:         0.00 B/s | Total DISK WRITE:         0.00 B/s
Current DISK READ:       0.00 B/s | Current DISK WRITE:       0.00 B/s
    TID  PRIO  USER     DISK READ DISK WRITE>    COMMAND                                                                
 pidstat -d 1 5
Linux 6.6.87.2-microsoft-standard-WSL2 (DESKTOP-SN3QH7B)        03/23/26        _x86_64_        (12 CPU)

13:27:51      UID       PID   kB_rd/s   kB_wr/s kB_ccwr/s iodelay  Command

13:27:52      UID       PID   kB_rd/s   kB_wr/s kB_ccwr/s iodelay  Command

13:27:53      UID       PID   kB_rd/s   kB_wr/s kB_ccwr/s iodelay  Command

13:27:54      UID       PID   kB_rd/s   kB_wr/s kB_ccwr/s iodelay  Command

13:27:55      UID       PID   kB_rd/s   kB_wr/s kB_ccwr/s iodelay  Command

Average:      UID       PID   kB_rd/s   kB_wr/s kB_ccwr/s iodelay  Command
anechka@DESKTOP-SN3QH7B:~$

 df -h
Filesystem      Size  Used Avail Use% Mounted on
none            3.8G     0  3.8G   0% /usr/lib/modules/6.6.87.2-microsoft-standard-WSL2
none            3.8G  4.0K  3.8G   1% /mnt/wsl
drivers         126G   97G   29G  78% /usr/lib/wsl/drivers
/dev/sdd       1007G  2.5G  954G   1% /
none            3.8G  108K  3.8G   1% /mnt/wslg
none            3.8G     0  3.8G   0% /usr/lib/wsl/lib
rootfs          3.8G  2.7M  3.8G   1% /init
none            3.8G  548K  3.8G   1% /run
none            3.8G     0  3.8G   0% /run/lock
none            3.8G     0  3.8G   0% /run/shm
none            3.8G   96K  3.8G   1% /mnt/wslg/versions.txt
none            3.8G   96K  3.8G   1% /mnt/wslg/doc
C:\             126G   97G   29G  78% /mnt/c
tmpfs           763M   20K  763M   1% /run/user/1000
anechka@DESKTOP-SN3QH7B:~$


 sudo du -h /var 2>/dev/null | sort -rh | head -n 10
[sudo] password for anechka:
1.1G    /var
454M    /var/log
452M    /var/log/journal/24da942153284bbcbe833103ef3100e9
452M    /var/log/journal
438M    /var/lib
231M    /var/lib/apt/lists
231M    /var/lib/apt
177M    /var/lib/docker
176M    /var/lib/docker/overlay2
136M    /var/cache
anechka@DESKTOP-SN3QH7B:~$

 sudo find /var -type f -exec du -h {} + 2>/dev/null | sort -rh | head -n 3
70M     /var/lib/apt/lists/archive.ubuntu.com_ubuntu_dists_noble_universe_binary-amd64_Packages
60M     /var/cache/apt/srcpkgcache.bin
60M     /var/cache/apt/pkgcache.bin


Система находится в простое (CPU idle 100%, I/O активность 0.8%). Основное дисковое пространство занято:
- **Логами** (454 МБ) — требуется настройка ротации
- **Кэшем apt** (231 МБ) — можно очистить командой `sudo apt clean`
- **Docker** (177 МБ) — удалить неиспользуемые образы
Диск C:\ Windows заполнен на 78% — рекомендуется следить за свободным местом.
### Оптимизация
1. Очистить кэш apt: `sudo apt clean`
2. Настроить ротацию логов в `/etc/logrotate.conf`
3. Удалить неиспользуемые Docker образы: `docker system prune`
4. Настроить мониторинг диска с алертом при заполнении >80%


Task 2


https://www.terapiatv.ru/?utm_referrer=https%3A%2F%2Fwww.google.com%2F
![[Pasted image 20260323140600.png]]
![[Pasted image 20260323140539.png]]![[Pasted image 20260323140906.png]]


### Анализ

**Выбор проверок:**
- **API Check** — проверяет доступность сайта (статус 200)
- **Browser Check** — проверяет загрузку страницы и наличие контента

**Выбор порогов:**
- Частота: 5 и 10 минут — баланс между скоростью реакции и нагрузкой
- Алерт после 2 неудачных проверок — исключает ложные срабатывания
- Уведомление на email — просто и надежно

### Почему хорошо

Мониторинг позволяет:
- Быстро узнавать о сбоях до жалоб пользователей
- Отслеживать реальную доступность сайта
- Различать полную недоступность (API) и проблемы с интерфейсом (Browser)
- Исключить ложные срабатывания за счет порога в 2 неудачные проверки
