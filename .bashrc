# Ignore duplicates in bash history
export HISTCONTROL=ignoreboth

# Environment
export MAKEFLAGS="-j4"
export LANG="en_GB.UTF-8"
export EDITOR="vim"

SYSTEM=$(uname -s)
if [ ${SYSTEM} = "Darwin" ]; then

	export GOROOT="$(brew --prefix go)"
	export GOHOSTOS='darwin'
	export GOOS='darwin'

	# Path.Homebrew
	export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
	# Path.Scripts
	export PATH="$PATH:$HOME/tools"
	# Path.Node.js 
	export PATH="$PATH:/usr/local/share/npm/bin"
	# Path.compass gem hack
	export PATH="$PATH:$(brew --prefix ruby)/bin"
	# Path.Android
	export PATH="$PATH:/Applications/Android\ Studio.app/sdk/platform-tools:/Applications/Android\ Studio.app/sdk/tools"
	# Path.VMWare
	export PATH="$PATH:/Applications/VMware\ Fusion.app/Contents/Library"

	source "$(brew --prefix)/Library/Contributions/brew_bash_completion.sh"

else

	export GOROOT="/usr/lib/go/"
	export GOHOSTOS='linux'
	export GOOS='linux'
	
	# Path.Scripts
	export PATH="$PATH:$HOME/tools"
	# Path.Node.js 
	export PATH="$PATH:/usr/share/npm/bin"

fi

export GOHOSTARCH='amd64'
export GOARCH='amd64'
export GOARM='7'

# Virtualenv stuff
export VIRTUALENV_DISTRIBUTE=true
export PIP_REQUIRE_VIRTUALENV=true

# cd path
export CDPATH=".:~:~/Projects:~/Work"
