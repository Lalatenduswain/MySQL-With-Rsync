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


Feel free to modify the README as needed to provide additional context, usage instructions, or any other relevant information.

**Note:** Make sure to have the necessary permissions and dependencies set up before running this script.

## Donations

If you want to show your appreciation, you can donate via [Buy Me a Coffee](https://www.buymeacoffee.com/lalatendu.swain)

## Disclaimer

This script is provided as-is and may require modifications or updates based on your specific environment and requirements. Use it at your own risk. The authors of the script are not liable for any damages or issues caused by its usage.
