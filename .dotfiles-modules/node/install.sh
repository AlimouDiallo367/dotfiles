current_user=$(whoami)
node_version=24

if which dnf &>/dev/null; then
  as_root <<_
    curl -fsSL https://rpm.nodesource.com/setup_$node_version.x | bash - >/dev/null
    dnf install -y nodejs
    if ! grep -Fxq "fs.inotify.max_user_watches=524288" /etc/sysctl.conf; then
      echo "fs.inotify.max_user_watches=524288" >> /etc/sysctl.conf && sysctl -p >/dev/null
    fi
    su $current_user -lc "mkdir -p /home/$current_user/.npm-global/lib; npm config set prefix /home/$current_user/.npm-global"
_
elif which apt-get &>/dev/null; then
  as_root <<_
    wget -q -O - https://deb.nodesource.com/setup_$node_version.x | bash - >/dev/null
    apt-get install -y nodejs
    if ! grep -Fxq "fs.inotify.max_user_watches=524288" /etc/sysctl.conf; then
      echo "fs.inotify.max_user_watches=524288" >> /etc/sysctl.conf && sysctl -p >/dev/null
    fi
    su $current_user -lc "mkdir -p /home/$current_user/.npm-global/lib; npm config set prefix /home/$current_user/.npm-global"
_
fi