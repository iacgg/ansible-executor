FROM mrscherrycoke/ansible-base:PLACEHOLDER AS ansible-vault

COPY ansible-vault.sh /ansible-vault.sh
RUN chmod +x /ansible-vault.sh
ENTRYPOINT ["/ansible-vault.sh"]
