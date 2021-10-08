# CentOS 7 Ansible Azure Image

## How to Build
  1. [Install Docker](https://docs.docker.com/engine/installation/).
  2. `cd` into this directory.
  3. Run `docker build . -t ansible`


## How to Use

  1. [Install Docker](https://docs.docker.com/engine/installation/).
  2. Run a container from the image: `docker run --privileged --rm --network host --name ansible_container ansible:latest sh -c "ansible-playbook --version"`
