# dotfiles
gruvbox + dwm

## prerequisites

#### main repositories

| **Prerequisite** | **Purpose** |
|------------------|-------------|
|lf|terminal file manager|
|zsh|interactive shell/interpreter|
|picom|compositor|
|nitrogen|set the desktop background|
|neofetch|system information tool|
|networkmanager|networking|

#### other
| **Prerequisite** | **Purpose** |
|------------------|-------------|
|[st](https://github.com/ozpv/st)|terminal emulator|
|[dwm](https://github.com/ozpv/dwm)|window manager|
|[dmenu](https://github.com/ozpv/dmenu)|application launcher/more|
|[dwmblocks](https://github.com/ozpv/dwmblocks)|status bar|
|[FiraCode Nerd Font](https://www.nerdfonts.com/font-downloads)|terminal font|
|[zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)|autosuggestions for zsh|
|[networkmanager-dmenu](https://github.com/firecat53/networkmanager-dmenu)|manage networking|
|[gruvbox-material-gtk](https://github.com/TheGreatMcPain/gruvbox-material-gtk)|gtk theme|
|[zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)|syntaxhighlighting for zsh|

#### copy & paste

```
sudo xbps-install -S lf zsh picom nitrogen neofetch NetworkManager
```

## notes

### dwm/powermenu installation

step 1: clone & install my build of dwm
```
git clone https://github.com/ozpv/dwm
cd dwm
sudo make install
```

step 2: append sudo exception to /etc/sudoers
```
su
```
then
```
echo "<user> ALL = NOPASSWD: /sbin/reboot" >> /etc/sudoers
echo "<user> ALL = NOPASSWD: /sbin/poweroff" >> /etc/sudoers
echo "<user> ALL = NOPASSWD: /sbin/ZZZ" >> /etc/sudoers
```
make sure to replace the user placeholder with your username

### networkmanager-dmenu installation (void)

step 1: clone & copy networkmanager_dmenu to $PATH
```
git clone https://github.com/firecat53/networkmanager-dmenu
cd networkmanager-dmenu
sudo cp networkmanager_dmenu /usr/local/bin/networkmanager_dmenu
```

step 2: down dhcpcd, wpa_supplicant, and wicd
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
step 3: up dbus & networkmanager
```
sudo ln -s /etc/sv/dbus /var/service/
sudo sv up dbus
sudo ln -s /etc/sv/NetworkManager /var/service/
sudo sv up NetworkManager
```

step 4: append sudo exception to /etc/sudoers
```
su
```
then
```
echo "<user> ALL = NOPASSWD: /usr/local/bin/networkmanager_dmenu" >> /etc/sudoers
```
make sure to replace the user placeholder with your username

### libXft-devel not installing (breaking pre-installed packages)

step 1: update your system
```
sudo xbps-install -Su
```
You might have have to run this command twice If your update includes the xbps package, XBPS must use a separate transaction to update itself and you will need to run the above command a second time to apply the rest of the updates

step 2: install libXft-devel
```
sudo xbps-install libXft-devel
```
