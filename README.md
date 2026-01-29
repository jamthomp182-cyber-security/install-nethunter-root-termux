# Rooted Kali NetHunter + Metasploit Installer for Termux

This project provides a single automated script that installs and configures a fully working rooted Kali NetHunter environment inside Termux on Android.

It sets up:

- Kali NetHunter rootfs (rooted chroot)
- nh and nethunter launcher commands
- Proper mounts for /proc, /sys, /dev, /sdcard
- Termux bind mounted at /termux
- DNS fix
- Working /tmp and /run
- Command mode support: nh whoami
- Interactive shells: nh
- Metasploit Framework
- Social Engineering Toolkit (set)

Requirements

- Rooted Android device (Magisk recommended)
- Termux installed
- At least 6–8 GB free storage
- Stable internet connection
- ARM64 CPU

What the script does

The installer script:

1. Downloads the Kali NetHunter rootfs
2. Extracts it to:

/data/local/nh/kali-arm64

3. Installs the nh launcher into:

/data/data/com.termux/files/usr/bin/nh

4. Creates mount points and binds:

- proc
- sys
- dev and dev/pts
- sdcard
- Termux binaries at /termux
- tmpfs for /tmp and /run

5. Sets DNS inside Kali
6. Enters Kali automatically
7. Runs:

apt update
apt install -y metasploit-framework set

Installation

Step 1: Update Termux

pkg update && pkg upgrade
pkg install wget tar xz-utils git -y

Step 2: Create installer

nano setup-nh.sh

Paste the setup script.

Step 3: Run installer

chmod +x setup-nh.sh
./setup-nh.sh

The first run may take 10–30 minutes depending on storage speed and network.

Testing

After installation:

nh whoami
nh uname -a
nh nmap --version
nh msfconsole
nh setoolkit

Expected output:

root

Usage

Enter Kali:

nh

Run a single command:

nh id
nh apt update

Exit:

exit

Unmount after reboot (optional)

Normally reboot clears mounts.

Manual cleanup:

su
umount /data/local/nh/kali-arm64/proc
umount /data/local/nh/kali-arm64/sys
umount /data/local/nh/kali-arm64/dev/pts
umount /data/local/nh/kali-arm64/tmp
umount /data/local/nh/kali-arm64/run
umount /data/local/nh/kali-arm64/sdcard
umount /data/local/nh/kali-arm64/termux

Troubleshooting

APT DNS error:

Temporary failure resolving http.kali.org

Fix:

nh bash -lc "echo nameserver 8.8.8.8 > /etc/resolv.conf"

APT lock:

nh rm -f /var/lib/apt/lists/lock
nh dpkg --configure -a

Low storage:

df -h

Legal notice

This setup is for educational and authorized penetration testing only.

Do not scan networks or systems you do not own or have explicit permission to test.

Future ideas

- nh-stop unmount helper
- GUI KeX support
- Rootless mode
- Auto updater
- Monitor mode helpers
