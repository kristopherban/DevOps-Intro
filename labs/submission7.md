1. 
cat desired-state.txt
 "\n=== current-state.txt ==="
cat current-state.txtversion: 1.0
app: myapp
replicas: 3
anechka@DESKTOP-SN3QH7B:~/gitops-lab$ echo -e "\n=== current-state.txt ==="

=== current-state.txt ===
anechka@DESKTOP-SN3QH7B:~/gitops-lab$ cat current-state.txt
version: 1.0
app: myapp
replicas: 3
anechka@DESKTOP-SN3QH7B:~/gitops-lab$

cat > reconcile.sh << 'EOF'
> #!/bin/bash
> # reconcile.sh - GitOps цикл согласования
>
cat des> DESIRED=$(cat desired-state.txt)
> CURRENT=$(cat current-state.txt)
>
$DESIR> if [ "$DESIRED" != "$CURRENT" ]; then
>     echo "$(date) - ⚠️ ОБНАРУЖЕНО РАСХОЖДЕНИЕ!"
>     echo "Приведение текущего состояния к желаемому..."
>     cp desired-state.txt current-state.txt
>     echo "$(date) - ✅ Согласование завершено"
> else
>     echo "$(date) - ✅ Состояния синхронизированы"
> fi
> EOF
x reconcile.shanechka@DESKTOP-SN3QH7B:~/gitops-lab$
anechka@DESKTOP-SN3QH7B:~/gitops-lab$ chmod +x reconcile.sh
anechka@DESKTOP-SN3QH7B:~/gitops-lab$ ls -la reconcile.sh
econcile.sh-rwxr-xr-x 1 anechka anechka 539 Mar 18 14:49 reconcile.sh
anechka@DESKTOP-SN3QH7B:~/gitops-lab$ ./reconcile.sh
Wed Mar 18 14:49:43 MSK 2026 - ✅ Состояния синхронизированы
anechka@DESKTOP-SN3QH7B:~/gitops-lab$


# Создаем расхождение - изменяем текущее состояние
ho "veranechka@DESKTOP-SN3QH7B:~/gitops-lab$ echo "version: 2.0" > current-state.txt
myapp" >> current-sanechka@DESKTOP-SN3QH7B:~/gitops-lab$ echo "app: myapp" >> current-state.txt
anechka@DESKTOP-SN3QH7B:~/gitops-lab$ echo "replicas: 5" >> current-state.txt

# Проверяем anechka@DESKTOP-SN3QH7B:~/gitops-lab$
anechka@DESKTOP-SN3QH7B:~/gitops-lab$ # Проверяем разницу между файлами
anechka@DESKTOP-SN3QH7B:~/gitops-lab$ echo "Разница между желаемым и текущим состоянием:"
Разница между желаемым и текущим состоянием:
ff desiranechka@DESKTOP-SN3QH7B:~/gitops-lab$ diff desired-state.txt current-state.txt
# Запускаем скрипт согласования
echo -e "\nЗапуск reconcile.sh:"
./reconcile.sh

# Проверяем,1c1
< version: 1.0
---
> version: 2.0
3c3
< replicas: 3
---
> replicas: 5
anechka@DESKTOP-SN3QH7B:~/gitops-lab$
 что соanechka@DESKTOP-SN3QH7B:~/gitops-lab$ # Запускаем скрипт согласования
anechka@DESKTOP-SN3QH7B:~/gitops-lab$ echo -e "\nЗапуск reconcile.sh:"

Запуск reconcile.sh:
стояние anechka@DESKTOP-SN3QH7B:~/gitops-lab$ ./reconcile.sh
исправлено
echo -e "\nТекущее состояние после согласования:"
cat current-state.txtWed Mar 18 14:50:33 MSK 2026 - ⚠️ ОБНАРУЖЕНО РАСХОЖДЕНИЕ!
Приведение текущего состояния к желаемому...
Wed Mar 18 14:50:33 MSK 2026 - ✅ Согласование завершено
anechka@DESKTOP-SN3QH7B:~/gitops-lab$
anechka@DESKTOP-SN3QH7B:~/gitops-lab$ # Проверяем, что состояние исправлено
anechka@DESKTOP-SN3QH7B:~/gitops-lab$ echo -e "\nТекущее состояние после согласования:"

Текущее состояние после согласования:
anechka@DESKTOP-SN3QH7B:~/gitops-lab$ cat current-state.txt
version: 1.0
app: myapp
replicas: 3
anechka@DESKTOP-SN3QH7B:~/gitops-lab$




Терминал нашел расходжение, а после исправил его и вновь вернул текст: Every 5.0s: ./reconcile.sh                                                     DESKTOP-SN3QH7B: Wed Mar 18 14:55:02 2026
Wed Mar 18 14:55:02 MSK 2026 - ✅ Состояния синхронизированы


## Преимущества декларативной конфигурации перед императивными командами в продакшене:

1. **Единый источник правды** — вся конфигурация хранится в Git, а не в истории команд разработчиков
    
2. **Полная воспроизводимость** — можно развернуть идентичную среду из любой точки времени (коммита)
    
3. **Аудит и контроль изменений** — каждый change трекается через коммиты, видно кто, что и когда изменил
    
4. **Простой откат** — при проблемах достаточно сделать `git revert`, вместо восстановления "на коленке"
    
5. **Самоисцеление (self-healing)** — система автоматически возвращает желаемое состояние при дрейфе
    
6. **Устранение человеческого фактора** — нет ошибок от ручного ввода команд
    
7. **Code review** — все изменения проходят ревью через PR/MR, в отличие от прямого доступа к серверам














2 
cat health.log
Wed Mar 18 14:59:44 MSK 2026 - ✅ OK: Состояния синхронизированы
anechka@DESKTOP-SN3QH7B:~/gitops-lab$


cat health.log
Wed Mar 18 14:59:44 MSK 2026 - ✅ OK: Состояния синхронизированы
Wed Mar 18 15:01:41 MSK 2026 - ❌ КРИТИЧНО: Обнаружено несоответствие состояния!
  Желаемое MD5: a15a1a4f965ecd8f9e23a33a6b543155
  Текущее MD5: 48168ff3ab5ffc0214e81c7e2ee356f5
anechka@DESKTOP-SN3QH7B:~/gitops-lab$



$ cat health.log
Wed Mar 18 14:59:44 MSK 2026 - ✅ OK: Состояния синхронизированы
Wed Mar 18 15:01:41 MSK 2026 - ❌ КРИТИЧНО: Обнаружено несоответствие состояния!
  Желаемое MD5: a15a1a4f965ecd8f9e23a33a6b543155
  Текущее MD5: 48168ff3ab5ffc0214e81c7e2ee356f5
Wed Mar 18 15:01:59 MSK 2026 - ✅ OK: Состояния синхронизированы
anechka@DESKTOP-SN3QH7B:~/gitops-lab$

cat health.log
Wed Mar 18 14:59:44 MSK 2026 - ✅ OK: Состояния синхронизированы
Wed Mar 18 15:01:41 MSK 2026 - ❌ КРИТИЧНО: Обнаружено несоответствие состояния!
  Желаемое MD5: a15a1a4f965ecd8f9e23a33a6b543155
  Текущее MD5: 48168ff3ab5ffc0214e81c7e2ee356f5
Wed Mar 18 15:01:59 MSK 2026 - ✅ OK: Состояния синхронизированы
Wed Mar 18 15:03:22 MSK 2026 - ❌ КРИТИЧНО: Обнаружено несоответствие состояния!
  Желаемое MD5: a15a1a4f965ecd8f9e23a33a6b543155
  Текущее MD5: 827dd28066414158c3c576a9d5b72c34
Wed Mar 18 15:03:25 MSK 2026 - ✅ OK: Состояния синхронизированы
Wed Mar 18 15:03:28 MSK 2026 - ✅ OK: Состояния синхронизированы
Wed Mar 18 15:03:31 MSK 2026 - ✅ OK: Состояния синхронизированы
Wed Mar 18 15:03:34 MSK 2026 - ✅ OK: Состояния синхронизированы
Wed Mar 18 15:03:37 MSK 2026 - ✅ OK: Состояния синхронизированы
Wed Mar 18 15:03:40 MSK 2026 - ✅ OK: Состояния синхронизированы
Wed Mar 18 15:03:43 MSK 2026 - ✅ OK: Состояния синхронизированы
Wed Mar 18 15:03:46 MSK 2026 - ✅ OK: Состояния синхронизированы
Wed Mar 18 15:03:49 MSK 2026 - ✅ OK: Состояния синхронизированы






## Анализ: как контрольные суммы (MD5) помогают обнаруживать изменения в конфигурации?

Контрольные суммы MD5 работают как уникальный цифровой отпечаток файла. Даже минимальное изменение содержимого (добавление пробела, изменение одной буквы) приводит к полному изменению хеша. Это позволяет:

- Мгновенно обнаруживать любые модификации без построчного сравнения
    
- Исключить человеческий фактор при проверке
    
- Создать объективный критерий идентичности файлов
    
- Эффективно сканировать большие конфигурации за миллисекунды
    

## Сравнение: как это соотносится с инструментами GitOps, такими как «Статус синхронизации» в ArgoCD?

В нашей симуляции мы воспроизвели точную логику ArgoCD:

- **desired-state.txt** → Git-репозиторий в ArgoCD (источник истины)
    
- **current-state.txt** → фактическое состояние Kubernetes кластера
    
- **MD5 хеши** → commit hashes и resource versions в ArgoCD
    
- **Сравнение MD5** → механизм сравнения манифестов в ArgoCD
    
- **❌ КРИТИЧНО** → статус **OutOfSync** в ArgoCD (обнаружен дрейф)
    
- **✅ OK** → статус **Synced** в ArgoCD (все синхронизировано)
    

Оба подхода используют один принцип: вычисление уникальных идентификаторов для желаемого и текущего состояния с последующим сравнением. Это основа GitOps — автоматическое обнаружение и устранение конфигурационного дрейфа.


























































































































































































































