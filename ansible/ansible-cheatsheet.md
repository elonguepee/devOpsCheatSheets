# Ansible Cheatsheet
A cheatsheet for Ansible concepts and commands

## Concepts
### Agentless
Ansible is agentless. No extra software needs to be installed on ansible targets becuase it uses ssh for linux and powershell remoting for windows.

### Inventory
A file with information about ansible target systems. It a list of servers with groups. To set an alias use this format:
```
<aliasname> ansible_host=server.fqdn ansible_connection=ssh
```
ansible_host is one of many inventory parameters. It specifies the fqdn of the server ansible connects to. Other parameters include:
- ansible_connection: This defines how ansible connects to the server. ssh for linux and winrm for windows.
- ansible_port: defines which port to connect to
- ansible_user: defines the user ansible uses
- ansible_ssh_pass: defines the ssh password for linux. Not a good idea to use

### Playbooks
A playbook is a single yaml file with a list of plays in it. Plays are a set of tasks to be run on a remote host. A task is an action to be run on a remote host, such as executing a command, running a script, etc.

### Modules
Modules are the actions run by tasks. 