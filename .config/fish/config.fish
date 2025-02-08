if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_greeting
echo "                            _         _"
echo " _ __   ___  ___  ___ ___  | |_ ___  (_)_ __  ___ _   _ _ __ ___"
echo "| '_ \ / _ \/ __|/ __/ _ \ | __/ _ \ | | '_ \/ __| | | | '_ ` _ \\"
echo "| | | | (_) \__ \ (_|  __/ | ||  __/ | | |_) \__ \ |_| | | | | | |"
echo "|_| |_|\___/|___/\___\___|  \__\___| |_| .__/|___/\__,_|_| |_| |_|"
echo "                                       |_|"
end

# Some configs and Quality of Life

# PATH configs 
set PATH $HOME/.cargo/bin $PATH

# Be sure to install exa 
if type -q exa
	alias ll "exa -l -g -T -x --colour -m --git --icons"
	alias lla "ll -a"
end

# alias for neovim if needed
#alias nvim "/bin/nvim.appimage"
#alias neovim "/bin/nvim.appimage"

# Yazi-rs
function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

# Aliases 
alias ga "git add"
alias gc "git commit"
alias gp "git push"
alias gf "git fetch"
alias gfp "git pull"
