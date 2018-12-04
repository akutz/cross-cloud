# Kubecon Provider
This directory contains the assets that enable Cross-Cloud integration with the
Kubecon provider.

## Prerequisites
This section highlights the requirements necessary to integrate Cross-Cloud
testing with VMware vSphere:

**Required**
* [Docker](#docker)

### Docker
Docker is required to provision the test environment. The environment is 
provisioned using the container image defined in this project's top-level 
directory:

```shell
$ docker build . --tag provisioning
```

## Getting Stared
Running the Cross-Cloud tests with Kubecon is separated into three phases:

* [Configure](#configure)
* [Deploy](#deploy)
* [Destroy](#destroy)

### Configure
The following environment variables are used to configure Cross-Cloud 
integration with Kubecon:

| Name | Description |
|------|-------------|
| `KEYMASTER` | Vinz Clortho |
| `GATEKEEPER` | Zuul |

### Deploy
The following command can be used to provision a Cross-Cloud environment to 
Kubecon:

```shell
$ docker run --rm -it --dns 147.75.69.23 --dns 8.8.8.8 \
  -v $(pwd)/data:/cncf/data \
  -e BACKEND=file \
  -e CLOUD=kubecon \
  -e COMMAND=deploy \
  -e NAME=kubecon \
  provisioning
```

The helper script `deploy.sh` in this directory may also be used:
```shell
$ hack/deploy.sh NAME
```

### Destroy
The following command can be used to deprovision a Cross-Cloud  environment 
deployed to Kubecon:

```shell
$ docker run --rm -it --dns 147.75.69.23 --dns 8.8.8.8 \
  -v $(pwd)/data:/cncf/data \
  -e BACKEND=file \
  -e CLOUD=kubecon \
  -e COMMAND=destroy \
  -e NAME=kubecon \
  provisioning
```

The helper script `destroy.sh` in this directory may also be used:
```shell
$ hack/destroy.sh NAME
```
