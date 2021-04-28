# Usages
## Alias
```bash
alias ansible-playbook='docker run \
  -e "ANSIBLE_REMOTE_USER=$USER" \
  -v "$SSH_AUTH_SOCK:/ssh-agent" \
  --mount type=bind,source="$(pwd)",target=/ansible \
  -v "$HOME/.gnupg:/root/.gnupg" \
  -it \
  ae'
```

"-v "$HOME/.gnupg:/root/.gnupg" is only is using ansible-vault.
You need to be places in your ansible folder

# Build
```bash
docker build ./ -t ae
```
