# Ansible-Executor
The goal of this project, is to make it simple to get started with ansible as if it was a virtual env. ( https://github.com/mrscherrycoke/simple-python-virtualenv ) <br>
But why not use docker to get started!

# Usages
I use a alias for it. So it just replace my ansible-playbook command. You can also call the alias something else
You need to be in the root of your ansible folder, then running the command with this alias

ansible-playbook
```bash
alias ansible-playbook='docker run \
  -e "ANSIBLE_REMOTE_USER=$USER" \
  --mount type=bind,source="$(pwd)",target=/ansible \
  -v "$SSH_AUTH_SOCK:/ssh-agent" \
  -v "$HOME/.gnupg:/root/.gnupg" \
  -it \
   mrscherrycoke/ansible-playbook:latest'
```

ansible
```bash
alias ansible='docker run \
  -e "ANSIBLE_REMOTE_USER=$USER" \
  --mount type=bind,source="$(pwd)",target=/ansible \
  -v "$SSH_AUTH_SOCK:/ssh-agent" \
  -v "$HOME/.gnupg:/root/.gnupg" \
  -it \
   mrscherrycoke/ansible:latest'
```

ansible-vault
```bash
alias ansible-vault='docker run \
  -e "ANSIBLE_REMOTE_USER=$USER" \
  --mount type=bind,source="$(pwd)",target=/ansible \
  -v "$SSH_AUTH_SOCK:/ssh-agent" \
  -v "$HOME/.gnupg:/root/.gnupg" \
  -it \
   mrscherrycoke/ansible-vault:latest'
```

## Environment variables
The container is running as root, so you will need to defined that remote user you will use.
This can be done with a environment variable, in your config or as a variable for ansible
I pass it as a environment variable.
You alse need to place other custom ENV variable, if you have any for a dynamic inventory etc.

## Mounts
I normally just mount the folder i'm currently in. Because i replace my ansible-playbook command.
But you can defined what ansible folder you will run, no matter where you are located on you machibe
I also mount my SSH socket, and my GPG keys, when i'm working on a repo with ansible-vault that usages GPG.
Otherwise i pass my ansible vault password as a ENV variable to to container.

# Build & Push
./build.sh
