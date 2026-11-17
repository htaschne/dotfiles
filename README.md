# dotfiles ✨

```sh
git clone --recurse-submodules https://github.com/htaschne/dotfiles.git ~/.config
cd ~/.config
./install.sh
```

That’s it! Your configs and `~/.tmux.conf` link are ready 🐾

## macOS: use Touch ID with `sudo`

Enable Touch ID for `sudo` prompts—including those in Ghostty—by creating
macOS’s local `sudo` PAM configuration:

```sh
sudo sh -c 'printf "auth       sufficient     pam_tid.so\n" > /etc/pam.d/sudo_local'
```

Verify it, then clear sudo’s cached authentication and test the prompt:

```sh
cat /etc/pam.d/sudo_local
sudo -k
sudo -v
```

Touch ID is available only from a local macOS login session; it is not offered
over SSH.
