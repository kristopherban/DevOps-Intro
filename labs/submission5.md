1. 
VirtualBox 7.2.4
Windows 10 Pro 22H2
проблемы: сначала забыла выделить достаточно оперативки и ядер

2. 
### CPU
lscpu
- Архитектура: x86_64
    
- Модель: AMD Ryzen 5 7530U 
    
- Ядер: 2

### RAM 
free -h
6,6 Gj - всего 
4,1 Gj - свободно


### Сеть 
Интерфейс: enp0s3
ip addr: 127.X.X.X

### OS и ядро
uname -a
lsb_release -a
Ubuntu 24.04 LTS
Kernel: 6.17.0-14-generic

### Virtualization
systemd-detect-virt
 VirtualBox

Команды `lscpu`, `free` и `ip addr` были наиболее полезными, потому что они показывают информацию о процессоре, памяти и сети. Эти команды помогают быстро получить основные данные о системе.
