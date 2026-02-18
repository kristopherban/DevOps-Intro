
1.1
jobs - это единица работы, которая выполняется на одном раннере.
можно выполнять несколько одновременно, это экономит время.
steps - это самая маленькая единица работы. Каждый шаг это команда или действие.
Они выполняются последовательно. Если шаг упал, то весь job остановится.
Runner - это сервер, который выполняет jobs.
Trigger - это событие, которое запускает workflow.

Что я сделала:
1. Создала папку .github/workflows/
2. В нем сделала файл first-workflow.yml
3. Написала в нем код с одним job

1.2 Результаты
Ссылка на запуск: https://github.com/kristopherban/DevOps-Intro/actions/runs/22106879706/job/63892044751
Триггер: git push в ветку feature/lab3
Анализ: workflow запустился автоматически, Github выделил раннер
и все шаги были сделаны за 5 минут


2.1 
Я добавила ручной запуск и шаг для сбора информации 
Вывод:

Run echo "========== SYSTEM INFORMATION =========="

[](https://github.com/kristopherban/DevOps-Intro/actions/runs/22136154921/job/63988279141#step:3:24)========== SYSTEM INFORMATION ==========

[](https://github.com/kristopherban/DevOps-Intro/actions/runs/22136154921/job/63988279141#step:3:25)

[](https://github.com/kristopherban/DevOps-Intro/actions/runs/22136154921/job/63988279141#step:3:26)1. OPERATING SYSTEM

[](https://github.com/kristopherban/DevOps-Intro/actions/runs/22136154921/job/63988279141#step:3:27)-------------------

[](https://github.com/kristopherban/DevOps-Intro/actions/runs/22136154921/job/63988279141#step:3:28)Linux runnervmjduv7 6.14.0-1017-azure #17~24.04.1-Ubuntu SMP Mon Dec 1 20:10:50 UTC 2025 x86_64 x86_64 x86_64 GNU/Linux

[](https://github.com/kristopherban/DevOps-Intro/actions/runs/22136154921/job/63988279141#step:3:29)

[](https://github.com/kristopherban/DevOps-Intro/actions/runs/22136154921/job/63988279141#step:3:30)2. CPU INFO

[](https://github.com/kristopherban/DevOps-Intro/actions/runs/22136154921/job/63988279141#step:3:31)-----------

[](https://github.com/kristopherban/DevOps-Intro/actions/runs/22136154921/job/63988279141#step:3:32)Model name: AMD EPYC 7763 64-Core Processor

[](https://github.com/kristopherban/DevOps-Intro/actions/runs/22136154921/job/63988279141#step:3:33)Cores: 4

[](https://github.com/kristopherban/DevOps-Intro/actions/runs/22136154921/job/63988279141#step:3:34)

[](https://github.com/kristopherban/DevOps-Intro/actions/runs/22136154921/job/63988279141#step:3:35)3. MEMORY INFO

[](https://github.com/kristopherban/DevOps-Intro/actions/runs/22136154921/job/63988279141#step:3:36)--------------

[](https://github.com/kristopherban/DevOps-Intro/actions/runs/22136154921/job/63988279141#step:3:37)total used free shared buff/cache available

[](https://github.com/kristopherban/DevOps-Intro/actions/runs/22136154921/job/63988279141#step:3:38)Mem: 15Gi 823Mi 13Gi 39Mi 1.8Gi 14Gi

[](https://github.com/kristopherban/DevOps-Intro/actions/runs/22136154921/job/63988279141#step:3:39)Swap: 3.0Gi 0B 3.0Gi

[](https://github.com/kristopherban/DevOps-Intro/actions/runs/22136154921/job/63988279141#step:3:40)

[](https://github.com/kristopherban/DevOps-Intro/actions/runs/22136154921/job/63988279141#step:3:41)4. DISK INFO

[](https://github.com/kristopherban/DevOps-Intro/actions/runs/22136154921/job/63988279141#step:3:42)------------

[](https://github.com/kristopherban/DevOps-Intro/actions/runs/22136154921/job/63988279141#step:3:43)Filesystem Size Used Avail Use% Mounted on

[](https://github.com/kristopherban/DevOps-Intro/actions/runs/22136154921/job/63988279141#step:3:44)/dev/root 145G 53G 92G 37% /

[](https://github.com/kristopherban/DevOps-Intro/actions/runs/22136154921/job/63988279141#step:3:45)tmpfs 7.9G 84K 7.9G 1% /dev/shm

[](https://github.com/kristopherban/DevOps-Intro/actions/runs/22136154921/job/63988279141#step:3:46)tmpfs 3.2G 1000K 3.2G 1% /run

[](https://github.com/kristopherban/DevOps-Intro/actions/runs/22136154921/job/63988279141#step:3:47)tmpfs 5.0M 0 5.0M 0% /run/lock

[](https://github.com/kristopherban/DevOps-Intro/actions/runs/22136154921/job/63988279141#step:3:48)efivarfs 128M 32K 128M 1% /sys/firmware/efi/efivars

[](https://github.com/kristopherban/DevOps-Intro/actions/runs/22136154921/job/63988279141#step:3:49)/dev/sda16 881M 63M 757M 8% /boot

[](https://github.com/kristopherban/DevOps-Intro/actions/runs/22136154921/job/63988279141#step:3:50)/dev/sda15 105M 6.2M 99M 6% /boot/efi

[](https://github.com/kristopherban/DevOps-Intro/actions/runs/22136154921/job/63988279141#step:3:51)tmpfs 1.6G 12K 1.6G 1% /run/user/1001

[](https://github.com/kristopherban/DevOps-Intro/actions/runs/22136154921/job/63988279141#step:3:52)

Автоматический запуск удобен для постоянной интеграции, каждый push проверяет код.
Ручной запуск предоставляет нам контроль над проектом. 

GitHub предоставляет мощные виртуальные машины, которые не нужно настраивать и обслуживать. 
