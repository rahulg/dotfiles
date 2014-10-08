function ipmi -d 'OFS IPMI alias'
	ipmitool -U $IPMI_USER -P $IPMI_PASSWD -H {$argv[1]}-ipmi.ofs.edu.sg $argv[2..-1]
end
