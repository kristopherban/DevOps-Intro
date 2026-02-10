anechka@DESKTOP-SN3QH7B:~/DevOps-Intro/labs$ git log --oneline -1
03e54f8 (HEAD -> feature/lab2) Add test file
anechka@DESKTOP-SN3QH7B:~/DevOps-Intro/labs$ git cat-file -p HEAD
tree debea071b6612935232806c287657142de144714
parent 99a9627a8ff2ad1997490abaab352218edeb6132
author Anya <cgkristopher@gmail.com> 1770728476 +0300
committer Anya <cgkristopher@gmail.com> 1770728476 +0300
gpgsig -----BEGIN SSH SIGNATURE-----
 U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgM7yoGl4JT/KX8qGp6qaqtmwNaP
 Pg5V0NDBhND6css3YAAAADZ2l0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5
 AAAAQDaMkRvfm/fd27+dvaMMnzycIienkV+9vFB8fpDlD7DqefDDP3OA9xgbPN7CAbBgPA
 x7gJfV1dN5pr7TIBbSRwM=
 -----END SSH SIGNATURE-----

Add test file
anechka@DESKTOP-SN3QH7B:~/DevOps-Intro/labs$ git cat-file -p debea07
100644 blob 6e60bebec0724892a7c82c52183d0a7b467cb6bb    README.md
040000 tree a1061247fd38ef2a568735939f86af7b1000f83c    app
040000 tree 3d8787382701ea191c4b3a2f5f2fb7871e427ae7    labs
040000 tree d3fb3722b7a867a83efde73c57c49b5ab3e62c63    lectures
anechka@DESKTOP-SN3QH7B:~/DevOps-Intro/labs$ git cat-file -p <tree_hash>
-bash: syntax error near unexpected token `newline'
anechka@DESKTOP-SN3QH7B:~/DevOps-Intro/labs$ git cat-file -p 6e60bebe
# 🚀 DevOps Introduction Course: Principles, Practices & Tooling

[![Labs](https://img.shields.io/badge/Labs-80%25-blue)](#-lab-based-learning-experience)
[![Exam](https://img.shields.io/badge/Exam-20%25-orange)](#-evaluation-framework)
[![Hands-On](https://img.shields.io/badge/Focus-Hands--On%20Labs-success)](#-lab-based-learning-experience)
[![Duration](https://img.shields.io/badge/Duration-10%20Weeks-lightgrey)](#-course-roadmap)

Welcome to the **DevOps Introduction Course**, where you will gain a **solid foundation in DevOps principles and practical skills**.
This course is designed to provide a comprehensive understanding of DevOps and its key components.

Through **hands-on labs and lectures**, you'll explore version control, software distribution, CI/CD, containerization, cloud computing, and beyond — the same workflows used by modern engineering teams.

---

## 📚 Course Roadmap

Все типы объектов имеют свой уникальный хэш.
Blob - это тип объектов, который сохраняет содержимое файлов.
Tree - это тип объектов, который хранит хэши оюъектов, которые лежат в конкретной папке. 
Commit - это тип объектов, кооторый хэш корневого tree и хэш родителя (предыдущий коммит), информацию об авторе и сообщение коммита.

Git хранит данные в виде графа с неизменяемыми объектами, где все связано между собой. 
Blobs файлы сохраняются один раз и если файл не меняется, то он остается неизменным. В случае изменения исходного файла, blob создается новый. Trees хранят в себе хэши других деревьем и блобов. А коммиты создают снимки состояний, могут быть связаны между другими коммитами и с деревьями. 

1 команда - хэш последнего коммита.
2 команда - содержимое коммита.
3 команда - содержимое tree.
4 - содержимое blob.
