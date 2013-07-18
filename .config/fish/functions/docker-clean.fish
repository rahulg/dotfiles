function docker-clean
	docker ps -q -a | sort > /tmp/dc-all
	docker ps -q | sort > /tmp/dc-run
	comm -2 -3 /tmp/dc-all /tmp/dc-run | xargs docker rm
end
