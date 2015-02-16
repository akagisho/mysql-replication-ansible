# mysql-replication-ansible

## Requirements

- Vagrant 1.5+
- Ansible

## Usage

### Setup

Add below lines to `~/.ssh/config` of your local machine.

    Host 10.200.19.*
        User vagrant
        IdentityFile ~/.vagrant.d/insecure_private_key
        UserKnownHostsFile /dev/null
        StrictHostKeyChecking no

Clone this repository.

    $ git clone https://github.com/akagisho/mysql-replication-ansible.git
    $ cd mysql-replication-ansible

Start vagrant VMs.

    $ vagrant up

Check VMs' connection.

    $ ansible -i develop/inventory all -m ping
    10.200.19.21 | success >> {
        "changed": false,
        "ping": "pong"
    }

    10.200.19.22 | success >> {
        "changed": false,
        "ping": "pong"
    }

### Execute

Execute ansible playbook.

    $ ansible-playbook -i develop/inventory site.yml

Check replication status.

    $ ssh 10.200.19.22 "sudo -H mysql -e 'SHOW SLAVE STATUS\G'"

## References

* [Ansible で MySQL のレプリケーションを設定する](http://blog.akagi.jp/archives/4378.html) - あかぎメモ
