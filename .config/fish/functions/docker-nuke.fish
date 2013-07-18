function docker-nuke
	docker ps -a -q | xargs docker rm
end
