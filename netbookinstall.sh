pacman -Syu --noconfirm
pacman -Syuf --noconfirm
pacman -S base-devel git 
wget http://dl.suckless.org/dwm
dwmfile=$(cat dwm|grep dwm|cut -d '=' -f3|cut -d '>' -f1|tail -1|cut -d '"' -f2)
echo $dwmfile
wget http://dl.suckless.org/dwm/$dwmfile
rm dwm
cd ~/
mkdir tmp && cd tmp
tar xvf ~/$dwmfile
mv `echo $dwmfile|cut -d "." -f1-2` ./dwm
git clone git@github.com:danielwallace/dotfiles
cp dotfiles/dwm/config.h dwm/
make clean install
mv dotfiles ~/dotfiles
cd ~/
bash ~/dotfiles/setup.sh
daemons=cat /etc/rc.conf |grep "^DAEMONS=" |cut -d ")" -f1
echo $daemons" dbus wicd)
rm -rf ~/tmp ~/$dwmfile ~/dotfiles
