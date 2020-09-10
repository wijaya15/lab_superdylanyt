#!/data/data/com.termux/files/usr/bin/bash
DISTRO_NAME=Arch
mkdir $PREFIX/share/$DISTRO_NAME
cd $PREFIX/share/$DISTRO_NAME
folder=arch-fs
if [ -d "$folder" ]; then
	first=1
	echo "skipping downloading"
fi
tarball="arch-rootfs.tar.gz"
if [ "$first" != 1 ];then
	if [ ! -f $tarball ]; then
		echo "Download Rootfs, this may take a while base on your internet speed."
                case `dpkg --print-architecture` in
		aarch64)
			archurl="arm64" ;;
		armv7l)
			archurl="armhf" ;;
                armv8l)
                        archurl="armhf" ;;
                arm)
                        archurl="armhf" ;;

		*)
			echo "unknown architecture"; exit 1 ;;
		esac
		wget "https://eu.mirror.archlinuxarm.org/os/ArchLinuxARM-${archurl}-latest.tar.gz" -O $tarball
        fi
	cur=`pwd`
	mkdir -p "$folder"
	cd "$folder"
	echo "Decompressing Rootfs, please be patient."
	proot --link2symlink tar -xf ${cur}/${tarball}||:
        echo "fixing nameserver, otherwise it can't connect to the internet"
	echo "nameserver 1.1.1.1" > etc/resolv.conf
        echo "fixing hosts, otherwise you can't use sudo"
        echo "127.0.0.1 localhost" > etc/hosts
        local file_name
	file_name=$(curl --fail --silent "https://mirror.rackspace.com/archlinux/iso/latest/md5sums.txt" | grep bootstrap | awk '{ print $2 }')
	if [ -n "$file_name" ]; then
	echo "http://mirror.rackspace.com/archlinux/iso/latest/${file_name}"
	fi
	;;
        if [ "$(uname -m)" = "x86_64" ]; then
		sed -i 's/#Server = http/Server = http/' ./etc/pacman.d/mirrorlist
	fi
        run_proot_cmd pacman-key --init
	if [ "$(uname -m)" = "x86_64" ]; then
		run_proot_cmd pacman-key --populate archlinux
	else
		run_proot_cmd pacman-key --populate archlinuxarm
	fi
        case "$(uname -m)" in
		aarch64)
			run_proot_cmd pacman -Rnsc --noconfirm dbus linux-aarch64 systemd
			;;
		armv7l)
                        run_proot_cmd pacman -Rnsc --noconfirm dbus linux-armv7 systemd
			;;
                armv8l)
			run_proot_cmd pacman -Rnsc --noconfirm dbus linux-armv7 systemd
			;;
                arm)
                        run_proot_cmd pacman -Rnsc --noconfirm dbus linux-armv7 systemd
			;;
		x86_64)
			run_proot_cmd pacman -Rnsc --noconfirm dbus systemd
			;;
	esac
	cd "$cur"
fi
mkdir -p arch-binds
bin=start-arch.sh
echo "writing launch script"
cat > $bin <<- EOM
#!/bin/bash
cd \$(dirname \$0)
## unset LD_PRELOAD in case termux-exec is installed
unset LD_PRELOAD
command="proot"
command+=" --link2symlink"
command+=" -0"
command+=" -r $folder"
if [ -n "\$(ls -A arch-binds)" ]; then
    for f in arch-binds/* ;do
      . \$f
    done
fi
command+=" -b /dev"
command+=" -b /proc"
command+=" -b arch-fs/root:/dev/shm"
## uncomment the following line to have access to the home directory of termux
#command+=" -b /data/data/com.termux/files/home:/root"
## uncomment the following line to mount /sdcard directly to / 
#command+=" -b /sdcard"
command+=" -w /root"
command+=" /usr/bin/env -i"
command+=" HOME=/root"
command+=" PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/games:/usr/local/games"
command+=" TERM=\$TERM"
command+=" LANG=C.UTF-8"
command+=" /bin/bash --login"
com="\$@"
if [ -z "\$1" ];then
    exec \$command
else
    \$command -c "\$com"
fi
EOM

echo "fixing shebang of $bin"
termux-fix-shebang $bin
echo "making $bin executable"
chmod +x $bin
echo "removing image for some space"
rm $tarball
echo "You can now launch Ubuntu with the ${bin} script"
cd $HOME
