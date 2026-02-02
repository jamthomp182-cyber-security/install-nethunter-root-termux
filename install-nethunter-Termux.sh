#!/data/data/com.termux/files/usr/bin/bash -e
# Rooted Kali NetHunter installer + Metasploit + SET auto-install

WIMG="${1:-minimal}"
PREFIX="/data/data/com.termux/files/usr"
NHDIR="/data/local/nh"

ABI=$(getprop ro.product.cpu.abi 2>/dev/null || echo arm64-v8a)
case "$ABI" in
  arm64*) SYS_ARCH="arm64" ;;
  armeabi*) SYS_ARCH="armhf" ;;
  *) SYS_ARCH="arm64" ;;
esac

BASE_URL="https://kali.download/nethunter-images/current/rootfs"
IMAGE="kali-nethunter-rootfs-${WIMG}-${SYS_ARCH}.tar.xz"
TARBALL="$HOME/$IMAGE"

echo "[*] Kali NetHunter rooted installer"
echo "[*] Image: $IMAGE"

# Root check
if ! su -c id >/dev/null 2>&1; then
  echo "[!] Root required (Magisk). Aborting."
  exit 1
fi

pkg update -y >/dev/null || true
pkg install -y wget tar xz-utils || exit 1

# Download
if [ ! -f "$TARBALL" ]; then
  echo "[*] Downloading rootfs..."
  wget -c "$BASE_URL/$IMAGE" -O "$TARBALL"
fi

# Backup existing
if su -c "[ -d '$NHDIR' ]"; then
  TS=$(date +%Y%m%d-%H%M%S)
  su -c "mv '$NHDIR' '${NHDIR}.bak.$TS'"
fi

# Extract
cd "$HOME"
unxz -k "$TARBALL"
TAR="${TARBALL%.xz}"

su -c "mkdir -p '$NHDIR'"
su -c "mv '$TAR' '$NHDIR/'"
su -c "cd '$NHDIR' && tar -xpf $(basename "$TAR")"
su -c "rm '$NHDIR/$(basename "$TAR")'"

# Write launcher
cat > "$PREFIX/bin/nh" <<'EOF'
#!/data/data/com.termux/files/usr/bin/bash
NHROOT=/data/local/nh/kali-arm64

exec su -mm -c '
set -e

mkdir -p '"$NHROOT"'/{proc,sys,dev/pts,tmp,run,sdcard,termux}

mountpoint -q '"$NHROOT"'/proc || mount -t proc proc '"$NHROOT"'/proc
mountpoint -q '"$NHROOT"'/sys  || mount -t sysfs sys '"$NHROOT"'/sys
mountpoint -q '"$NHROOT"'/dev  || mount --bind /dev '"$NHROOT"'/dev
mountpoint -q '"$NHROOT"'/dev/pts || mount -t devpts devpts '"$NHROOT"'/dev/pts
mountpoint -q '"$NHROOT"'/sdcard || mount --bind /sdcard '"$NHROOT"'/sdcard
mountpoint -q '"$NHROOT"'/termux || mount --bind /data/data/com.termux/files/usr '"$NHROOT"'/termux

mountpoint -q '"$NHROOT"'/tmp || mount -t tmpfs tmpfs '"$NHROOT"'/tmp
mountpoint -q '"$NHROOT"'/run || mount -t tmpfs tmpfs '"$NHROOT"'/run

cp /etc/resolv.conf '"$NHROOT"'/etc/resolv.conf 2>/dev/null || \
echo "nameserver 1.1.1.1" > '"$NHROOT"'/etc/resolv.conf

unset TMPDIR TMP TEMP

export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
export HOME=/root
export TERM=xterm-256color

if [ "$#" -eq 0 ]; then
    exec chroot '"$NHROOT"' /usr/bin/script -q -c /bin/bash /dev/null
else
    exec chroot '"$NHROOT"' /bin/bash -lc "$*"
fi
' -- "$@"
EOF

chmod +x "$PREFIX/bin/nh"
ln -sf "$PREFIX/bin/nh" "$PREFIX/bin/nethunter"

# === AUTO INSTALL METASPLOIT + SET ===
echo "[*] Entering Kali to install metasploit + SET (this may take a long time)..."
echo "[*] Please run apt update && apt upgrade && apt install set metasploit-framework"
nh 
echo
echo "[✔] Installation finished!"
echo "Test:"
echo "  nh whoami"
echo "  nh msfconsole"
echo "  nh setoolkit"
