function docker-clean
	docker ps -q -a | sort > /tmp/dcp-all
	docker ps -q | sort > /tmp/dcp-run
	comm -2 -3 /tmp/dcp-all /tmp/dcp-run > /tmp/dcp-dead
	set dcp_len (cat /tmp/dcp-dead | wc -l)
	if [ $dcp_len -gt 0 ];
		cat /tmp/dcp-dead | xargs -L 1 docker rm
	end
	docker images -q -a | sort > /tmp/dci-all
	docker images -q | sort > /tmp/dci-run
	comm -2 -3 /tmp/dci-all /tmp/dci-run > /tmp/dci-dead
	set dci_len (cat /tmp/dci-dead | wc -l)
	if [ $dci_len -gt 0 ];
		cat /tmp/dci-dead | xargs -L 1 docker rmi
	end
	rm -f /tmp/dc{p,i}-{all,run,dead}
end
