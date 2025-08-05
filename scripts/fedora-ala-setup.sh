if [[ -z "${PASS}" ]]; then
  echo "\$PASS is not set"
  exit 1
fi

sudo modprobe ath9k
sudo ip link set wlp2s0 up
sudo iw reg set PL
sudo systemctl restart NetworkManager

# Add PL region to wifi after each reboot
echo "/usr/sbin/iw reg set PL" | sudo tee /etc/NetworkManager/dispatcher.d/99-wifi-regdom
sudo chmod +x /etc/NetworkManager/dispatcher.d/99-wifi-regdom
nmcli device wifi connect "SYRION20804" password "$PASS"
