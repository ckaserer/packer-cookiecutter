[![Build Status](https://travis-ci.com/ckaserer/packer-cookiecutter.svg?branch=master)](https://travis-ci.com/ckaserer/packer-cookiecutter)
![GitHub](https://img.shields.io/github/license/ckaserer/packer-cookiecutter)
![Maintenance](https://img.shields.io/maintenance/yes/2020)
<br>
<br>

# packer-cookiecutter

Requirements
------------

* Python 3.5 or later
* Cookiecutter 1.6 or later https://cookiecutter.readthedocs.io/en/latest/installation.html
* Packer version 15 or later https://packer.io/downloads.html

Quick start
-----------

To generate project from the packer-cookiecutter template, please run the following command.

```
cookiecutter git@github.com:ckaserer/packer-cookiecutter
```

Then the cookiecutter command ask for several questions on generated project as follows.

```
cookiecutter git@github.com:ckaserer/packer-cookiecutter
repo [changeme-repo]: 
git_org [ckaserer]: 
vm_name [changeme-vm]: 
root_pw [changeme-pw]: 
```

Then you get the generated project directory, ``packer-changeme``.

Initial directories and files
-----------------------------

The following is the initial directory structure generated in the previous section.

```
├── .ci                             <- scripts utilized in a CI can be put here
│   ├── build.sh                    <- cleanup and build vm script
│   └── test.sh                     <- execute build script wrapped via bashrc fuction
├── .github                         <- github issue templates
│   └── ISSUE_TEMPLATE
│       ├── bug_report.md
│       └── feature_request.md
├── .gitignore
├── .travis.yml                     <- travis ci definition
├── CODE_OF_CONDUCT.md
├── LICENSE                         <- GPLv3
├── README.md
├── Vagrantfile                     <- Vagrantfile to start VM as vagrant box
├── ansible                         
│   ├── main.yml                    <- core provisioning logic
│   └── requirements.yml            <- ansible galaxy dependencies can be added here
├── bashrc                          <- defines functions to build the VM
├── box-config.json
├── http
│   └── ks.cfg                      <- minimal kickstart file
└── scripts
    ├── 0-machine-id.sh             <- fix machine-id issue with duplicate IP addresses being assigned
    ├── 1-cabundle.sh               <- add trusted root certificate
    ├── 2-ansible.sh                <- install ansible to run core provising logic
    ├── 3-cleanup.sh                <- clean package cache, history,...
    └── 4-zerodisk.sh               <- Zero out free space to save space in the final image
```
