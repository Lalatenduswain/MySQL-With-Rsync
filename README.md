# MySQL Database Backup Script

This Bash script automates the process of backing up a MySQL database and transferring it to a remote server using Rsync. It was created by [Lalatendu Swain](https://github.com/Lalatenduswain) in March 2023.

## Prerequisites

Before using this script, ensure the following:

- MySQL is installed on the local machine.
- SSH access to the remote server is configured.
- You have the necessary permissions to access the MySQL databases.
- Replace `secretsgohere` in the script with your actual MySQL password.
- Modify other variables in the script as needed to match your environment.

## Usage

1. Clone this repository to your local machine or download the script directly.

```bash
git clone https://github.com/Lalatenduswain/MySQL-With-Rsync.git
cd MySQL-With-Rsync
```

2. Make the script executable.

```bash
chmod +x backup-mysql.sh
```

3. Execute the script.

```bash
./backup-mysql.sh
```

## Script Explanation

- The script begins by setting various variables such as the filename, local and remote paths, backup server address, MySQL password, and more.

- It checks for the existence of a lock file to prevent concurrent executions of the script.

- The script then performs a MySQL database dump using `mysqldump` and saves the backup to a local file.

- Next, it uses `rsync` to transfer the backup file to the specified remote server over SSH.

- There are commented-out sections in the script for additional functionalities, such as creating a symlink to the latest backup and loading the MySQL dump on the remote server. Uncomment and modify these sections as needed.

- Finally, the script removes the local backup file and releases the lock.

## License

This script is open-source and distributed under the MIT License. Feel free to modify and use it as needed in your projects.

## Acknowledgments

Special thanks to Lalatendu Swain for creating this useful MySQL backup script.

---

**Note:** Please make sure to handle sensitive information such as passwords and SSH keys with care. It's recommended to use environment variables or other secure methods to store and access this information.
```

You can add this content to your repository's README.md file on GitHub by editing the README.md file directly in your repository and pasting this content into it.
































This script is designed to backup a MySQL database and copy the resulting dump file to a remote server using rsync. Here's a breakdown of the script:

The script starts by setting some variables that will be used throughout the script. These include the filename of the dump file, the local file path to save the dump, the lock file location, the IP address of the backup server, the password for the MySQL database, the remote file path to save the dump, and the remote file name.

The script then checks if a lock file exists. If it does, the script exits. If not, the script creates a lock file to prevent multiple instances of the script from running simultaneously.

The script then dumps the MySQL databases to a file using the mysqldump command. The --single-transaction and --quick options help ensure that the dump is as close to a point-in-time snapshot as possible. If the dump is successful, the script outputs a success message. If not, the script outputs an error message and exits.

The script then copies the dump file to the remote server using rsync. The -e option specifies the command to use for the remote shell, and the -vazP options specify verbose output, archive mode, and partial file transfers. The file is transferred to the remote server as $REMOTEFILE.

The script then removes the local dump file.

Finally, the script removes the lock file.

There are some additional commented-out lines in the script that could be used to create a symlink to the latest backup file or load the dump file on the remote server.
