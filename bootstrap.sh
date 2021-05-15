#!/usr/bin/env bash

set -e

# Dotfiles' project root directory
ROOTDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# Host file location
HOSTS="$ROOTDIR/hosts"
# Main playbook
PLAYBOOK="$ROOTDIR/dotfiles.yml"


echo "[>] Ask for sudo password"
sudo -v

case "$(uname -s)" in
    Darwin)
        # install Command Line Tools
        if [[ ! -x /usr/bin/gcc ]]; then
          echo "[>] Install macOS Command Line Tools"
          xcode-select --install
        fi

        # install homwbrew
        if [[ ! -x /usr/local/bin/brew ]]; then
          echo "[>] Install Homebrew"
          ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        fi

        # install ansible
        if [[ ! -x /usr/local/bin/ansible ]]; then
            echo "[>] Install Ansible"
            brew install ansible
        fi

        # set macos defaults
        echo "[i] Set some specific macOS settings"
        # set +e
        # ./macos.bash
        # set -e
        ;;

    Linux)
        if [ -f /etc/os-release ]
            then
                . /etc/os-release

                case "$ID" in
                    debian | ubuntu)
                        if [[ ! -x /usr/bin/ansible ]]; then
                            echo "[>] Install Ansible"
                            sudo apt-get install -y ansible
                        fi
                        ;;

                    arch)
                        if [[ ! -x /usr/bin/ansible ]]; then
                            echo "[>] Install Ansible"
                            sudo pacman -S ansible --noconfirm
                        fi
                        ;;

                    *)
                        echo "[!] Unsupported Linux Distribution: $ID"
                        exit 1
                        ;;
                esac
            else
                echo "[!] Unsupported Linux Distribution"
                exit 1
            fi
        ;;

    *)
        echo "[!] Unsupported OS"
        exit 1
        ;;
esac

if [ -f "$HOME/.bashrc" ] && [ ! -h "$HOME/.bashrc" ]
then
    echo "[>] Move current ~/.bashrc to ~/bashrc_backup"
    mv "$HOME/.bashrc" "$HOME/bashrc_backup"
fi

if [ -f "$HOME/.bash_profile" ] && [ ! -h "$HOME/.bash_profile" ]
then
    echo "[>] Move current ~/.bash_profile to ~/bash_profile_backup"
    mv "$HOME/.bash_profile" "$HOME/bash_profile_backup"
fi

# Run main playbook
echo "[>] Run Playbook"

ansible-playbook -i "$HOSTS" "$PLAYBOOK" --ask-become-pass

echo "[>] Done."
exit 0
