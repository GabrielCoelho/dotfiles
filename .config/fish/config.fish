if status is-interactive
    # Commands to run in interactive sessions can go here
end
# better ls with exa
if type -q exa
	alias ll "exa -l -g --icons"
	alias lla "ll -a"
end

# alias for neovim
alias nvim "/bin/nvim.appimage"
alias neovim "/bin/nvim.appimage"

function fish_greeting
echo "                            _         _"
echo " _ __   ___  ___  ___ ___  | |_ ___  (_)_ __  ___ _   _ _ __ ___"
echo "| '_ \ / _ \/ __|/ __/ _ \ | __/ _ \ | | '_ \/ __| | | | '_ ` _ \\"
echo "| | | | (_) \__ \ (_|  __/ | ||  __/ | | |_) \__ \ |_| | | | | | |"
echo "|_| |_|\___/|___/\___\___|  \__\___| |_| .__/|___/\__,_|_| |_| |_|"
echo "                                       |_|"
end

function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end
