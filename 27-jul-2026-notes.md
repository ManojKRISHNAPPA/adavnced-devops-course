```
ssh -i "chethan-key.pem" ubuntu@ec2-35-74-65-174.ap-northeast-1.compute.amazonaws.com                                          07:53:09 AM
The authenticity of host 'ec2-35-74-65-174.ap-northeast-1.compute.amazonaws.com (64:ff9b::234a:41ae)' can't be established.
ED25519 key fingerprint is: SHA256:U7outPMgtSrWMdoup9kKxXQ4Kjct2UyttDAgEroeKsk
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'ec2-35-74-65-174.ap-northeast-1.compute.amazonaws.com' (ED25519) to the list of known hosts.
Welcome to Ubuntu 24.04.4 LTS (GNU/Linux 6.17.0-1017-aws x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

 System information as of Mon Jul 27 02:22:32 UTC 2026

  System load:  0.48              Temperature:           -273.1 C
  Usage of /:   26.7% of 6.71GB   Processes:             117
  Memory usage: 25%               Users logged in:       0
  Swap usage:   0%                IPv4 address for ens5: 172.31.30.144


Expanded Security Maintenance for Applications is not enabled.

0 updates can be applied immediately.

Enable ESM Apps to receive additional future security updates.
See https://ubuntu.com/esm or run: sudo pro status


The list of available updates is more than a week old.
To check for new updates run: sudo apt update

Last login: Mon Jul 27 02:22:33 2026 from 3.112.23.5
ubuntu@ip-172-31-30-144:~$ sudo su -
root@ip-172-31-30-144:~#
root@ip-172-31-30-144:~# hostname test-server
root@ip-172-31-30-144:~# bash
root@test-server:~#
root@test-server:~# git
usage: git [-v | --version] [-h | --help] [-C <path>] [-c <name>=<value>]
           [--exec-path[=<path>]] [--html-path] [--man-path] [--info-path]
           [-p | --paginate | -P | --no-pager] [--no-replace-objects] [--bare]
           [--git-dir=<path>] [--work-tree=<path>] [--namespace=<name>]
           [--config-env=<name>=<envvar>] <command> [<args>]

These are common Git commands used in various situations:

start a working area (see also: git help tutorial)
   clone     Clone a repository into a new directory
   init      Create an empty Git repository or reinitialize an existing one

work on the current change (see also: git help everyday)
   add       Add file contents to the index
   mv        Move or rename a file, a directory, or a symlink
   restore   Restore working tree files
   rm        Remove files from the working tree and from the index

examine the history and state (see also: git help revisions)
   bisect    Use binary search to find the commit that introduced a bug
   diff      Show changes between commits, commit and working tree, etc
   grep      Print lines matching a pattern
   log       Show commit logs
   show      Show various types of objects
   status    Show the working tree status

grow, mark and tweak your common history
   branch    List, create, or delete branches
   commit    Record changes to the repository
   merge     Join two or more development histories together
   rebase    Reapply commits on top of another base tip
   reset     Reset current HEAD to the specified state
   switch    Switch branches
   tag       Create, list, delete or verify a tag object signed with GPG

collaborate (see also: git help workflows)
   fetch     Download objects and refs from another repository
   pull      Fetch from and integrate with another repository or a local branch
   push      Update remote refs along with associated objects

'git help -a' and 'git help -g' list available subcommands and some
concept guides. See 'git help <command>' or 'git help <concept>'
to read about a specific subcommand or concept.
See 'git help git' for an overview of the system.
root@test-server:~#
root@test-server:~# git --version
git version 2.43.0
root@test-server:~#
root@test-server:~# mkdir devops
root@test-server:~# mkdir devops
root@test-server:~# ls
devops  snap
root@test-server:~# cd dev
root@test-server:~# cd devops/
root@test-server:~/devops#
root@test-server:~/devops#
root@test-server:~/devops# ls
root@test-server:~/devops#
root@test-server:~/devops# ls -a
.  ..
root@test-server:~/devops# git init
hint: Using 'master' as the name for the initial branch. This default branch name
hint: is subject to change. To configure the initial branch name to use in all
hint: of your new repositories, which will suppress this warning, call:
hint:
hint: 	git config --global init.defaultBranch <name>
hint:
hint: Names commonly chosen instead of 'master' are 'main', 'trunk' and
hint: 'development'. The just-created branch can be renamed via this command:
hint:
hint: 	git branch -m <name>
Initialized empty Git repository in /root/devops/.git/
root@test-server:~/devops# ls -a
.  ..  .git
root@test-server:~/devops# ls
root@test-server:~/devops# cd .git/
root@test-server:~/devops/.git# ls
HEAD  branches  config  description  hooks  info  objects  refs
root@test-server:~/devops/.git# cd ..
root@test-server:~/devops#
root@test-server:~/devops# ls
root@test-server:~/devops# touch data_{1..10}.txt
root@test-server:~/devops# ls
data_1.txt   data_2.txt  data_4.txt  data_6.txt  data_8.txt
data_10.txt  data_3.txt  data_5.txt  data_7.txt  data_9.txt
root@test-server:~/devops#
root@test-server:~/devops#
root@test-server:~/devops# ls
data_1.txt   data_2.txt  data_4.txt  data_6.txt  data_8.txt
data_10.txt  data_3.txt  data_5.txt  data_7.txt  data_9.txt
root@test-server:~/devops# git status
On branch master

No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)
	data_1.txt
	data_10.txt
	data_2.txt
	data_3.txt
	data_4.txt
	data_5.txt
	data_6.txt
	data_7.txt
	data_8.txt
	data_9.txt

nothing added to commit but untracked files present (use "git add" to track)
root@test-server:~/devops# git add data_1.txt
root@test-server:~/devops# git status
On branch master

No commits yet

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)
	new file:   data_1.txt

Untracked files:
  (use "git add <file>..." to include in what will be committed)
	data_10.txt
	data_2.txt
	data_3.txt
	data_4.txt
	data_5.txt
	data_6.txt
	data_7.txt
	data_8.txt
	data_9.txt

root@test-server:~/devops# git rm --cached data_1.txt
rm 'data_1.txt'
root@test-server:~/devops# git status
On branch master

No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)
	data_1.txt
	data_10.txt
	data_2.txt
	data_3.txt
	data_4.txt
	data_5.txt
	data_6.txt
	data_7.txt

~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
"data_1.txt" 0L, 0B                                                             0,0-1         All
Hello
	data_8.txt
	data_9.txt

nothing added to commit but untracked files present (use "git add" to track)
root@test-server:~/devops# git add data_1.txt
root@test-server:~/devops# git status
On branch master

No commits yet

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)
	new file:   data_1.txt

Untracked files:
  (use "git add <file>..." to include in what will be committed)
	data_10.txt
	data_2.txt
	data_3.txt
	data_4.txt
	data_5.txt
	data_6.txt
	data_7.txt
	data_8.txt
	data_9.txt

root@test-server:~/devops# vi data_1.txt
root@test-server:~/devops# git status
On branch master

No commits yet

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)
	new file:   data_1.txt

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
	modified:   data_1.txt

Untracked files:
  (use "git add <file>..." to include in what will be committed)
	data_10.txt
	data_2.txt
	data_3.txt
	data_4.txt
	data_5.txt
	data_6.txt
	data_7.txt
	data_8.txt
	data_9.txt

root@test-server:~/devops# git rm --cached data_1.txt
error: the following file has staged content different from both the
file and the HEAD:
    data_1.txt
(use -f to force removal)
root@test-server:~/devops#
root@test-server:~/devops# git status
On branch master

No commits yet

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)
	new file:   data_1.txt

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
	modified:   data_1.txt

Untracked files:
  (use "git add <file>..." to include in what will be committed)
	data_10.txt
	data_2.txt
	data_3.txt
	data_4.txt
	data_5.txt
	data_6.txt
	data_7.txt
	data_8.txt
	data_9.txt

root@test-server:~/devops# git add .
root@test-server:~/devops# git status
On branch master

No commits yet

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)
	new file:   data_1.txt
	new file:   data_10.txt
	new file:   data_2.txt
	new file:   data_3.txt
	new file:   data_4.txt
	new file:   data_5.txt
	new file:   data_6.txt
	new file:   data_7.txt
	new file:   data_8.txt
	new file:   data_9.txt

root@test-server:~/devops#
root@test-server:~/devops# git commit -m "We have created 10 files "
Author identity unknown

*** Please tell me who you are.

Run

  git config --global user.email "you@example.com"
  git config --global user.name "Your Name"

to set your account's default identity.
Omit --global to set the identity only in this repository.

fatal: unable to auto-detect email address (got 'root@test-server.(none)')
root@test-server:~/devops# git config --global user.email "contactmanojmech@gmail.com"
root@test-server:~/devops#
root@test-server:~/devops# git config --global user.name "Manoj"
root@test-server:~/devops# git config --global user.name "ManojKRISHNAPPA"
root@test-server:~/devops#
root@test-server:~/devops#
root@test-server:~/devops# git commit -m "We have created 10 files "
[master (root-commit) 6177ba6] We have created 10 files
 10 files changed, 1 insertion(+)
 create mode 100644 data_1.txt
 create mode 100644 data_10.txt
 create mode 100644 data_2.txt
 create mode 100644 data_3.txt
 create mode 100644 data_4.txt
 create mode 100644 data_5.txt
 create mode 100644 data_6.txt
 create mode 100644 data_7.txt
 create mode 100644 data_8.txt
 create mode 100644 data_9.txt
root@test-server:~/devops# git status
On branch master
nothing to commit, working tree clean
root@test-server:~/devops#
root@test-server:~/devops# git log
commit 6177ba65b5b4c8f1da258fb2d670dce31af52540 (HEAD -> master)
Author: ManojKRISHNAPPA <contactmanojmech@gmail.com>
Date:   Mon Jul 27 02:36:20 2026 +0000

    We have created 10 files
root@test-server:~/devops# git log -p
commit 6177ba65b5b4c8f1da258fb2d670dce31af52540 (HEAD -> master)
Author: ManojKRISHNAPPA <contactmanojmech@gmail.com>
Date:   Mon Jul 27 02:36:20 2026 +0000

    We have created 10 files

diff --git a/data_1.txt b/data_1.txt
new file mode 100644
index 0000000..e965047
--- /dev/null
+++ b/data_1.txt
@@ -0,0 +1 @@
+Hello
diff --git a/data_10.txt b/data_10.txt
new file mode 100644
index 0000000..e69de29
diff --git a/data_2.txt b/data_2.txt
new file mode 100644
index 0000000..e69de29
diff --git a/data_3.txt b/data_3.txt
new file mode 100644
index 0000000..e69de29
diff --git a/data_4.txt b/data_4.txt
new file mode 100644
index 0000000..e69de29
diff --git a/data_5.txt b/data_5.txt
new file mode 100644
index 0000000..e69de29
diff --git a/data_6.txt b/data_6.txt
new file mode 100644
index 0000000..e69de29
diff --git a/data_7.txt b/data_7.txt
new file mode 100644
index 0000000..e69de29
diff --git a/data_8.txt b/data_8.txt
new file mode 100644
index 0000000..e69de29
diff --git a/data_9.txt b/data_9.txt
new file mode 100644
index 0000000..e69de29
root@test-server:~/devops#
root@test-server:~/devops#
root@test-server:~/devops# git log -p
commit 6177ba65b5b4c8f1da258fb2d670dce31af52540 (HEAD -> master)
Author: ManojKRISHNAPPA <contactmanojmech@gmail.com>
Date:   Mon Jul 27 02:36:20 2026 +0000

    We have created 10 files

diff --git a/data_1.txt b/data_1.txt
new file mode 100644
index 0000000..e965047
--- /dev/null
+++ b/data_1.txt
@@ -0,0 +1 @@
+Hello
diff --git a/data_10.txt b/data_10.txt
new file mode 100644
index 0000000..e69de29
diff --git a/data_2.txt b/data_2.txt
new file mode 100644
index 0000000..e69de29
diff --git a/data_3.txt b/data_3.txt
new file mode 100644
index 0000000..e69de29
diff --git a/data_4.txt b/data_4.txt
new file mode 100644
index 0000000..e69de29
diff --git a/data_5.txt b/data_5.txt
new file mode 100644
index 0000000..e69de29
diff --git a/data_6.txt b/data_6.txt
new file mode 100644
root@test-server:~/devops#
root@test-server:~/devops# git status
On branch master
nothing to commit, working tree clean
root@test-server:~/devops# ls
data_1.txt  data_10.txt  data_2.txt  data_3.txt  data_4.txt  data_5.txt  data_6.txt  data_7.txt  data_8.txt  data_9.txt
root@test-server:~/devops# Read from remote host ec2-35-74-65-174.ap-northeast-1.compute.amazonaws.com: Connection reset by peer
Connection to ec2-35-74-65-174.ap-northeast-1.compute.amazonaws.com closed.
client_loop: send disconnect: Broken pipe
~/De/pemkeys > ls                                                                                              255 21m 41s 08:14:52 AM
chethan-key.pem		Manoj-devops.pem	Manoj.pem		Tokyo-key.pem
kubeadm.pem		Manoj-quantam.pem	test-1.pem
~/Desktop/pemkeys >                                                                                                        08:14:53 AM
~/Desktop/pemkeys > ssh -i "chethan-key.pem" ubuntu@ec2-35-74-65-174.ap-northeast-1.compute.amazonaws.com                  08:14:53 AM
Welcome to Ubuntu 24.04.4 LTS (GNU/Linux 6.17.0-1017-aws x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

 System information as of Mon Jul 27 02:44:56 UTC 2026

  System load:  0.0               Temperature:           -273.1 C
  Usage of /:   27.2% of 6.71GB   Processes:             124
  Memory usage: 27%               Users logged in:       1
  Swap usage:   0%                IPv4 address for ens5: 172.31.30.144


Expanded Security Maintenance for Applications is not enabled.

0 updates can be applied immediately.

Enable ESM Apps to receive additional future security updates.
See https://ubuntu.com/esm or run: sudo pro status


The list of available updates is more than a week old.
To check for new updates run: sudo apt update

Last login: Mon Jul 27 02:23:15 2026 from 152.57.141.243
ubuntu@test-server:~$ sudo su -
root@test-server:~#
root@test-server:~# ls
devops  snap
root@test-server:~# cd devops/
root@test-server:~/devops# ls
data_1.txt  data_10.txt  data_2.txt  data_3.txt  data_4.txt  data_5.txt  data_6.txt  data_7.txt  data_8.txt  data_9.txt
root@test-server:~/devops#
root@test-server:~/devops#
root@test-server:~/devops# ls
data_1.txt  data_10.txt  data_2.txt  data_3.txt  data_4.txt  data_5.txt  data_6.txt  data_7.txt  data_8.txt  data_9.txt
root@test-server:~/devops# echo "# adavnced-devops-course" >> README.md
root@test-server:~/devops# git add .
root@test-server:~/devops# git status
On branch master
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
	new file:   README.md

root@test-server:~/devops# git commit -m "updtaed the readme"
[master 5c7b9f5] updtaed the readme
 1 file changed, 1 insertion(+)
 create mode 100644 README.md
root@test-server:~/devops#
root@test-server:~/devops#
root@test-server:~/devops# git branch -M main
root@test-server:~/devops# git tremote -v
git: 'tremote' is not a git command. See 'git --help'.

The most similar command is
	remote
root@test-server:~/devops#
root@test-server:~/devops# git remote -v
root@test-server:~/devops# git remote add origin https://github.com/ManojKRISHNAPPA/adavnced-devops-course.git
root@test-server:~/devops# git remote -v
origin	https://github.com/ManojKRISHNAPPA/adavnced-devops-course.git (fetch)
origin	https://github.com/ManojKRISHNAPPA/adavnced-devops-course.git (push)
root@test-server:~/devops#
root@test-server:~/devops# cd
root@test-server:~#
root@test-server:~# git clone https://github.com/QuntamVector/GitOps.git
Cloning into 'GitOps'...
remote: Enumerating objects: 450, done.
remote: Counting objects: 100% (165/165), done.
remote: Compressing objects: 100% (24/24), done.
remote: Total 450 (delta 158), reused 141 (delta 141), pack-reused 285 (from 1)
Receiving objects: 100% (450/450), 75.05 KiB | 10.72 MiB/s, done.
Resolving deltas: 100% (251/251), done.
root@test-server:~#
root@test-server:~# ls
GitOps  devops  snap
root@test-server:~# cd GitOps/
root@test-server:~/GitOps# ls
ARCHITECTURE.md         argocd-app.yaml  checkoutservice  kustomization.yaml  postgres               shoppingassistantservice
GITOPS-ARCHITECTURE.md  authservice      currencyservice  loadgenerator       productcatalogservice  vectordb
HTTPS-SECURITY.md       base             emailservice     overlays            recommendationservice
adservice               cartservice      frontend         paymentservice      shippingservice
root@test-server:~/GitOps# git remote -v
origin	https://github.com/QuntamVector/GitOps.git (fetch)
origin	https://github.com/QuntamVector/GitOps.git (push)
root@test-server:~/GitOps#
root@test-server:~/GitOps#
root@test-server:~/GitOps#
root@test-server:~/GitOps# cd ..
root@test-server:~# ls
GitOps  devops  snap
root@test-server:~# cd devops/
root@test-server:~/devops# ls
README.md  data_1.txt  data_10.txt  data_2.txt  data_3.txt  data_4.txt  data_5.txt  data_6.txt  data_7.txt  data_8.txt  data_9.txt
root@test-server:~/devops# git remote -v
origin	https://github.com/ManojKRISHNAPPA/adavnced-devops-course.git (fetch)
origin	https://github.com/ManojKRISHNAPPA/adavnced-devops-course.git (push)
root@test-server:~/devops# cd ..
root@test-server:~# ls
GitOps  devops  snap
root@test-server:~# git clone https://github.com/ManojKRISHNAPPA/adavnced-devops-course.git
Cloning into 'adavnced-devops-course'...
warning: You appear to have cloned an empty repository.
root@test-server:~# ls
GitOps  adavnced-devops-course  devops  snap
root@test-server:~# cd devops/
root@test-server:~/devops# ls
README.md  data_1.txt  data_10.txt  data_2.txt  data_3.txt  data_4.txt  data_5.txt  data_6.txt  data_7.txt  data_8.txt  data_9.txt
root@test-server:~/devops# git remote -v
origin	https://github.com/ManojKRISHNAPPA/adavnced-devops-course.git (fetch)
origin	https://github.com/ManojKRISHNAPPA/adavnced-devops-course.git (push)
root@test-server:~/devops#
root@test-server:~/devops# git push -u origin main
Username for 'https://github.com': manojkrishnappa
Password for 'https://manojkrishnappa@github.com':
Enumerating objects: 7, done.
Counting objects: 100% (7/7), done.
Delta compression using up to 2 threads
Compressing objects: 100% (4/4), done.
Writing objects: 100% (7/7), 566 bytes | 566.00 KiB/s, done.
Total 7 (delta 1), reused 0 (delta 0), pack-reused 0
remote: Resolving deltas: 100% (1/1), done.
To https://github.com/ManojKRISHNAPPA/adavnced-devops-course.git
 * [new branch]      main -> main
branch 'main' set up to track 'origin/main'.
root@test-server:~/devops# cd
root@test-server:~#
root@test-server:~# ls
GitOps  adavnced-devops-course  devops  snap
root@test-server:~# cd devops/
root@test-server:~/devops# cd ..
root@test-server:~# ls
GitOps  adavnced-devops-course  devops  snap
root@test-server:~# rm -rf adavnced-devops-course
root@test-server:~#

~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
"data_1" [New]                                                                                                       0,0-1         All
Hello
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
"data_1.txt" 1L, 6B                                                                                                  1,1           All
Hello
root@test-server:~# ls
GitOps  devops  snap
root@test-server:~# git clone https://github.com/ManojKRISHNAPPA/adavnced-devops-course.git
Cloning into 'adavnced-devops-course'...
remote: Enumerating objects: 7, done.
remote: Counting objects: 100% (7/7), done.
remote: Compressing objects: 100% (3/3), done.
remote: Total 7 (delta 1), reused 7 (delta 1), pack-reused 0 (from 0)
Receiving objects: 100% (7/7), done.
Resolving deltas: 100% (1/1), done.
root@test-server:~# ls
GitOps  adavnced-devops-course  devops  snap
root@test-server:~# cd adavnced-devops-course/
root@test-server:~/adavnced-devops-course# ls
README.md  data_1.txt  data_10.txt  data_2.txt  data_3.txt  data_4.txt  data_5.txt  data_6.txt  data_7.txt  data_8.txt  data_9.txt
root@test-server:~/adavnced-devops-course# vi data_1
root@test-server:~/adavnced-devops-course# vi data_1.txt
root@test-server:~/adavnced-devops-course# git add .
root@test-server:~/adavnced-devops-course# git commit -m "I have edited the file1"
[main 24aaaaa] I have edited the file1
 1 file changed, 1 insertion(+)
root@test-server:~/adavnced-devops-course# git push
Username for 'https://github.com': manojkrishnappa
Password for 'https://manojkrishnappa@github.com':
Enumerating objects: 5, done.
Counting objects: 100% (5/5), done.
Delta compression using up to 2 threads
Compressing objects: 100% (2/2), done.
Writing objects: 100% (3/3), 303 bytes | 303.00 KiB/s, done.
Total 3 (delta 1), reused 0 (delta 0), pack-reused 0
remote: Resolving deltas: 100% (1/1), completed with 1 local object.
To https://github.com/ManojKRISHNAPPA/adavnced-devops-course.git
   5c7b9f5..24aaaaa  main -> main

```
