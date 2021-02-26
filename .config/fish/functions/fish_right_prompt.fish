function fish_right_prompt
	set -q CMD_DURATION; or set CMD_DURATION 0
	printf '[ %.2fs | %s ]' (math -s2 "$CMD_DURATION" '/' '1000') (env TZ=$SSH_CLIENT_TZ date '+%Y-%m-%d %H:%M:%S %z')
end

