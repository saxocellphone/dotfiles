# ghcup-env
set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
set -U fish_user_path ~/.local/bin $fish_user_path
test -f /home/vnazzaro/.ghcup/env ; and set -gx PATH $HOME/.cabal/bin /home/vnazzaro/.ghcup/bin $PATH
