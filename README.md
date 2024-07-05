# Ansible Roles

# Information to start
## create ansible user
in der Datei /etc/ssh/sshd_config "PermitRootLogin yes" setzen

    ssh root@<IP> -o StrictHostKeyChecking=no -o IdentitiesOnly=yes

## Ansible commands

   ansible-inventory -i inventory.ini --list

## Connection test
   
    ansible all -i inventory.ini -m ping

## Show facts

    ansible all -i inventory.ini -m setup

## test the playbook
    --check

## limit execution to a certain host
    --limit webserver

## show value for specific host and variable
    ansible rocky9 -m debug -a "var=fail2ban_loglevel" -i inventory.ini

## lint
    ansible-lint verify-apache.yml

-----------------------
## ab jetzt alles als ansible Benutzer
    ansible-playbook -i inventory.ini site.yml

## run only on mailserver
    ansible-playbook -i inventory.ini site.yml -l mailserver

## run only on certain tags
    ansible-playbook -i inventory.ini site.yml --tags "common"

## zum Testen
    ansible-playbook -i inventory.ini roles/checkmk/tasks/main.yaml

## list all tags
    ansible-playbook site.yml --list-tags

# OS Update

use -l to limit the update to a certain host

    ansible-playbook -i inventory.ini site.yml --tags "os_update" -l webserver