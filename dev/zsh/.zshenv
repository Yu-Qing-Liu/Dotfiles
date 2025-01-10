# Environment variables
. "/etc/profiles/per-user/admin/etc/profile.d/hm-session-vars.sh"

# Only source this once
if [[ -z "$__HM_ZSH_SESS_VARS_SOURCED" ]]; then
  export __HM_ZSH_SESS_VARS_SOURCED=1
  
fi

export ZDOTDIR=$HOME/.config/zsh

ZSH="/nix/store/xmsdld5rdvjqwhpcyii0j3732njgagmb-oh-my-zsh-2024-10-01/share/oh-my-zsh";
ZSH_CACHE_DIR="/home/admin/.cache/oh-my-zsh";
