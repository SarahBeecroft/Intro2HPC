---
title: "Logging on to Zeus"
teaching: 5
exercises: 10
questions:
objectives:
- Learn how to remote access Zeus
keypoints:
- Logging on to Pawsey systems uses SSH (secure shell)
---

### Logging on to Zeus
Your user name and password will be supplied. Within a terminal window, type:

```
ssh username@zeus.pawsey.org.au
```

Enter your password when prompted. If asked to accept any credentials, type `yes` and hit enter

If you have successfully logged in, you should see your command prompt change

```
username@zeus-1:~>
```

If you are unable to login, please first check your password was typed correctly. If you are still unable to login, please ask for assistance.


### Downloading the lesson material
There are some materials for the lessons which are hosted on github. In order to access those on Zeus, you will need to clone the git repo, then change directory. You can list the contents of the directory with `ls`

```
git clone http://github.XXXXXXXX
cd XXXXXXX
ls
```
