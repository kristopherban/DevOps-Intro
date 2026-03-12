1. 
docker ps -a
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
 docker images ubuntu
REPOSITORY   TAG       IMAGE ID       CREATED       SIZE
ubuntu       latest    bbdabce66f1b   4 weeks ago   78.1MB

 docker run -it --name ubuntu_container ubuntu:latest
root@44693adf829d:/# cat /etc/os-release
PRETTY_NAME="Ubuntu 24.04.4 LTS"
NAME="Ubuntu"
VERSION_ID="24.04"
VERSION="24.04.4 LTS (Noble Numbat)"
VERSION_CODENAME=noble
ID=ubuntu
ID_LIKE=debian
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
UBUNTU_CODENAME=noble
LOGO=ubuntu-logo
root@44693adf829d:/# ps aux
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root           1  0.0  0.0   4588  3968 pts/0    Ss   13:40   0:00 /bin/bash
root          10  0.0  0.0   7888  4096 pts/0    R+   13:41   0:00 ps aux
root@44693adf829d:/# exit
exit
anechka@DESKTOP-SN3QH7B:~/labs/lab6$

 docker save -o ubuntu_image.tar ubuntu:latest
ls -lh ubuntu_image.taranechka@DESKTOP-SN3QH7B:~/labs/lab6$ ls -lh ubuntu_image.tar
-rw------- 1 anechka anechka 77M Mar 11 16:50 ubuntu_image.tar
anechka@DESKTOP-SN3QH7B:~/labs/lab6$

 docker rmi ubuntu:latest
Error response from daemon: conflict: unable to remove repository reference "ubuntu:latest" (must force) - container 44693adf829d is using its referenced image bbdabce66f1b
anechka@DESKTOP-SN3QH7B:~/labs/lab6$


Если у нас уже есть контейнер, который создан по шаблону, мы не можем удалить шаблон. 
Сначала мы должны удалить контейнер. 
Как будто у нас есть яйцо (контейнер), но нет курицы, так быть не может. 
Tar-файл содержит полную копию образа:
- Все слои файловой системы (каждый слой — изменения от предыдущего)
- Метаданные образа (конфигурация, переменные окружения)
- Информацию о том, как запускать контейнер (CMD, ENTRYPOINT и т.д.)
- Фактически это полный бэкап образа, который можно загрузить обратно в Docker через `docker load`
  
  
  
  docker rm ubuntu_container
ubuntu_container
anechka@DESKTOP-SN3QH7B:~/labs/lab6$ docker rmi ubuntu:latest
Untagged: ubuntu:latest
Untagged: ubuntu@sha256:d1e2e92c075e5ca139d51a140fff46f84315c0fdce203eab2807c7e495eff4f9
Deleted: sha256:bbdabce66f1b7dde0c081a6b4536d837cd81dd322dd8c99edd68860baf3b2db3
Deleted: sha256:efafae78d70c98626c521c246827389128e7d7ea442db31bc433934647f0c791
anechka@DESKTOP-SN3QH7B:~/labs/lab6$/



А уже после удаления контейнера все гуд. 

2.1
docker run -d -p 80:80 --name nginx_container nginx
rl http://localhostUnable to find image 'nginx:latest' locally

latest: Pulling from library/nginx
206356c42440: Pull complete
75a1d70aee50: Pull complete
a9d395129dce: Pull complete
df9da45c1db2: Pull complete
18a071c04bd1: Pull complete
79697674b897: Pull complete
9eef040df109: Pull complete
Digest: sha256:bc45d248c4e1d1709321de61566eb2b64d4f0e32765239d66573666be7f13349
Status: Downloaded newer image for nginx:latest
1454c00052e1a824761573021804e9cadc29c995c9c659764acfe1b789382b82
anechka@DESKTOP-SN3QH7B:~/labs/lab6$ curl http://localhost
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
html { color-scheme: light dark; }
body { width: 35em; margin: 0 auto;
font-family: Tahoma, Verdana, Arial, sans-serif; }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, nginx is successfully installed and working.
Further configuration is required for the web server, reverse proxy,
API gateway, load balancer, content cache, or other features.</p>

<p>For online documentation and support please refer to
<a href="https://nginx.org/">nginx.org</a>.<br/>
To engage with the community please visit
<a href="https://community.nginx.org/">community.nginx.org</a>.<br/>
For enterprise grade support, professional services, additional
security features and capabilities please refer to
<a href="https://f5.com/nginx">f5.com/nginx</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>
anechka@DESKTOP-SN3QH7B:~/labs/lab6$


nano index.html
anechka@DESKTOP-SN3QH7B:~/labs/lab6$ docker cp index.html nginx_container:/usr/share/nginx/html/
Successfully copied 2.05kB to nginx_container:/usr/share/nginx/html/
anechka@DESKTOP-SN3QH7B:~/labs/lab6$ ls -la
total 78780
drwxr-xr-x 2 anechka anechka     4096 Mar 11 20:01 .
drwxr-xr-x 3 anechka anechka     4096 Mar 11 16:35 ..
-rw-r--r-- 1 anechka anechka       86 Mar 11 20:01 index.html
-rw------- 1 anechka anechka 80654848 Mar 11 16:50 ubuntu_image.tar
anechka@DESKTOP-SN3QH7B:~/labs/lab6$ curl http://localhost
<html>
<head>
<title>The best</title>
</head>
<body>
<h1>website</h1>
</body>
</html>
anechka@DESKTOP-SN3QH7B:~/labs/lab6$


2.2
 docker commit nginx_container my_website:latest
sha256:ce6b4fb5d7552e5d43c52a53729761b3de3df06b8e934c77011b04f5600f3da0
anechka@DESKTOP-SN3QH7B:~/labs/lab6$ docker images my_website
REPOSITORY   TAG       IMAGE ID       CREATED         SIZE
my_website   latest    ce6b4fb5d755   4 minutes ago   161MB
anechka@DESKTOP-SN3QH7B:~/labs/lab6$ docker rm -f nginx_container
nginx_container
anechka@DESKTOP-SN3QH7B:~/labs/lab6$ docker run -d -p 80:80 --name my_website_container my_website:latest
c2cfa96489bb0314316b0614467c4a6ffa6214131d92b3531585eac14fe38e1b
anechka@DESKTOP-SN3QH7B:~/labs/lab6$ curl http://localhost
<html>
<head>
<title>The best</title>
</head>
<body>
<h1>website</h1>
</body>
</html>
anechka@DESKTOP-SN3QH7B:~/labs/lab6$ docker diff my_website_container
C /run
C /run/nginx.pid
C /etc
C /etc/nginx
C /etc/nginx/conf.d
C /etc/nginx/conf.d/default.conf
anechka@DESKTOP-SN3QH7B:~/labs/lab6$


**docker diff output:**
- `C` = Changed (измененные файлы)
- В выводе видно, что изменились конфиги nginx (`/etc/nginx/conf.d/default.conf`) и появился pid файл (`/run/nginx.pid`)
- Файл `index.html` не показывается, потому что он уже был в образе (мы его добавили до коммита)
**docker commit vs Dockerfile:**
- **commit** — быстро, но непонятно что внутри
- **Dockerfile** — дольше, зато всё описано понятно и можно повторить
  
  
  
  3.  docker network create lab_network
r network ls1644bd123263c4c2c9997780cfe568e03c33758b76885468c8696dab9e54a334
anechka@DESKTOP-SN3QH7B:~/labs/lab6$ docker network ls
NETWORK ID     NAME          DRIVER    SCOPE
70635d40e3ec   bridge        bridge    local
72c08b00c841   host          host      local
1644bd123263   lab_network   bridge    local
e2c6f0b458da   none          null      local
anechka@DESKTOP-SN3QH7B:~/labs/lab6$

docker run -dit --network lab_network --name container1 alpine ash
er run -dit --network lab_network --name container2 alpine ashUnable to find image 'alpine:latest' locally

latest: Pulling from library/alpine
589002ba0eae: Pull complete
Digest: sha256:25109184c71bdad752c8312a8623239686a9a2071e8825f20acb8f2198c3f659
Status: Downloaded newer image for alpine:latest
8800d964c75ce046620b0278e7979e5deea55548aed9b3c57ce15d5a323e77fa
anechka@DESKTOP-SN3QH7B:~/labs/lab6$ docker run -dit --network lab_network --name container2 alpine ash
18df8ff3d84b7b49fb0670f73c046f8058977bdfef5f80b97c949b9d0adbf6b3
anechka@DESKTOP-SN3QH7B:~/labs/lab6$
anechka@DESKTOP-SN3QH7B:~/labs/lab6$

docker exec container1 ping -c 3 container2
PING container2 (172.18.0.3): 56 data bytes
64 bytes from 172.18.0.3: seq=0 ttl=64 time=0.200 ms
64 bytes from 172.18.0.3: seq=1 ttl=64 time=0.149 ms
64 bytes from 172.18.0.3: seq=2 ttl=64 time=0.090 ms

--- container2 ping statistics ---
3 packets transmitted, 3 packets received, 0% packet loss
round-trip min/avg/max = 0.090/0.146/0.200 ms

 docker network inspect lab_network
[
    {
        "Name": "lab_network",
        "Id": "1644bd123263c4c2c9997780cfe568e03c33758b76885468c8696dab9e54a334",
        "Created": "2026-03-11T20:35:20.008810818+03:00",
        "Scope": "local",
        "Driver": "bridge",
        "EnableIPv4": true,
        "EnableIPv6": false,
        "IPAM": {
            "Driver": "default",
            "Options": {},
            "Config": [
                {
                    "Subnet": "172.18.0.0/16",
                    "Gateway": "172.18.0.1"
                }
            ]
        },
        "Internal": false,
        "Attachable": false,
        "Ingress": false,
        "ConfigFrom": {
            "Network": ""
        },
        "ConfigOnly": false,
        "Containers": {
            "18df8ff3d84b7b49fb0670f73c046f8058977bdfef5f80b97c949b9d0adbf6b3": {
                "Name": "container2",
                "EndpointID": "875a4e39c11fdc91bc6e7d83a502a51af8c002b21d09a8addc3f10dbdda04054",
                "MacAddress": "02:42:fb:49:6c:f1",
                "IPv4Address": "172.18.0.3/16",
                "IPv6Address": ""
            },
            "8800d964c75ce046620b0278e7979e5deea55548aed9b3c57ce15d5a323e77fa": {
                "Name": "container1",
                "EndpointID": "6c975f7680946eae9d73c3305b9f1ece652ff8d2fceaf04c92825a8faca51b33",
                "MacAddress": "2a:88:f2:09:5b:68",
                "IPv4Address": "172.18.0.2/16",
                "IPv6Address": ""
            }
        },
        "Options": {},
        "Labels": {}
    }
]

docker exec container1 nslookup container2
Server:         127.0.0.11
Address:        127.0.0.11:53

Non-authoritative answer:

Non-authoritative answer:
Name:   container2
Address: 172.18.0.3

anechka@DESKTOP-SN3QH7B:~/labs/lab6$


**Как работает DNS в Docker?**
В пользовательских сетях Docker есть свой DNS-сервер (127.0.0.11). Когда container1 хочет связаться с container2 по имени, DNS сам находит его IP (172.18.0.3). Поэтому работает `ping container2`.
**Чем пользовательская сеть лучше стандартной?**
- **Имена работают** — можно обращаться по имени контейнера, а не запоминать IP
- **Изоляция** — контейнеры из разных сетей не видят друг друга
- **Гибкость** — можно самому настроить параметры сети



4.
 docker stop web_v2 && docker rm web_v2
-d -p 80:80 -v app_data:/usr/share/nginx/html --name web_new nginx
curl http://localhostweb_v2
web_v2
anechka@DESKTOP-SN3QH7B:~/labs/lab6$ docker run -d -p 80:80 -v app_data:/usr/share/nginx/html --name web_new nginx
6b94f2c31cffc696bf7904169be2bc2b3c9056a2267b7b93d6855fcf81a1da1a

anechka@DESKTOP-SN3QH7B:~/labs/lab6$ curl http://localhost
curl: (56) Recv failure: Connection reset by peer
anechka@DESKTOP-SN3QH7B:~/labs/lab6$ docker ps -a
CONTAINER ID   IMAGE     COMMAND                  CREATED          STATUS          PORTS                                 NAMES
6b94f2c31cff   nginx     "/docker-entrypoint.…"   22 seconds ago   Up 21 seconds   0.0.0.0:80->80/tcp, [::]:80->80/tcp   web_new
9d3ebd6e2316   nginx     "/docker-entrypoint.…"   4 minutes ago    Created                                               web
18df8ff3d84b   alpine    "ash"                    22 hours ago     Up 22 hours                                           container2
8800d964c75c   alpine    "ash"                    22 hours ago     Up 22 hours                                           container1
anechka@DESKTOP-SN3QH7B:~/labs/lab6$ docker rm web
web
anechka@DESKTOP-SN3QH7B:~/labs/lab6$ docker stop web_new
ker rm web_newweb_new
anechka@DESKTOP-SN3QH7B:~/labs/lab6$ docker rm web_new
web_new
anechka@DESKTOP-SN3QH7B:~/labs/lab6$ docker run -d -p 80:80 -v app_data:/usr/share/nginx/html --name web_new nginx
rl http://localhostd126ed5d4f32b29bc38a0b4a39d2e220dcbf0e7b27830f6a377f1cfb43e87560
anechka@DESKTOP-SN3QH7B:~/labs/lab6$ curl http://localhost
<html><body><h1>Persistent Data</h1></body></html>
anechka@DESKTOP-SN3QH7B:~/labs/lab6$ docker volume inspect app_data
[
    {
        "CreatedAt": "2026-03-12T18:05:58+03:00",
        "Driver": "local",
        "Labels": null,
        "Mountpoint": "/var/lib/docker/volumes/app_data/_data",
        "Name": "app_data",
        "Options": null,
        "Scope": "local"
    }
]


Данные в контейнерах временные. Если удалить контейнер, удалятся и данные. Для того, чтобы хранить важные данные отдельно от контейнера существуют Volume. 

**Differences:**
- **Container storage** — внутри контейнера, живет пока живет контейнер
- **Volumes** — хранятся в Docker, живут отдельно от контейнеров (для баз данных, важных файлов)
- **Bind mounts** — папка на твоем компьютере (для разработки, чтобы править код)
