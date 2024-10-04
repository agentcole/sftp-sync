#!/bin/bash

# Check for and install dependencies
install_dependency() {
    if ! command -v $1 &> /dev/null; then
        echo "$1 is not installed. Installing..."
        if [[ "$OSTYPE" == "darwin"* ]]; then
            brew install $1
        elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
            if command -v apt-get &> /dev/null; then
                sudo apt-get update && sudo apt-get install -y $1
            elif command -v yum &> /dev/null; then
                sudo yum install -y $1
            else
                echo "Unsupported package manager. Please install $1 manually."
                exit 1
            fi
        else
            echo "Unsupported operating system. Please install $1 manually."
            exit 1
        fi
    else
        echo "$1 is already installed."
    fi
}

# Install dependencies
install_dependency "rsync"
install_dependency "ssh"
install_dependency "yq"

# Create necessary directories
mkdir -p ~/bin
mkdir -p ~/.config/sftp-sync

# Copy the main script
cp bin/sftp-sync ~/bin/
chmod +x ~/bin/sftp-sync

# Copy the config file if it doesn't exist
if [ ! -f ~/.sftp-sync-config.yml ]; then
    cp config/sftp-sync-config.yml.example ~/.sftp-sync-config.yml
    echo "Config file created at ~/.sftp-sync-config.yml. Please edit it with your server details."
fi

# Add ~/bin to PATH if it's not already there
if [[ ":$PATH:" != *":$HOME/bin:"* ]]; then
    echo 'export PATH=$PATH:$HOME/bin' >> ~/.bash_profile
    echo 'export PATH=$PATH:$HOME/bin' >> ~/.zshrc
    echo "Added ~/bin to PATH. Please restart your terminal or run 'source ~/.bash_profile' (or ~/.zshrc)."
fi

echo "Installation complete!"