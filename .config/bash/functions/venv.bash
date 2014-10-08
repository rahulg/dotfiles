venv() {
	ver=${1:-default}
	case ${ver} in
	2)
		vpython=python2
		virt=venv2
		;;
	3)
		vpython=python3
		virt=venv3
		;;
	py)
		vpython=pypy
		virt=venvpy
		;;
	default)
		virt=$(ls | grep -oE 'venv(2|3|py)' 2>/dev/null | head -n1)
		if [[ -z ${virt} ]]; then
			echo 'no venv found, and no version given'
			return 1
		fi
		;;
	esac
	if [[ ! -d ${virt} ]]; then
		virtualenv --python=${vpython} ${virt}
	fi
	source ${virt}/bin/activate
}
