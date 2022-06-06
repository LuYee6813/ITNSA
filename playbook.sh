#!/bin/bash
if pgrep nginx > /dev/null
then
    echo "running"
else
    systemctl restart nginx
    if pgrep nginx > /dev/null
    then
        echo "running"
    else
        systemctl restart nginx
        if pgrep nginx > /dev/null
        then
            echo "running"
        else
            apt-get --purge autoremove nginx -Y
            ansible-playbook /etc/ansible/playbook.yml
        fi
    fi
fi