# Laptop Setup - Fedora 29 (2018)

NOTE: Take everything and anything in this document with a massive grain of salt.
This is currently a dumping ground for thoughts, and notes, on how I have my personal computing devices configured. Some stuff here may be of help. Especially if you intend to utilise SteamPlay under Fedora. (Slight differences between Ubuntu and Fedora require some tweaks to the usual guides).

## Packages

```
# General immediate installs.
sudo dnf install \
xbacklight \
xterm \
sddm \
mesa-dri-drivers \
xorg-x11-drv-evdev \
xorg-x11-drv-fbdev\
xorg-x11-drv-synaptics \
wpa_supplicant \
NetworkManager-wifi \
dnf-plugin-tracer \
network-manager-applet \
NetworkManager-openvpn \
git \
tmux \
htop \
@development-tools \
vim \
powertop \
tlp \
fwupd \
iwl7260-firmware \
bash-completion \
stow \
tree \
lm_sensors \
light \
firefox
```

## Setup and connect to WiFi

```
nmcli device wifi list
nmcli defice wifi connect <SSID> password <password>
```

Personal .dotfiles, initial setup
```
git clone https://github.com/kirikae/.dotfiles.git --recursive ~/Repositories/.dotfiles
stow -t ~ -d ~/Repositories/.dotfiles vim
rm -f ~/.bash{rc,_profile}
stow -t ~ -d ~/Repositories/.dotfiles bash
```

Fedora 28 ROFI dependencies:
[rofi: Overview and Installation](https://blog.wizardsoftheweb.pro/rofi-overview-and-installation/)
```
git clone https://github.com/DaveDavenport/rofi --recursive ~/Repositories/rofi
cd ~/Repositories/rofi
sudo dnf install \
make \
autoconf \
automake \
pkg-config \
flex \
bison \
pango \
pango-devel \
cairo \
cairo-devel \
glib2 \
glib2-devel \
librsvg2 \
librsvg2-devel \
libxkbcommon \
libxkbcommon-devel \
libxkbcommon-x11 \
libxkbcommon-x11-devel \
libxcb \
libxcb-devel \
startup-notification \
startup-notification-devel \
xcb-util \
xcb-util-devel \
xcb-util-wm \
xcb-util-wm-devel \
xcb-util-xrm \
xcb-util-xrm-devel \
check \
check-devel \
libasan

autoreconf -i

mkdir ~/Repositories/rofi/build && cd ~/Repositories/rofi/build
../configure && make
sudo make install
```

Fedora 28 Polybar install
[Polybar Compilation](https://github.com/jaagr/polybar/wiki/Compiling)
```
git clone --branch 3.2 --recursive https://github.com/jaagr/polybar.git ~/Repositories/polybar
cd ~/Repositories/polybar

# Install dependencies
sudo dnf install \
cmake \
@development-tools \
cairo-devel \
xcb-util-devel \
xcb-proto \
xcb-util-image-devel \
xcb-util-wm-devel \
xcb-util-cursor-devel \
alsa-lib-devel \
pulseaudio-libs-devel \
i3-ipc \
jsoncpp-devel \
libmpdclient-devel \
libcurl-devel \
wireless-tools-devel \
gcc-c++ \
clang \
python

mkdir ~/Repositories/polybar/build
cd ~/Repositories/polybar/build
cmake ..
sudo make install

# If an issue arises, try with clang instead:
cmake -DCMAKE_C_COMPILER="clang" -DCMAKE_CXX_COMPILER="clang++" ..
```

Fedora 28 urxvt-unicode w/ Powerlines patch
[Patched Powerline fonts via urxvt](https://blog.wizardsoftheweb.pro/compiling-rxvt-unicode-on-fedora-27/)
```
git clone https://github.com/exg/rxvt-unicode ~/Repositories/rxvt-unicode
cd ~/Repositories/rxvt-unicode
git submodule add https://github.com/enki/libev
git submodule add https://github.com/yusiwen/libptytty

sudo dnf install \
git \
gcc \
gcc-c++ \
perl \
automake \
redhat-rpm-config \
perl-ExtUtils-ParseXS \
libX11 \
libX11-devel \
libXft \
libXft-devel

# Fix a different install location for xsubpp
ln -s /usr/share/perl5/vendor_perl/ExtUtils/xsubpp /usr/share/perl5/ExtUtils/xsubpp

# Fix some issues with the Makefile under Fedora
sed -i 's/CPPFLAGS = @CPPFLAGS@/CPPFLAGS = @CPPFLAGS@ -fPIC/' src/Makefile.in

./autogen.sh
./configure --prefix=/usr --enable-everything
make
# Remove repo install rxvt-unicode, in case it's present
sudo dnf remove rxvt-unicode
sudo make install
```
Alternatively, use a patched version of the code-base from CJ Harries
```
git clone https://github.com/thecjharries/rxvt-unicode.git --recursive ~/Repositories/rxvt-unicode
cd ~/Repositories/rxvt-unicode
sudo dnf install \
git \
gcc \
gcc-c++ \
perl \
automake \
redhat-rpm-config \
perl-ExtUtils-ParseXS \
libX11 \
libX11-devel \
libXft \
libXft-devel
./autogen.sh
./configure --prefix=/usr --enable-everything && make
sudo make install
```

Fedora 28 bspwm & sxhkd
[bspwm for dummies](https://github.com/windelicato/dotfiles/wiki/bspwm-for-dummies)
```
git clone https://github.com/baskerville/bspwm.git ~/Repositories/bspwm
git clone https://github.com/baskerville/sxhkd.git ~/Repositories/sxhkd

# Install dependencies
sudo dnf install \
xcb-util-devel \
xcb-util-keysyms-devel \
xcb-util-wm-devel \
alsa-lib-devel \
dmenu \
terminus-fonts \
@development-tools

cd ~/Repositories/bspwm
make
sudo make install
cd ~/Repositories/sxhkd
make
sudo make install

sudo cp ~/Repositories/bspwm/contrib/freedesktop/bspwm.desktop /usr/share/xsessions/

# Config some of the bspwm personal .dotfiles
stow -t ~ -d ~/Repositories/.dotfiles bspwm
stow -t ~ -d ~/Repositories/.dotfiles polybar
stow -t ~ -d ~/Repositories/.dotfiles rofi
```

Fedora 28 GUI dependencies
```
sudo dnf install \
@base-x \
lightdm \
lightdm-gtk \
xclip \
mesa-vulkan-drivers \
xscreensaver \
```

### Random packages
```

arc-theme \
dejavu-sans-mono-fonts \
liberation-*-fonts \
@base-x \
lightdm \
lightdm-gtk \
xclip \
pciutils \
firefox \
xorg-x11-server-Xorg \
xorg-x11-drv-evdev \
xorg-x11-drv-intel \
xorg-x11-drv-libinput \
xorg-x11-xinit \
xterm \
firefox \
xbacklight \
volumeicon \
glx-utils \
mesa-dri-drivers \
mesa-vulkan-drivers \
plymouth-system-theme \
xorg-x11-drv-evdev \
xorg-x11-drv-fbdev \
xorg-x11-drv-intel \
xorg-x11-drv-libinput \
xorg-x11-drv-vesa \
xorg-x11-server-Xorg \
xorg-x11-server-utils \
xorg-x11-utils \
xorg-x11-xauth \
xorg-x11-xinit \
xorg-x11-apps \
libxkbcommon-x11 \
libxkbcommon-x11-devel \
flex \
bison \
pango \
pango-devel \
cairo \
cairo-devel \
glib2 \
glib2-devel \
librsvg2 \
librsvg2-devel \
libxkbcommon \
libxkbcommon-devel \
libxkbcommon-x11 \
libxkbcommon-x11-devel \
libxcb \
libxcb-devel \
startup-notification \
startup-notification-devel \
xcb-util \
xcb-util-devel \
xcb-util-wm \
xcb-util-wm-devel \
xcb-util-xrm \
xcb-util-xrm-devel \
check \
check-devel \
xbacklight \
xscreensaver \
xcompmgr \
xrandr \
arandr \
xsel \
xclip \
xkill \
adwaita-gtk2-theme \
adwaita-icon-theme \
dmenu \
i3lock \
feh \
jsoncpp \
libmpdclient \
libcurl-devel \
xcb-util-devel \
xcb-proto \
xcb-util-image-devel \
xcb-util-wm-devel \
xcb-util-cursor-devel \
cairo-devel \
i3-ipc \
jsoncpp-devel \
libmpdclient-devel \
pulseaudio-libs-devel \
wireless-tools-devel \
libnl3-devel \
xautolock \
x11-ssh-askpass \
xdg-utils \
xsensors \
dbus-x11 \
cmake \
pulseaudio \
pulseaudio-libs \
pulseaudio-utils \
alsa-plugins-pulseaudio \
alsa-utils \
pavucontrol \
gstreamer1 \
gstreamer1-plugins-bad-free \
gstreamer1-plugins-bad-free-gtk \
gstreamer1-plugins-base \
gstreamer1-plugins-good
# libxcb-xrm-devel - this one doesn't exist (Wiz)

```

These need to be done after the initial package installs... nVidia seems to cause some odd issues with X11
TODO: Troubleshoot nVidia drivers
`sudo dnf install fedora-workstation-repositories`
`sudo dnf config-manager --set-enabled rpmfusion-nonfree-nvidia-driver`
`sudo dnf config-manager --set-enabled rpmfusion-nonfree-steam`


## Environment setup

`systemctl enable lightdm.service`
`systemctl set-default graphical.target`

```
mkdir ~/{Repositories}
git clone	https://github.com/baskerville/bspwm.git ~/Repositories/bspwm
git clone https://github.com/baskerville/sxhkd.git ~/Repositories/sxhkd
git clone https://github.com/baskerville/xdo.git ~/Repositories/xdo
git clone https://github.com/baskerville/sutils.git ~/Repositories/sutils
git clone https://github.com/baskerville/xtitle.git ~/Repositories/xtitle
stow -t ~ -d ~/Repositories/.dotfiles vim
stow -t ~ -d ~/Repositories/.dotfiles bash
stow -t ~ -d ~/Repositories/.dotfiles x
stow -t ~ -d ~/Repositories/.dotfiles bspwm
stow -t ~ -d ~/Repositories/.dotfiles
stow -t ~ -d ~/Repositories/.dotfiles
vim 
Then run the :PluginInstall command to enable the plugins
```

## General Hardware Configuration

If only using a SSD of some kind, we can disable lvmetad to prevent annoying warnings be spat out for no benefit.

`vim /etc/lvm/lvm.conf` and replace the line `use_lvmetad = 1` with `use_lvmetad = 0`

Fixes for some oddities of the hardware, append to the `GRUB_CMDLINE_LINUX`
`i915.edp_vswing=2 i915.preliminary_hw_support=1 acpi_backlight=vendor acpi_osi=Linux`
Then run `sudo grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg`

SSDs benefit from `noatime` on the mount points (no point trying to improve performance in a way that doesn't work on SSDs).
Make sure the mount points in `/etc/fstab` have `noatime` as an option of the mount point.

Note, for touchpad configuration and such, you can refer to the following [Arch Linux XPS 15 9550](https://ahxxm.com/151.moew/#touchpad-tap-as-click-and-natural-scroll) Specifically, the "Touchpad, tap as click and natural scroll" section

## Gaming setup
Allow for Elite Dangerous to be played.

```
sudo dnf install winetricks
#Download and place protontricks in place
mkdir -p ~/.local/share/Steam/compatibilitytools.d
wget https://github.com/redmcg/wine/releases/download/ED_Proton_3.16-4_Beta/Proton_3.16-4_Beta_ED.tar.gz ~/.local/share/Steam/compatibilitytools.d/
cd ~/.local/share/Steam/compatibilitytools.d/
tar xf Proton_3.16-4_Beta_ED.tar.gz
#Increase the File Descriptor limit in Fedora
#See the following link for an explanation:
# https://github.com/zfigura/wine/blob/esync/README.esync
sudo sed -i '$i/\* hard nofile 1048576' /etc/security/limits.conf
sudo echo "DefaultLimitNOFILE=1024:1048576" >> /etc/systemd/system.conf
sudo echo "DefaultLimitNOFILE=1024:1048576" >> /etc/systemd/user.conf
sudo systemctl daemon-reexec
# Restart your session...
```

After the above, either log out, then back in, or reboot.

You can check you're limits for FD via either `ulimit -n` or, in some case `ulimit -Hn` (the later may be different if `systemd` has anything to say...)

For details about the Steam settings and gaming on Linux, see:
https://steamcommunity.com/games/221410/announcements/detail/1696055855739350561

Next...
```
Install protontricks:
wget https://raw.githubusercontent.com/Sirmentio/protontricks/master/protontricks && chmod +x protontricks
sudo cp protontricks /usr/bin/protontricks
protontricks 359320 dotnet40 win7
```
