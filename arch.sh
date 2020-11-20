#!/data/data/com.termux/files/usr/bin/bash
DISTRO_NAME=Arch
INSTALLED_ROOTFS_DIR=$PREFIX/share/$DISTRO_NAME/ubuntu-fs
mkdir $PREFIX/share/$DISTRO_NAME
cd $PREFIX/share/$DISTRO_NAME
folder=arch-fs
function install {
if [ -d "$folder" ]; then
	first=1
	echo "skipping downloading"
fi
tarball="arch-rootfs.tar.gz"
if [ "$first" != 1 ];then
	if [ ! -f $tarball ]; then
		echo " [+] Download Rootfs, this may take a while base on your internet speed. "
                case `dpkg --print-architecture` in
                aarch64)
                        archurl="https://eu.mirror.archlinuxarm.org/os/ArchLinuxARM-aarch64-latest.tar.gz" ;;
		armv7l)
			archurl="https://eu.mirror.archlinuxarm.org/os/ArchLinuxARM-armv7-latest.tar.gz" ;;
                armv8l)
                        archurl="https://eu.mirror.archlinuxarm.org/os/ArchLinuxARM-armv7-latest.tar.gz" ;;
                arm)
                        archurl="https://eu.mirror.archlinuxarm.org/os/ArchLinuxARM-armv7-latest.tar.gz" ;;
                x86_64)
                        archurl="https://mirrors.evowise.com/archlinux/iso/2020.11.01/archlinux-bootstrap-2020.11.01-x86_64.tar.gz" ;;
	
		*)
			echo " [+] unknown architecture"; exit 1 ;;
		esac
		wget -c --quiet --show-progress "${archurl}" -O $tarball
	fi
	cur=`pwd`
	mkdir -p "$folder"
	cd "$folder"
	echo " [+] Decompressing Rootfs, please be patient. "
	proot --link2symlink tar -xf ${cur}/${tarball}||:
        echo " [+] Adding the new configuration and rebooting the system."
}

        install
        run_proot_cmd() {
	   if [ -z "${distro_name-}" ]; then
		echo
		echo -e "${BRED}Error: called run_proot_cmd() but \${distro_name} is not set. Possible cause: using run_proot_cmd() outside of distro_setup()?${RST}"
		echo
		return 1
	    fi

	proot \
		--kernel-release=5.4.0-fake-kernel \
		--link2symlink \
		--kill-on-exit \
		--rootfs="${INSTALLED_ROOTFS_DIR}" \
		--root-id \
		--cwd=/root \
		--bind=/dev \
		--bind="/dev/urandom:/dev/random" \
		--bind=/proc \
		--bind="/proc/self/fd:/dev/fd" \
		--bind="/proc/self/fd/0:/dev/stdin" \
		--bind="/proc/self/fd/1:/dev/stdout" \
		--bind="/proc/self/fd/2:/dev/stderr" \
		--bind=/sys \
		--bind="${INSTALLED_ROOTFS_DIR}/proc/.stat:/proc/stat" \
		--bind="${INSTALLED_ROOTFS_DIR}/proc/.version:/proc/version" \
		/usr/bin/env -i \
			"HOME=/root" \
			"LANG=C.UTF-8" \
			"PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin" \
			"TERM=$TERM" \
			"TMPDIR=/tmp" \
			"$@"
}
        function restart {
        local profile_script
		if [ -d "${INSTALLED_ROOTFS_DIR}/etc/profile.d" ]; then
			profile_script="${INSTALLED_ROOTFS_DIR}/etc/profile.d/termux-proot.sh"
		else
			profile_script="${INSTALLED_ROOTFS_DIR}/etc/profile"
		fi
		echo " [+] Writing '$profile_script' "
		local LIBGCC_S_PATH
		LIBGCC_S_PATH="/$(cd ${INSTALLED_ROOTFS_DIR}; find usr/lib/ -name libgcc_s.so.1)"
        cat <<- EOF >> "$profile_script"
		export ANDROID_ART_ROOT=${ANDROID_ART_ROOT-}
		export ANDROID_DATA=${ANDROID_DATA-}
		export ANDROID_I18N_ROOT=${ANDROID_I18N_ROOT-}
		export ANDROID_ROOT=${ANDROID_ROOT-}
		export ANDROID_RUNTIME_ROOT=${ANDROID_RUNTIME_ROOT-}
		export ANDROID_TZDATA_ROOT=${ANDROID_TZDATA_ROOT-}
		export BOOTCLASSPATH=${BOOTCLASSPATH-}
		export COLORTERM=${COLORTERM-}
		export DEX2OATBOOTCLASSPATH=${DEX2OATBOOTCLASSPATH-}
		export EXTERNAL_STORAGE=${EXTERNAL_STORAGE-}
		export LANG=C.UTF-8
		export PATH=\${PATH}:/data/data/com.termux/files/usr/bin:/system/bin:/system/xbin
		export PREFIX=${PREFIX-/data/data/com.termux/files/usr}
		export TERM=${TERM-xterm-256color}
		export TMPDIR=/tmp
		EOF
		if [ "${LIBGCC_S_PATH}" != "/" ]; then
			echo "export LD_PRELOAD=${LIBGCC_S_PATH}" >> "$profile_script"
		fi
		unset LIBGCC_S_PATH

                echo " [+] Creating a source for fake /proc/stat file for SELinux restrictions workaround "
                chmod 700 "${INSTALLED_ROOTFS_DIR}/proc" >/dev/null 2>&1
		cat <<- EOF > "${INSTALLED_ROOTFS_DIR}/proc/.stat"
		cpu  1050008 127632 898432 43828767 37203 63 99244 0 0 0
		cpu0 212383 20476 204704 8389202 7253 42 12597 0 0 0
		cpu1 224452 24947 215570 8372502 8135 4 42768 0 0 0
		cpu2 222993 17440 200925 8424262 8069 9 17732 0 0 0
		cpu3 186835 8775 195974 8486330 5746 3 8360 0 0 0
		cpu4 107075 32886 48854 8688521 3995 4 5758 0 0 0
		cpu5 90733 20914 27798 1429573 2984 1 11419 0 0 0
		intr 53261351 0 686 1 0 0 1 12 31 1 20 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7818 0 0 0 0 0 0 0 0 255 33 1912 33 0 0 0 0 0 0 3449534 2315885 2150546 2399277 696281 339300 22642 19371 0 0 0 0 0 0 0 0 0 0 0 2199 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2445 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 162240 14293 2858 0 151709 151592 0 0 0 284534 0 0 0 0 0 0 0 0 0 0 0 0 0 0 185353 0 0 938962 0 0 0 0 736100 0 0 1 1209 27960 0 0 0 0 0 0 0 0 303 115968 452839 2 0 0 0 0 0 0 0 0 0 0 0 0 0 160361 8835 86413 1292 0 0 0 0 0 0 0 0 0 0 0 0 0 0 3592 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6091 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 35667 0 0 156823 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 138 2667417 0 41 4008 952 16633 533480 0 0 0 0 0 0 262506 0 0 0 0 0 0 126 0 0 1558488 0 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2 2 8 0 0 6 0 0 0 10 3 4 0 0 0 0 0 3 0 0 0 0 0 0 0 0 0 0 0 20 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 12 1 1 83806 0 1 1 0 1 0 1 1 319686 2 8 0 0 0 0 0 0 0 0 0 244534 0 1 10 9 0 10 112 107 40 221 0 0 0 144
		ctxt 90182396
		btime 1595203295
		processes 270853
		procs_running 2
		procs_blocked 0
		softirq 25293348 2883 7658936 40779 539155 497187 2864 1908702 7229194 279723 7133925
		EOF
		
		echo " [+] Creating a source for fake /proc/version file for SELinux restrictions workaround "
                cat <<- EOF > "${INSTALLED_ROOTFS_DIR}/proc/.version"
		Linux version 5.4.0-fake-kernel (termux@fakehost) (gcc version 4.9.x 20150123 (prerelease) (GCC) ) #1 SMP PREEMPT Fri Jul 10 00:00:00 UTC 2020
		EOF
		
		echo " [+] Writing resolv.conf file (NS 1.1.1.1/1.0.0.1) "
                rm -f "${INSTALLED_ROOTFS_DIR}/etc/resolv.conf"
		cat <<- EOF > "${INSTALLED_ROOTFS_DIR}/etc/resolv.conf"
		nameserver 1.1.1.1
		nameserver 1.0.0.1
		EOF
		
		echo " [+] Writing hosts file "
                cat <<- EOF > "${INSTALLED_ROOTFS_DIR}/etc/hosts"
		# IPv4.
		127.0.0.1   localhost.localdomain localhost
		# IPv6.
		::1         localhost.localdomain localhost ipv6-localhost ipv6-loopback
		fe00::0     ipv6-localnet
		ff00::0     ipv6-mcastprefix
		ff02::1     ipv6-allnodes
		ff02::2     ipv6-allrouters
		ff02::3     ipv6-allhosts
		EOF
		
		echo " [+] Registering Android-specific UIDs and GIDs "
                echo "aid_$(id -un):x:$(id -u):$(id -g):Android user:/:/usr/sbin/nologin" >> "${INSTALLED_ROOTFS_DIR}/etc/passwd"
		echo "aid_$(id -un):*:18446:0:99999:7:::" >> "${INSTALLED_ROOTFS_DIR}/etc/shadow"
		local g
		for g in $(id -G); do
			echo "aid_$(id -gn "$g"):x:${g}:root,aid_$(id -un)" >> "${INSTALLED_ROOTFS_DIR}/etc/group"
			if [ -f "${INSTALLED_ROOTFS_DIR}/etc/gshadow" ]; then
				echo "aid_$(id -gn "$g"):*::root,aid_$(id -un)" >> "${INSTALLED_ROOTFS_DIR}/etc/gshadow"
			fi
		done

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
        restart
	cd "$cur"
fi
mkdir -p arch-binds
bin=start-arch.sh
echo " [+] writing launch script"
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

echo " [+] fixing shebang of $bin "
termux-fix-shebang $bin
echo " [+] making $bin executable "
chmod +x $bin
echo " [+] removing image for some space "
rm $tarball
echo " [+] You can now launch Ubuntu with the ./${bin} script "
cd $HOME
