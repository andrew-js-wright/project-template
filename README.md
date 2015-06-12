#Template Project
This project is designed primarily for training purposes. I will be use to quickly spin up a target environment for small projects using play as the base framework.

## Contents
- Play sample application
- Jenkins build server

## Prerequists
- [Vagrant](vagrantup.com)
- [VirualBox](https://www.virtualbox.org/)

## Run
```bash
git clone git@github.com:andrew-js-wright/project-template.git
cd project-template
vagrant up
```

## View jenkins configuration
Navigate to the following location in your web browser.
```bash
localhost:8080
```
By default jenkins will poll a predefined git repository, check out the repo into a local working directory and build it using SBT. 
It then moves the generated JAR into a location which is pointed to by the `sample-app` upstart configuration.

## View running application
Navigate to the following location in your web broswer
```bash
localhost:9000
```
