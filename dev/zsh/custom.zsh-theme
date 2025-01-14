# Define ANSI color codes
blue="%F{blue}"
cyan="%F{cyan}"
green="%F{green}"
magenta="%F{magenta}"
yellow="%F{yellow}"
white="%F{white}"
red="%F{red}"
black="%F{black}"
reset="%b%f"

# Function to get the relative path
function get_rel_path() {
  absolute_path="${PWD}"
  home_dir="$HOME"
  if [[ "$absolute_path" == "$home_dir"* ]]; then
    echo "$absolute_path" | sed "s|^$home_dir|~|"
  else
    echo "$absolute_path"
  fi
}

# Function to integrate venv indicator when activating python virtual environment.
# Recommend disabling the global one with 'export VIRTUAL_ENV_DISABLE_PROMPT=1'
function venv_name() {
  if [[ -n $VIRTUAL_ENV ]]; then
    echo -n "${yellow} $(basename "${VIRTUAL_ENV}")${magenta} ━ "
  else
    echo -n ""
  fi
}

# Check if there are any uncommitted changes
git_is_dirty() {
  local root=$(git rev-parse --show-toplevel 2> /dev/null)
  if [[ -n $root ]]; then
    if [[ -n "$(git status --porcelain)" ]]; then
      echo "${red}🞊"
    else
      echo "${cyan}🞊"
    fi
  else
    echo -n ""
  fi
}

# PS1
PS1='$(venv=$(venv_name); dirty=$(git_is_dirty); branch=$(git_current_branch); path=$(get_rel_path); \
if [ -n "${branch}" ]; then echo "${magenta}┌─╸${green}󱩊 %n${magenta} ━ ${blue} %m${magenta} ━ ${venv}${white} ${branch}*${dirty}${magenta} ━ ${black}󰝰 %~${magenta} "; \
else echo "${magenta}┌─╸${green}󱩊 %n${magenta} ━ ${blue} %m${magenta} ━ ${venv}${black}󰝰 %~${magenta} "; fi)
└──╸${reset}%B$%b${reset} '
# PS2
PS2=' %B~%b '
