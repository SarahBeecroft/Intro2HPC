---
title: "Logging on to Setonix"
teaching: 5
exercises: 10
questions:
objectives:
- Learn how to remote access Setonix
keypoints:
- Logging on to Pawsey systems uses SSH (secure shell)
---
### Getting your user names and passwords
We have created some training usernames and passwords for you. These are available on the google sheet linked on the PowerPoint slide. Go to that link and put your name next to one of the usernames to claim it for yourself. That will be your username and password for this whole class.

### Logging on to Setonix with Terminal or Windows PowerShell
Your user name and password will be supplied. Within a terminal window, type:

```bash
ssh username@setonix.pawsey.org.au
```
Enter your password when prompted. If asked to accept any credentials, type `yes` and hit enter

If you have successfully logged in, you should see your command prompt change

```output
username@setonix-01:~>
```

If you are unable to login, please first check your password was typed correctly. If you are still unable to login, please ask for assistance.


### Logging in using PUTTY (Windows)
Host name is `setonix.pawsey.org.au`
Port is `22`
User name is the name you selected on the training accounts sheet- e.g. something like `cou001`

Helpful link: https://www.hostinger.com/tutorials/how-to-use-putty-ssh

### Downloading the lesson material
There are some materials for the lessons which are hosted on github. In order to access those on Setonix, you will need to clone the git repo, then change directory. You can list the contents of the directory with `ls`

```bash
cd $MYSCRATCH
git clone https://github.com/SarahBeecroft/Intro2HPC.git
cd Intro2HPC/exercises
ls
```
