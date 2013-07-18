function docker-nuke
	docker ps -a | cut -f 1 -d ' ' | grep -v ID | xargs docker rm
end
