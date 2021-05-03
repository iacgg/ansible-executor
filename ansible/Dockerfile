FROM mrscherrycoke/ansible-base:PLACEHOLDER AS ansible

COPY ansible.sh /ansible.sh
RUN chmod +x /ansible.sh
ENTRYPOINT ["/ansible.sh"]
