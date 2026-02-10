Task 1.
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



Task 2. 
git reset --soft HEAD~1 - сбрасываем последний коммит, но его изменения остаются в staging area.(осталось две строчки и третья в s.a.) 
git reflog - смотрим историю изменения положения head.
git reset --hard HEAD~1 - окончательно удаляем коммит и переходим head в предыдущий. На этом этапе мы стираем уже и вторую строчку. (остается только первый коммит).
git reflog - снова смотрим историю head.
git reset --hard 3a966da - возвращаем все в начало по хэшу коммита (восстанавливаем все удаленные стррочки благодаря этому). 
cat file.txt - смотрим содержимое файла. 
Благодаря рефлог мы можем найти хэш того коммита, который нам нужно восстановить. 

Task 3.

anechka@DESKTOP-SN3QH7B:~/DevOps-Intro/labs$ git log --oneline --graph --all
* ce9aa43 (side-branch) Side branch commit
| * 3a966da (git-reset-practice) Third commit
| * 233d789 Second commit
| * c26789c First commit
|/
* 9ecc4da (HEAD -> feature/lab2) Task 1 complete
* 03e54f8 Add test file
* 99a9627 (origin/main, origin/HEAD, main) answer to question
* abf83a9 docs: add task 2 placeholder with signed commit
* 546684e empty file
* d6b6a03 Update lab2
* 87810a0 feat: remove old Exam Exemption Policy
* 1e1c32b feat: update structure
* 6c27ee7 feat: publish lecs 9 & 10
* 1826c36 feat: update lab7
* 3049f08 feat: publish lec8
* da8f635 feat: introduce all labs and revised structure
* 04b174e feat: publish lab and lec #5
* 67f12f1 feat: publish labs 4&5, revise others
* 82d1989 feat: publish lab3 and lec3
* 3f80c83 feat: publish lec2
* 499f2ba feat: publish lab2
* af0da89 feat: update lab1
* 74a8c27 Publish lab1
* f0485c0 Publish lec1
* 31dd11b Publish README.md

Этот граф описывает связи между коммитами. Читать снизу вверх. Когда мы переходим в новые
ветки, он делает новые ответвления. В общем, это просто визуализация нашей работы. 


Task 4.
git tag v1.0.0
git push origin v1.0.0
9ecc4da 
Теги нужны, чтобы отмечать готовые версии продукта. Мы можем сразу увидеть этот тег на Гитхабе, что очень удобно.
И так же используется для автоматизации процессов. 

Task 5.

anechka@DESKTOP-SN3QH7B:~/DevOps-Intro/labs$ git switch -c cmd-compare   # create and switch
tch -                # toggle back to previous branchSwitched to a new branch 'cmd-compare'
anechka@DESKTOP-SN3QH7B:~/DevOps-Intro/labs$ git switch -                # toggle back to previous branch
M       labs/submission2.md
Switched to branch 'feature/lab2'
anechka@DESKTOP-SN3QH7B:~/DevOps-Intro/labs$ git checkout -b cmd-compare-2
Switched to a new branch 'cmd-compare-2'
anechka@DESKTOP-SN3QH7B:~/DevOps-Intro/labs$ git switch -
M       labs/submission2.md
Switched to branch 'feature/lab2'
anechka@DESKTOP-SN3QH7B:~/DevOps-Intro/labs$ echo "scratch" >> demo.txt
anechka@DESKTOP-SN3QH7B:~/DevOps-Intro/labs$ cat demo.txt
scratch
anechka@DESKTOP-SN3QH7B:~/DevOps-Intro/labs$ git restore demo.txt
error: pathspec 'demo.txt' did not match any file(s) known to git
anechka@DESKTOP-SN3QH7B:~/DevOps-Intro/labs$ git status
On branch feature/lab2
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        modified:   submission2.md

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        commits.txt
        demo.txt

no changes added to commit (use "git add" and/or "git commit -a")
anechka@DESKTOP-SN3QH7B:~/DevOps-Intro/labs$ git add demo.txt
anechka@DESKTOP-SN3QH7B:~/DevOps-Intro/labs$ git restore demo.txt
anechka@DESKTOP-SN3QH7B:~/DevOps-Intro/labs$ cat demo.txt
scratch
anechka@DESKTOP-SN3QH7B:~/DevOps-Intro/labs$ git status
On branch feature/lab2
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        new file:   demo.txt

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        modified:   submission2.md

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        commits.txt

anechka@DESKTOP-SN3QH7B:~/DevOps-Intro/labs$ echo "uzbek" >> demo.txt
anechka@DESKTOP-SN3QH7B:~/DevOps-Intro/labs$ cat demo.txt
scratch
uzbek
anechka@DESKTOP-SN3QH7B:~/DevOps-Intro/labs$ git status
On branch feature/lab2
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        new file:   demo.txt

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        modified:   demo.txt
        modified:   submission2.md

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        commits.txt

anechka@DESKTOP-SN3QH7B:~/DevOps-Intro/labs$ git restore demo.txt
anechka@DESKTOP-SN3QH7B:~/DevOps-Intro/labs$ cat demo.txt
scratch
anechka@DESKTOP-SN3QH7B:~/DevOps-Intro/labs$ git status
On branch feature/lab2
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        new file:   demo.txt

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        modified:   submission2.md

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        commits.txt

anechka@DESKTOP-SN3QH7B:~/DevOps-Intro/labs$ echo "uzbek" >> demo.txt
anechka@DESKTOP-SN3QH7B:~/DevOps-Intro/labs$ cat demo.txt
scratch
uzbek
anechka@DESKTOP-SN3QH7B:~/DevOps-Intro/labs$ git restore --staged demo.txt
anechka@DESKTOP-SN3QH7B:~/DevOps-Intro/labs$ cat demo.txt
scratch
uzbek
anechka@DESKTOP-SN3QH7B:~/DevOps-Intro/labs$ git status
On branch feature/lab2
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        modified:   submission2.md

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        commits.txt
        demo.txt

no changes added to commit (use "git add" and/or "git commit -a")


Git switch - чтобы менять и создавать ветки. 
Git restore - чтобы отменять локальные изменения в файлах. Можно восстановить конкретную версию из истории.
Git checkout - устаревшая перегруженная команда, использование которой стоит избегать.



Task 6 - GitHub Community
Star и Follow нужны затем, чтобы ты мог следить за другими разработчиками и репозиториями и поддерживать их.

