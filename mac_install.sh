#!/bin/bash

# Configure bash
/bin/bash -c "$(curl -o ~/.bashrc https://raw.githubusercontent.com/NBprojekt/Dotfiles/HEAD/.bashrc)"
/bin/bash -c "$(curl -o ~/.bash_colors https://raw.githubusercontent.com/NBprojekt/Dotfiles/HEAD/.bash_colors)"
/bin/bash -c "$(curl -o ~/.bash_aliases https://raw.githubusercontent.com/NBprojekt/Dotfiles/HEAD/.bash_aliases)"
source ~/.bashrc

# Install homebrew if not available
if ( ! command -v brew &> /dev/null ); then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Enable fingerprint sudo
# Add `auth sufficient pam_tid.so` to `/etc/pam.d/sudo`
