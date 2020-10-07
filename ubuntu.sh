DISTRO_NAME="Ubuntu"

get_download_url() {
	case "$(uname -m)" in
		aarch64)
			echo "https://partner-images.canonical.com/core/focal/current/ubuntu-focal-core-cloudimg-arm64-root.tar.gz"
			;;
		armv7l|armv8l)
			echo "https://partner-images.canonical.com/core/focal/current/ubuntu-focal-core-cloudimg-armhf-root.tar.gz"
			;;
		i686)
			# Ubuntu Focal no proporciona archivos tar para x86 de 32 bits.
			;;
		x86_64)
			echo "https://partner-images.canonical.com/core/focal/current/ubuntu-focal-core-cloudimg-amd64-root.tar.gz"
			;;
	esac
}

distro_setup() {

	run_proot_cmd apt update
	run_proot_cmd apt upgrade -yq

	:
}
