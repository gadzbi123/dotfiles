set -eou

sudo dnf update --refresh -y
# packages to build nvidia
sudo dnf install kernel-devel kernel-headers gcc make dkms acpid libglvnd-glx libglvnd-opengl libglvnd-devel pkgconfig alacritty libheif-freeworld -y
# Install nonfree repos
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y

sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
# Add nonfree repos to cache
sudo dnf makecache -y
# packages for nvidia proprietary drivers
sudo dnf install akmod-nvidia xorg-x11-drv-nvidia-cuda vidia-vaapi-driver libva-utils vdpauinfo -y
# default apps
sudo dnf install @gnome-desktop neovim fedora-workstation-repositories pavucontrol golang fzf ripgrep xclip btop gimp -y
# Allow heap exchange for wine processes
sudo setsebool -P selinuxuser_execheap 1
# Install lua lang server for nvim
sudo dnf copr enable yorickpeterse/lua-language-server -y

sudo dnf install lua-language-server -y
# Install Gooogle Chrome
sudo dnf config-manager --set-enabled google-chrome

sudo dnf install google-chrome-stable -y
# Install vscode
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc

sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/vscode

sudo dnf install code -y
# Install steam
sudo dnf install steam --enablerepo=rpmfusion-nonfree-steam  -y 
# Install discord
sudo dnf install discord -y

# Mount gry i filmy
sudo mkdir -p /run/media/gadzbi/GryIFilmy
sudo -s eval 'echo UUID=5C6AF5226AF4FA1A /run/media/gadzbi/GryIFilmy ntfs defaults 0 2 >> /etc/fstab2; mount -a'

# Add default editor
echo "\nexport EDITOR=nvim" >> $HOME/.bashrc
echo "\nexport PATH=$PATH:$HOME/go/bin" >> $HOME/.bashrc

gsettings set org.cinnamon.desktop.default-applications.terminal exec alacritty
