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

### Idempotency
An action is idempotent if performing it multiple times results in the same state as running it once. Ansible ensures the state of something is in the desired state using words like started as opposed to start. With start example, Ansible will check if something has been started and if not, it will start it. If it has been started, Ansible won't do anything.

### Conditionals
Use 'when' keyword torun a playbook only if a certain condition is met.

### Loops
Loops run through a set of variables in a task. The use a loop, use the loop keyword or the with_items syntax. To represent the current item in the playbook, the 'item' keyword is used.

### Roles
A role represents a group of tasks that are run on a server to be considered part of that "role". Makes playbooks reusable. More about roles:
- Roles can be in a roles directory in the directory as the playbook calling them.
- Roles can also be added into a common roles directory on the system /etc/ansible/roles. The path to this directory can also be set in the /etc/ansible/ansible.cfg with the roles_path variable.

### ansible-galaxy
A tool that helps manage/generate ansible roles. An example of creating a new role:
```bash
ansible-galaxy init <rolename>
```
Will create a directory structure for a new role.

```bash
ansible-galaxy search <rolename>
```
Searches ansible galaxy for roles

```bash
ansible-galaxy install <rolename>
```
Installs a role to default roles directory.