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

## Run on AWS
In order to run on AWS run the following:

```
git checkout aws-setup
vagrant plugin install vagrant-aws
vagrant box add dummy https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box

export AWS_KEY='your-key'         # The key referenced in the 'my account' section of AWS console
export AWS_SECRET='your-secret'   # The secret code at account level of AWS, accessable through the 'my account' screen
export AWS_KEYNAME='your-keyname' # The name of the key pair set up on the AWS console
export AWS_KEYPATH='your-keypath' # path to .pem file

vagrant up
```

> You will need to create a new security group on your AWS account to forward the correct ports - in particular SSH should be open. Then reference this group in the Vagrantfile.

## Limitations

1. Currently, in the puppet manifests, files are referenced used instance specific module guids. This seems to be an issue with the AWS provider for vagrant. This will result in the first time you run 'vagrant up' you will see an error about it not being able to find the file referenced at a given file path with an ugly URL. To fix this you will have to copy the ugly file path from the error and paste it into the web-app puppet init manifest.
