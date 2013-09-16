function fish_prompt -d 'Write out the prompt'

	# Just calculate these once, to save a few cycles when displaying the prompt
	if not set -q __fish_prompt_hostname
		set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
	end

	if not set -q __fish_prompt_normal
		set -g __fish_prompt_normal (set_color normal)
	end

	# different path colors for root prompts
	switch $USER
	case root
		if not set -q __fish_prompt_cwd
			if set -q fish_color_cwd_root
				set -g __fish_prompt_cwd (set_color $fish_color_cwd_root)
			else
				set -g __fish_prompt_cwd (set_color $fish_color_cwd)
			end
		end

	case '*'
		if not set -q __fish_prompt_cwd
			set -g __fish_prompt_cwd (set_color $fish_color_cwd)
		end
	end

	# basic prompt
	printf '%s%s%s@%s %s%s%s' "$__fish_prompt_cwd" $USER "$__fish_prompt_normal" $__fish_prompt_hostname (prompt_pwd) "$__fish_prompt_normal" (__fish_git_prompt)
	
	# end the prompt
	switch $USER
	case root
		printf '# '

	case '*'
		printf '> '
	end

end
