set -x
source .env
rmmod pcspkr
rfkill unblock wifi
systemctl restart iwd.service
# If you have my livecd, I probably trust you enough to give you my wifi-password
iwctl station wlan0 scan
iwctl station wlan0 get-networks
if [[ -z "${WIFI_NAME}" ]]; then
    if [[ -z "${WIFI_PASSWORD}" ]]; then
        iwctl station wlan0 connect ${WIFI_NAME} -P ${WIFI_PASSWORD}
    else
        iwctl station wlan0 connect ${WIFI_NAME}
    fi
fi
mount --mkdir /dev/nvme0n1p23 /mnt/main
mount --mkdir /dev/nvme0n1p5 /mnt/main/boot
set +x
