# SFTP-Sync

SFTP-Sync is a command-line tool for easily syncing local directories with remote SFTP servers. It supports multiple server configurations and remembers your sync preferences for each directory.

## Features

- Sync local directories to remote SFTP servers
- Support for multiple server configurations
- Automatic remembering of sync preferences for each directory
- Easy to use command-line interface

## Prerequisites

SFTP-Sync requires the following tools:

- Bash
- SSH client
- rsync
- yq (YAML parser)

The installation script will attempt to install these dependencies if they're not already present on your system.

## Installation

1. Clone this repository:
```sh
   git clone https://github.com/yourusername/sftp-sync.git
   cd sftp-sync
```

2. Run the installation script:
```sh
    chmod +x install.sh
   ./install.sh
```
   This script will:
   - Check for and install necessary dependencies (rsync, ssh, yq)
   - Copy the sftp-sync script to ~/bin
   - Create a config file at ~/.sftp-sync-config.yml if it doesn't exist
   - Add ~/bin to your PATH if it's not already there

3. Edit the config file with your server details:
```sh
   nano ~/.sftp-sync-config.yml
```

4. Restart your terminal or run `source ~/.bash_profile` (or `~/.zshrc`) to update your PATH.

Note: The installation script uses `brew` for macOS and `apt-get` or `yum` for Linux. If you're using a different package manager, you may need to install the dependencies manually.

## Usage

- To push/sync the current directory:
```sh
  sftp-sync push
```

- To list all current directory mappings:
```sh
  sftp-sync list
```

- To remove the mapping for the current directory:
```sh
  sftp-sync remove
```

## Configuration

Edit `~/.sftp-sync-config.yml` to add or modify server configurations. The format is:

```sh
servers:
  server_name:
    ip: server.ip.address
    user: username
    port: 22
    remote_base_dir: /path/on/remote/server
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.