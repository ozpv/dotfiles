# Dotfiles
gruvbox + dwm

## Prerequisites

#### Main Repositories
- lf
- picom
- nitrogen
- neofetch
- networkmanager

#### Other
- [st](https://github.com/ozpv/st)
- [dwm](https://github.com/ozpv/dwm)
- [dmenu](https://github.com/ozpv/dmenu)
- [dwmblocks](https://github.com/ozpv/dwmblocks)
- [FiraCode Nerd Font](https://www.nerdfonts.com/font-downloads)
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- [networkmanager-dmenu](https://github.com/firecat53/networkmanager-dmenu)
- [gruvbox-material-gtk](https://github.com/TheGreatMcPain/gruvbox-material-gtk)
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)


## Notes

### networkmanager-dmenu installation (void)

Step 1: clone & copy networkmanager_dmenu to $PATH
```
git clone https://github.com/firecat53/networkmanager-dmenu
cd networkmanager-dmenu
sudo cp networkmanager_dmenu /usr/local/bin/networkmanager_dmenu
```

Step 2: down dhcpcd, wpa_supplicant, and wicd
```
sudo sv down dhcpcd
sudo sv down wpa_supplicant
sudo sv down wicd
sudo rm /var/service/dhcpcd
sudo rm /var/service/wpa_supplicant
sudo rm /var/service/wicd
sudo touch /etc/sv/dhcpcd/down
sudo touch /etc/sv/wpa_supplicant/down
sudo touch /etc/sv/wicd/down
```
Step 3: up dbus & networkmanager
```
sudo ln -s /etc/sv/dbus /var/service/
sudo sv up dbus
sudo ln -s /etc/sv/NetworkManager /var/service/
sudo sv up NetworkManager
```

Step 4: append sudo exception to /etc/sudoers
```
su
```
then
```
echo "<user> ALL = NOPASSWD: /usr/local/bin/networkmanager_dmenu" >> /etc/sudoers
```
make sure to replace the <user> placeholder with your username
