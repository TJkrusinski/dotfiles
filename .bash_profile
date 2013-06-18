#!/bin/bash

# bash_profile

declare -a files=(
    $HOME/.bash/config # Configuration
    $HOME/.bash/aliases # Aliases
    $HOME/.bash/private_aliases # Aliases
    $HOME/.bash/functions/* # Functions
    $HOME/.bash/prompt # Custom bash prompt
    $HOME/.bash/paths # Path modifications (must source after `.bash_profile.local` in case of custom `brew` location)
	$HOME/.nvm/nvm.sh
	$HOME/.nvm/bash_completion
)

# If these files are readable, source them
for index in ${!files[*]}
do
    if [[ -r ${files[$index]} ]]; then
        source ${files[$index]}
    fi
done

unset files

# Only use `brew` after it has been added to the PATH
bash_completion_path="$(brew --prefix)/etc/bash_completion"

# Source Bash completion (installed via Homebrew)
if [[ -r $bash_completion_path ]]; then
    source $bash_completion_path
fi

# MacPorts Installer addition on 2013-03-02_at_17:52:01: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
