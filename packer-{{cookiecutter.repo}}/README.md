![GitHub](https://img.shields.io/github/license/ckaserer/packer-{{ cookiecutter.repo }})
![Maintenance](https://img.shields.io/maintenance/yes/2020)

# docker-{{ cookiecutter.repo }}

## Building the VM

```
packer build -var 'version=1.2.0' -force box-config.json
```

## Running the VM with vagrant

```
vagrant up
```

---
