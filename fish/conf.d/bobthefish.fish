set -g theme_nerd_fonts yes
set -g theme_color_scheme gruvbox
set -g theme_dispay_user ssh
set -g default_user gabrielcoelho
set -g theme_display_vi yes
set -g theme_display_git_default_branch yes
set -g theme_use_abbreviated_branch_name yes
set -g theme_powerline_fonts yes

function fish_greeting
  echo "nosce te ipsum --> "
echo "             .======."
echo "             | INRI |"
echo "             |      |"
echo "             |      |"
echo "    .========'      '========."
echo "    |   _      xxxx      _   |"
echo "    |  /_;-.__ / _\  _.-;_\  |"
echo "    |     `-._`'`_/'`.-'     |"
echo "    '========.`\   /`========'"
echo "             | |  / |"
echo "             |/-.(  |"
echo "             |\_._\ |"
echo "             | \ \`;|"
echo "             |  > |/|"
echo "             | / // |"
echo "             | |//  |"
echo "             | \(\  |"
echo "             |  ``  |"
echo "             |      |"
echo "             |      |"
echo "             |      |"
echo "             |      |"
echo " \\jgs _  _\\| \//  |//_   _ \// _"
echo "^ `^`^ ^`` `^ ^` ``^^`  `^^` `^ `^"
echo "        Mas levamos este tesouro em vasos de barro"
  set_color normal
end
