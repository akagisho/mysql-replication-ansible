# mysql-replication-ansible

## Requirements

- Vagrant 1.5+
- Ansible

## Usage

### Setup

Clone this repository.

    $ git clone https://github.com/akagisho/mysql-replication-ansible.git
    $ cd mysql-replication-ansible

### Execute

Start vagrant VMs and provision by using ansible.

    $ vagrant up

(After the first time) Execute ansible playbook.

    $ vagrant provosion

Check replication status.

    $ vagrant ssh node2 --command "sudo -H mysql -e 'SHOW SLAVE STATUS\G'"

## References

* [Ansible で MySQL のレプリケーションを設定する](http://blog.akagi.jp/archives/4378.html) - あかぎメモ
