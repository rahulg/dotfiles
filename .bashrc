# Ignore duplicates in bash history
export HISTCONTROL=ignoreboth

# Environment
export MAKEFLAGS="-j8"
export LANG="en_GB.UTF-8"
export EDITOR="vim"

SYSTEM=$(uname -s)
if [ ${SYSTEM} = "Darwin" ]; then

	export GOHOSTOS='darwin'
	export GOOS='darwin'

	# Path.Node.js 
	export PATH="$PATH:/usr/local/share/npm/bin"
	# Path.VMWare
	export PATH="$PATH:/Applications/VMware\ Fusion.app/Contents/Library"

else

	export GOHOSTOS='linux'
	export GOOS='linux'
	
	# Path.Node.js 
	export PATH="$PATH:/usr/share/npm/bin"

fi

export GOHOSTARCH='amd64'
export GOARCH='amd64'
export GOARM='7'

# Path.usr-local
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
# Path.Scripts
export PATH="$PATH:$HOME/tools"

# Virtualenv stuff
export VIRTUALENV_DISTRIBUTE=true
export PIP_REQUIRE_VIRTUALENV=true

# cd path
export CDPATH=".:~"

# Override PS1
export PS1='\h:\W \u\\$ '
