1.1 

systemd-analyze
Startup finished in 2.895s (userspace)
graphical.target reached after 2.842s in userspace.

Система загрузила основные службы за 2.895 секунд, что очень быстро, следовательно можно сделать выводы, что отсутствуют задержки при инициализации. 

 systemd-analyze blame

1.513s landscape-client.service
1.513s landscape-client.service
 731ms dev-sdd.device
 544ms snapd.seeded.service
 498ms systemd-udev-trigger.service
...

Серьезных задержек при запуске нет. 


uptime
 21:57:52 up 15 min,  1 user,  load average: 0.00, 0.00, 0.00
 
Средняя нагрузка (load average) равна 0.00 за последние 1, 5 и 15 минут, что указывает на отсутствие нагрузки на процессор.  
Система находится в полностью стабильном состоянии.

 w
 21:59:34 up 17 min,  1 user,  load average: 0.00, 0.00, 0.00
USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU  WHAT
user1  pts/1    -                21:42   17:05   0.05s  0.04s -bash


1.2
 ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -n 6
    PID    PPID CMD                         %MEM %CPU
    217       1 /usr/bin/python3 /usr/share  0.2  0.0
     42       1 /usr/lib/systemd/systemd-jo  0.1  0.0
    111       1 /usr/lib/systemd/systemd-re  0.1  0.0
      1       0 /sbin/init                   0.1  0.1
    187       1 /usr/libexec/wsl-pro-servic  0.1  0.0

Самый потребляющий память процесс — /usr/bin/python3 (PID 217), использующий 0.2% памяти.  
Общее потребление ресурсов минимальное.

ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 6
    PID    PPID CMD                         %MEM %CPU
      1       0 /sbin/init                   0.1  0.1
     42       1 /usr/lib/systemd/systemd-jo  0.1  0.0
     92       1 /usr/lib/systemd/systemd-ud  0.0  0.0
    172       1 @dbus-daemon --system --add  0.0  0.0
    367       1 /usr/lib/systemd/systemd --  0.1  0.0

По использованию CPU

Максимальная загрузка CPU составляет 0.1% (/sbin/init).  
Остальные процессы практически не используют процессор.  
Система находится в состоянии простоя и работает стабильно.

systemctl list-dependencies multi-user.target --no-pager
multi-user.target
○ ├─apport.service
● ├─console-setup.service
● ├─cron.service
● ├─dbus.service
○ ├─dmesg.service
○ ├─e2scrub_reap.service
○ ├─landscape-client.service
○ ├─networkd-dispatcher.service
● ├─rsyslog.service
○ ├─snapd.apparmor.service
○ ├─snapd.autoimport.service
○ ├─snapd.core-fixup.service
○ ├─snapd.recovery-chooser-trigger.service
● ├─snapd.seeded.service
○ ├─snapd.service
● ├─systemd-ask-password-wall.path
● ├─systemd-logind.service
○ ├─systemd-update-utmp-runlevel.service
● ├─systemd-user-sessions.service
○ ├─ua-reboot-cmds.service
○ ├─ubuntu-advantage.service
● ├─unattended-upgrades.service
● ├─wsl-pro.service
● ├─basic.target
○ │ ├─tmp.mount
● │ ├─paths.target
○ │ │ └─apport-autoreport.path
● │ ├─slices.target
● │ │ ├─-.slice
● │ │ └─system.slice
● │ ├─sockets.target
● │ │ ├─apport-forward.socket
● │ │ ├─dbus.socket
● │ │ ├─snapd.socket
● │ │ ├─systemd-initctl.socket
● │ │ ├─systemd-journald-dev-log.socket
● │ │ ├─systemd-journald.socket
○ │ │ ├─systemd-pcrextend.socket
● │ │ ├─systemd-sysext.socket
● │ │ ├─systemd-udevd-control.socket
● │ │ ├─systemd-udevd-kernel.socket
● │ │ └─uuidd.socket
● │ ├─sysinit.target
○ │ │ ├─apparmor.service
● │ │ ├─dev-hugepages.mount
● │ │ ├─dev-mqueue.mount
● │ │ ├─keyboard-setup.service
● │ │ ├─kmod-static-nodes.service
○ │ │ ├─ldconfig.service
○ │ │ ├─proc-sys-fs-binfmt_misc.automount
● │ │ ├─setvtrgb.service
● │ │ ├─sys-fs-fuse-connections.mount
● │ │ ├─sys-kernel-config.mount
● │ │ ├─sys-kernel-debug.mount
● │ │ ├─sys-kernel-tracing.mount
● │ │ ├─systemd-ask-password-console.path
● │ │ ├─systemd-binfmt.service
○ │ │ ├─systemd-firstboot.service
○ │ │ ├─systemd-hwdb-update.service
○ │ │ ├─systemd-journal-catalog-update.service
● │ │ ├─systemd-journal-flush.service
● │ │ ├─systemd-journald.service
○ │ │ ├─systemd-machine-id-commit.service
● │ │ ├─systemd-modules-load.service
○ │ │ ├─systemd-pcrmachine.service
○ │ │ ├─systemd-pcrphase-sysinit.service
○ │ │ ├─systemd-pcrphase.service
○ │ │ ├─systemd-pstore.service
○ │ │ ├─systemd-random-seed.service
○ │ │ ├─systemd-repart.service
● │ │ ├─systemd-resolved.service
● │ │ ├─systemd-sysctl.service
○ │ │ ├─systemd-sysusers.service
● │ │ ├─systemd-timesyncd.service
● │ │ ├─systemd-tmpfiles-setup-dev-early.service
● │ │ ├─systemd-tmpfiles-setup-dev.service
● │ │ ├─systemd-tmpfiles-setup.service
○ │ │ ├─systemd-tpm2-setup-early.service
○ │ │ ├─systemd-tpm2-setup.service
● │ │ ├─systemd-udev-trigger.service
● │ │ ├─systemd-udevd.service
○ │ │ ├─systemd-update-done.service
● │ │ ├─systemd-update-utmp.service
● │ │ ├─cryptsetup.target
● │ │ ├─integritysetup.target
● │ │ ├─local-fs.target
● │ │ │ └─systemd-remount-fs.service
● │ │ ├─swap.target
● │ │ └─veritysetup.target
● │ └─timers.target
○ │   ├─apport-autoreport.timer
● │   ├─apt-daily-upgrade.timer
● │   ├─apt-daily.timer
● │   ├─dpkg-db-backup.timer
● │   ├─e2scrub_all.timer
○ │   ├─fstrim.timer
● │   ├─logrotate.timer
● │   ├─man-db.timer
● │   ├─motd-news.timer
○ │   ├─snapd.snap-repair.timer
● │   ├─systemd-tmpfiles-clean.timer
○ │   └─ua-timer.timer
● ├─getty.target
● │ ├─console-getty.service
○ │ ├─getty-static.service
● │ └─getty@tty1.service
● └─remote-fs.target


- **●** — активные сервисы
- **○** — неактивные или зависимые


who -a
           system boot  2026-02-24 21:42
           run-level 5  2026-02-24 21:42
LOGIN      console      2026-02-24 21:42               190 id=cons
LOGIN      tty1         2026-02-24 21:42               211 id=tty1
 user1  - pts/1        2026-02-24 21:42 03:26         394
 
 last -n 5
reboot   system boot  6.6.87.2-microso Tue Feb 24 21:42   still running
reboot   system boot  6.6.87.2-microso Wed Feb 18 13:35   still running
reboot   system boot  6.6.87.2-microso Tue Feb 17 18:59   still running
reboot   system boot  6.6.87.2-microso Tue Feb 10 15:47 - 20:00  (04:12)
reboot   system boot  6.6.87.2-microso Mon Feb  2 13:34 - 16:41  (03:06)

wtmp begins Sun Feb  1 21:32:36 2026

В системе активен один пользователь. Все логины нормальные, подозрительных сессий нет. Данные обезличены.

free -h
oc/meminfo | grep -e MemTotal -e SwapTotal -e MemAvailable               total        used        free      shared  buff/cache   available
Mem:           7.4Gi       515Mi       6.9Gi       3.5Mi       242Mi       6.9Gi
Swap:          2.0Gi          0B       2.0Gi

cat /proc/meminfo | grep -e MemTotal -e SwapTotal -e MemAvailable
MemTotal:        7810248 kB
MemAvailable:    7282096 kB
SwapTotal:       2097152 kB

Память распределена эффективно, система работает с минимальной нагрузкой.



2.1

traceroute to github.com (140.82.121.3), 30 hops max, 60 byte packets
 1  [МОЙ_КОМПЬЮТЕР] ([ЛОКАЛЬНЫЙ_IP])  0.734 ms  0.641 ms  0.626 ms
 2  192.168.0.Х (192.168.0.Х)  3.630 ms  3.597 ms  3.531 ms
 3  * * *
 ...
30  * * *

Звездочки говорят о том, что  промежуточные маршрутизаторы не отвечают на ICMP-запросы

; <<>> DiG 9.18.39-0ubuntu0.24.04.2-Ubuntu <<>> github.com
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 35848
;; flags: qr rd ad; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 0

;; QUESTION SECTION:
;github.com.                    IN      A

;; ANSWER SECTION:
github.com.             0       IN      A       140.82.121.4

;; Query time: 33 msec
;; SERVER: 172.22.224.1#53(172.22.224.1) (UDP)
;; WHEN: Wed Feb 25 12:07:02 MSK 2026
;; MSG SIZE  rcvd: 54


12:20:57.901389 eth0 Out IP [МОЙ_IP].44609 > [DNS_СЕРВЕР].53: 55754+ A? google.com. (51)
12:20:57.904669 eth0 In  IP [DNS_СЕРВЕР].53 > [МОЙ_IP].44609: 55754- 1/0/0 A 216.239.38.120 (54)


dig -x 8.8.4.4

; <<>> DiG 9.18.39-0ubuntu0.24.04.2-Ubuntu <<>> -x 8.8.4.4
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 15212
;; QUESTION SECTION:
;4.4.8.8.in-addr.arpa.          IN      PTR

;; ANSWER SECTION:
4.4.8.8.in-addr.arpa.   0       IN      PTR     dns.google.

;; Query time: 66 msec


dig -x 1.1.2.2


; <<>> DiG 9.18.39-0ubuntu0.24.04.2-Ubuntu <<>> -x 1.1.2.2
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NXDOMAIN, id: 10150
;; QUESTION SECTION:
;2.2.1.1.in-addr.arpa.          IN      PTR

;; AUTHORITY SECTION:
1.in-addr.arpa.         153     IN      SOA     ns.apnic.net. ...

;; Query time: 507 msec





Вывод:
Выполнены все задания: трассировка, DNS-запросы, захват трафика и обратные запросы. Все команды работают штатно, полученные данные соответствуют тому, что ожидалось.

