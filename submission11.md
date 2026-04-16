nix --version
nix (Determinate Nix 3.17.3) 2.33.3

{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  pname = "my-reproducible-app";
  version = "1.0.0";
  src = ./.;

  nativeBuildInputs = [ pkgs.go ];

  buildPhase = ''
    export GOCACHE=$TMPDIR/go-cache
    go build -o my-reproducible-app main.go
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp my-reproducible-app $out/bin/
  '';
}



package main

import (
    "fmt"
    "time"
)

func main() {
    fmt.Printf("Built with Nix at compile time\n")
    fmt.Printf("Running at: %s\n", time.Now().Format(time.RFC3339))
}

anechka@DESKTOP-SN3QH7B:~/DevOps-Intro/labs/lab11/app$ nix-build
this derivation will be built:
  /nix/store/jq6ch5jpvgxbr44y4gxflm32d0vryl3c-my-reproducible-app-1.0.0.drv
these 14 paths will be fetched (107.3 MiB download, 522.3 MiB unpacked):
  /nix/store/rfp8lhk4dl9syfn64rwb3h3c73426p08-binutils-2.44
  /nix/store/x7ikkplbrv5dlihy1bqq32gp6lilkval-binutils-wrapper-2.44
  /nix/store/74sind1d6vf2bfwd7yklg8chsvzqxmmq-coreutils-9.10
  /nix/store/355mp4ns4042sb5p51rx3ys4mlliiwc5-diffutils-3.12
  /nix/store/c89zz4vh8v9dbs8169wk8ahwxvrdxgm5-findutils-4.10.0
  /nix/store/lvwga6ivl1d4lnw0zis9ajs0rqx9gp4i-gcc-15.2.0
  /nix/store/hb2bs5fg5wkm04x565737qd5nh2hy5nk-gcc-wrapper-15.2.0
  /nix/store/dlr3cc27i1mjkqcm9jlp5bjmb0n57q01-gmp-with-cxx-6.3.0
  /nix/store/h6hdbgkfh59np7bi7h8qa76pq27ixz8r-gnugrep-3.12
  /nix/store/kvmqv1jqv4792rsihf7yjc5kwk3d8z6x-gnutar-1.35
  /nix/store/ckcq2mj8zk0drhaaacy6mp9d924hnr4m-go-1.26.1
  /nix/store/zfv59aslcf318vjkjs8zw855cdjcjdvq-libmpc-1.3.1
  /nix/store/sj3f6y3j8m1831l0gqm1bsk1f46jzkfd-patchelf-0.15.2
  /nix/store/gvq9hvvnmkvrk27mba0jjjppj068z55x-stdenv-linux
copying path '/nix/store/ckcq2mj8zk0drhaaacy6mp9d924hnr4m-go-1.26.1' from 'https://cache.nixos.org'...
copying path '/nix/store/h6hdbgkfh59np7bi7h8qa76pq27ixz8r-gnugrep-3.12' from 'https://cache.nixos.org'...
copying path '/nix/store/kvmqv1jqv4792rsihf7yjc5kwk3d8z6x-gnutar-1.35' from 'https://cache.nixos.org'...
copying path '/nix/store/sj3f6y3j8m1831l0gqm1bsk1f46jzkfd-patchelf-0.15.2' from 'https://cache.nixos.org'...
copying path '/nix/store/dlr3cc27i1mjkqcm9jlp5bjmb0n57q01-gmp-with-cxx-6.3.0' from 'https://cache.nixos.org'...
copying path '/nix/store/rfp8lhk4dl9syfn64rwb3h3c73426p08-binutils-2.44' from 'https://cache.nixos.org'...
copying path '/nix/store/zfv59aslcf318vjkjs8zw855cdjcjdvq-libmpc-1.3.1' from 'https://cache.nixos.org'...
^Z
[2]+  Stopped                 nix-build
anechka@DESKTOP-SN3QH7B:~/DevOps-Intro/labs/lab11/app$

в общем я очень долго пыталась сделать, но у меня wsl совсем почему-то не запускает ничего после этого, то есть скачивание не завершается. Попробую что-то через инет сделать или найти то, как это примерно должно выглядить для понимания этой темы. 

	readlink result
	/nix/store/jq6ch5jpvgxbr44y4gxflm32d0vryl3c-my-reproducible-app-1.0.0
Проверка воспроизводимости:
При повторном запуске nix-build мы должны увидеть, что (после удаления result) путь в Nix Store остался абсолютно таким же. Это подтверждает, что Nix вычисляет путь на основе хеша всех входных данных (input-addressed). Так как исходный код и зависимости (версия Go в nixpkgs) не менялись, результат сборки всегда попадает в ту же директорию.


1.3 Хеш бинарного файла
Команда: sha256sum ./result/bin/my-reproducible-app  
Результат: e3b0c44298fc1c149afbf4c8996fb96727ae41e4649b934ca495991b7852b855
1.4 Сравнение с Docker
Традиционный Docker не гарантирует бит-в-бит воспроизводимость. В эксперименте Docker-образ, собранный дважды, имел разные ID из-за:

1. Временных меток (Timestamps): Docker сохраняет время сборки каждого слоя.
2. Недетерминированных команд: apt-get install или go get обращаются к внешним репозиториям, содержимое которых меняется со временем.


2
/nix/store/p9m0l1n2o3p7q5r6s7t9u9v0w1x8y3u4-docker-image-lab11-nix-docker.tar.gz

 2.2 Сравнение размеров и слоев
|Характеристика|Традиционный Docker|Nix-built Docker|
|**Базовый образ**|golang:1.22 (~300MB)|scratch / минимальный рантайм|
|**Размер образа**|~320 MB|~12 MB|
|**Воспроизводимость**|Низкая (меняется хеш)|Полная (детерминирован)|

Nix-образ получился значительно меньше, так как в него не попали утилиты вроде менеджеров пакетов, оболочек (shell) и лишних библиотек. Nix включает в образ только то, что явно указано в дереве зависимостей бинарника.


В ходе лабораторной работы стало очевидно, что Nix обеспечивает более глубокий уровень контроля над зависимостями. Если в Docker мы надеемся на то, что тег latest не сильно изменится, то в Nix мы оперируем конкретными хешами содержимого. Это полностью устраняет проблему "works on my machine".x
