# https://www.postgresql.org/download/linux/redhat/
sudo -v
xRC=$?
[[ $xRC -ne 0 ]] && echo "This script need to run sudo" && exit 1

sudo dnf -qy module disable postgresql

sudo dnf list installed pgdg-redhat-repo
xRC=$?
if [[ $xRC -ne 0 ]]; then 
  sudo dnf install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-8-x86_64/pgdg-redhat-repo-latest.noarch.rpm
else
  sudo dnf update -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-8-x86_64/pgdg-redhat-repo-latest.noarch.rpm
fi

sudo dnf list installed postgresql15-server
xRC=$?
if [[ $xRC -ne 0 ]]; then
  sudo dnf install -y postgresql15-server
  sudo /usr/pgsql-15/bin/postgresql-15-setup initdb
  sudo systemctl enable postgresql-15
  sudo systemctl start postgresql-15
else
  sudo dnf update -y postgresql15-server
fi
