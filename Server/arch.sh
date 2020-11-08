DISTRO_NAME="Termux Arch"

if [ "$(uname -m)" = "x86_64" ]; then
	DISTRO_TARBALL_STRIP_OPT=1
fi

get_download_url() {
	case "$(uname -m)" in
		aarch64)
			echo "https://eu.mirror.archlinuxarm.org/os/ArchLinuxARM-aarch64-latest.tar.gz"
			;;
		armv7l|armv8l)
			echo "https://eu.mirror.archlinuxarm.org/os/ArchLinuxARM-armv7-latest.tar.gz"
			;;
		x86_64)
			echo "https://mirrors.evowise.com/archlinux/iso/2020.11.01/archlinux-bootstrap-2020.11.01-x86_64.tar.gz"
			local file_name
			file_name=$(curl --fail --silent "https://mirror.rackspace.com/archlinux/iso/latest/md5sums.txt" | grep bootstrap | awk '{ print $2 }')
			if [ -n "$file_name" ]; then
				echo "https://mirror.rackspace.com/archlinux/iso/latest/${file_name}"
			fi
			;;
	esac
}

distro_setup() {
	
	if [ "$(uname -m)" = "x86_64" ]; then
		sed -i 's/#Server = http/Server = http/' ./etc/pacman.d/mirrorlist
	fi

	run_proot_cmd pacman-key --init
	if [ "$(uname -m)" = "x86_64" ]; then
		run_proot_cmd pacman-key --populate archlinux
	else
		run_proot_cmd pacman-key --populate archlinuxarm
	fi

	echo "en_US.UTF-8 UTF-8" > ./etc/locale.gen
	run_proot_cmd locale-gen
	sed -i 's/LANG=C.UTF-8/LANG=en_US.UTF-8/' ./etc/profile.d/termux-proot.sh

	case "$(uname -m)" in
		aarch64)
			run_proot_cmd pacman -Rnsc --noconfirm linux-aarch64 
			;;
		armv7l|armv8l)
			run_proot_cmd pacman -Rnsc --noconfirm linux-armv7
			;;

	esac
}
