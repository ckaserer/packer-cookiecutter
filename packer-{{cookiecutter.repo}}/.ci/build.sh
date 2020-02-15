#!/bin/bash -x

vagrant destroy -f
VAGRANT_BOX=$(vagrant box list | grep {{ cookiecutter.vm_name }} | awk '{print $1}')
[[ -z "${VAGRANT_BOX}" ]] || vagrant box remove --force ${VAGRANT_BOX}
packer build -var 'version=1.2.0' -force box-config.json