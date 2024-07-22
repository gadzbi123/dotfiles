set -eou

sudo dnf update --refresh -y

sudo dnf install kernel-devel kernel-headers gcc make dkms acpid libglvnd-glx libglvnd-opengl libglvnd-devel pkgconfig -y

sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y

sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

sudo dnf makecache -y

sudo dnf install akmod-nvidia xorg-x11-drv-nvidia-cuda vidia-vaapi-driver libva-utils vdpauinfo -y

sudo dnf install @gnome-desktop neovim fedora-workstation-repositories pavucontrol golang fzf ripgrep xclip btop gimp -y

sudo setsebool -P selinuxuser_execheap 1

sudo dnf copr enable yorickpeterse/lua-language-server -y

sudo dnf install lua-language-server -y

sudo dnf config-manager --set-enabled google-chrome

sudo dnf install google-chrome-stable -y

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc

sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/vscode

sudo dnf install code -y

sudo dnf install steam --enablerepo=rpmfusion-nonfree-steam  -y 

sudo dnf install discord -y
