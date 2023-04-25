xSERVICE=$(systemctl list-units --type=service | grep postgresql | awk '{print $1}')
xRC=$?
if [[ $xRC -eq 0 ]]; then
  sudo systemctl status $xSERVICE 
fi
xPGDATA=$(pgrep -u postgres -fa -- -D | awk '{print $4}')
xRC=$?
if [[ $xRC -eq 0 ]]; then
  echo "PGDATA: ${xPGDATA}"
fi
