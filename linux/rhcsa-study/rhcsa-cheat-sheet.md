# RHCSA Cheat sheet
## A Cheat sheet for linux command and concepts related to the RHCSA certification as of July 31st, 2021.
If you're here and reading this, you can do it! And this can help. I believe in you and the power of good note-taking.  
This cheat sheet is organized by exam objectives and subobjectives. Each sub-objective has relevant notes underneath with commands and topics related to it. Good luck!

## Objectives

### Understand and use essential tools (Todo)
#### Access a shell prompt and issue commands with correct syntax (Todo)
#### Use input-output redirection (>, >>, |, 2>, etc.) (Todo)
#### Use grep and regular expressions to analyze text (Todo)
#### Access remote systems using SSH
```bash
ssh user@remote command
```
You can execute commands on a remote server without connecting by specifying command after ssh

#### Log in and switch users in multiuser targets
```bash
su - <user>
```
Switches your user. If user is left out it will assume root.

```bash
sudo -i
```
Switches you to root user if you have sudo access

```bash
sudo su - user
```
Lets you switch to a user whose password you don't know if you have sudo access

#### Archive, compress, unpack, and uncompress files using tar, star, gzip, and bzip2 (Todo)
#### Create and edit text files (Todo)
#### Create, delete, copy, and move files and directories (Todo)
#### Create hard and soft links (Todo)
#### List, set, and change standard ugo/rwx permissions (Todo)
#### Locate, read, and use system documentation including man, info, and files in /usr/share/doc (Todo)

### Create simple shell scripts (Todo)
#### Conditionally execute code (use of: if, test, [], etc.) (Todo)
#### Use Looping constructs (for, etc.) to process file, command line input (Todo)
#### Process script inputs ($1, $2, etc.) (Todo)
#### Processing output of shell commands within a script (Todo)
#### Processing shell command exit codes (Todo)

### Operate running systems (Todo)
#### Boot, reboot, and shut down a system normally (Todo)
#### Boot systems into different targets manually (Todo)
#### Interrupt the boot process in order to gain access to a system (Todo)
#### Identify CPU/memory intensive processes and kill processes (Todo)
#### Adjust process scheduling (Todo)
#### Manage tuning profiles (Todo)
#### Locate and interpret system log files and journals (Todo)
#### Preserve system journals (Todo)
#### Start, stop, and check the status of network services (Todo)
#### Securely transfer files between systems

```bash
scp user@remote:path/to/file local/dest/path
```
Lets you copy a file over ssh from a remote to local destination

```bash
sftp user@remote
```
Lets you use sftp to copy files.
mget used to get files

### Configure local storage (Todo)
#### List, create, delete partitions on MBR and GPT disks (Todo)
#### Create and remove physical volumes (Todo)
#### Assign physical volumes to volume groups (Todo)
#### Create and delete logical volumes (Todo)
#### Configure systems to mount file systems at boot by universally unique ID (UUID) or label (Todo)
#### Add new partitions and logical volumes, and swap to a system non-destructively (Todo)

### Create and configure file systems (Todo)
#### Create, mount, unmount, and use vfat, ext4, and xfs file systems (Todo)
#### Mount and unmount network file systems using NFS (Todo)
#### Extend existing logical volumes (Todo)
#### Create and configure set-GID directories for collaboration (Todo)
#### Configure disk compression (Todo)
#### Manage layered storage (Todo)
#### Diagnose and correct file permission problems (Todo)

### Deploy, configure, and maintain systems (Todo)
#### Schedule tasks using at and cron (Todo)
#### Start and stop services and configure services to start automatically at boot (Todo)
#### Configure systems to boot into a specific target automatically (Todo)
#### Configure time service clients (Todo)
#### Install and update software packages from Red Hat Network, a remote repository, or from the local file system (Todo)
#### Work with package module streams (Todo)
#### Modify the system bootloader (Todo)

### Manage basic networking (Todo)
#### Configure IPv4 and IPv6 addresses (Todo)
#### Configure hostname resolution (Todo)
#### Configure network services to start automatically at boot (Todo)
#### Restrict network access using firewall-cmd/firewall (Todo)

### Manage users and groups (Todo)
#### Create, delete, and modify local user accounts (Todo)
#### Change passwords and adjust password aging for local user accounts (Todo)
#### Create, delete, and modify local groups and group memberships (Todo)
#### Configure superuser access(Todo)

### Manage security (Todo)
#### Configure firewall settings using firewall-cmd/firewalld (Todo)
#### Create and use file access control lists (Todo)
#### Configure key-based authentication for SSH (Todo)

##### Configure passwordless ssh login
- Switch to user you want to configure passwordless login for
- Generate a ssh key with ssh-keygen
- Use ssh-copy-id for user on the other server

#### Set enforcing and permissive modes for SELinux (Todo)
#### List and identify SELinux file and process context (Todo)
#### Restore default file contexts (Todo)
#### Use boolean settings to modify system SELinux settings (Todo)
#### Diagnose and address routine SELinux policy violations (Todo)

### Manage containers (Todo)
#### Find and retrieve container images from a remote registry (Todo)
#### Inspect container images (Todo)
#### Perform container management using commands such as podman and skopeo (Todo)
#### Perform basic container management such as running, starting, stopping, and listing running containers (Todo)
#### Run a service inside a container (Todo)
#### Configure a container to start automatically as a systemd service (Todo)
#### Attach persistent storage to a container (Todo)

## How tos
