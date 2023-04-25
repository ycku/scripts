# https://www.postgresql.org/download/linux/redhat/
sudo -v
xRC=$?
[[ $xRC -ne 0 ]] && echo "### This script need to run sudo. - $(date +"%Y-%m-%d %H:%M")" && exit 1

echo "### Disable default postgresql package - $(date +"%Y-%m-%d %H:%M")"
sudo dnf -qy module disable postgresql

echo "### Install/Update postgresql repository - $(date +"%Y-%m-%d %H:%M")"
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
  echo "### Install PostgreSQL 15 - $(date +"%Y-%m-%d %H:%M")"
  sudo dnf install -y postgresql15-server
  xRC=$?
  [[ $xRC -ne 0 ]] && echo "### ERROR on installing postgresql15-server - $(date +"%Y-%m-%d %H:%M")" && exit 1
  sudo /usr/pgsql-15/bin/postgresql-15-setup initdb
  xRC=$?
  [[ $xRC -ne 0 ]] && echo "### ERROR on initializing PostgreSQL 15 - $(date +"%Y-%m-%d %H:%M")" && exit 1
  echo "### Enable PostgreSQL server to start at boot - $(date +"%Y-%m-%d %H:%M")"
  sudo systemctl enable postgresql-15
  echo "### Start PostgreSQL server now - $(date +"%Y-%m-%d %H:%M")"
  sudo systemctl start postgresql-15
else
  echo "### Try to update PostgreSQL 15 - $(date +"%Y-%m-%d %H:%M")"
  sudo dnf update -y postgresql15-server
fi

sudo dnf update -y postgresql15 postgresql15-contrib postgresql15-llvmjit postgresql15-plpython3
echo "### Finished - $(date +"%Y-%m-%d %H:%M")"
