ipmi() {
	hostn=${1}; shift
	ipmitool -U ${IPMI_USER} -P ${IPMI_PASSWD} -H ${hostn}-ipmi.ofs.edu.sg ${@}
}
