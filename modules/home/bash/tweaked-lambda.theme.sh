#! bash oh-my-bash.module

OSH_THEME_GIT_PROMPT_DIRTY="󱓌 "
OSH_THEME_GIT_PROMPT_CLEAN="󱓏 "

# Nicely formatted terminal prompt
function git_branch {
  local CHAR=$(scm_char)
  if [[ $CHAR != "$SCM_NONE_CHAR" ]]; then
    printf '%s' " $(parse_git_dirty)${_omb_prompt_bold_purple}$(git_current_branch)${_omb_prompt_normal}"
  fi
}

function nix_shell_prompt() {
    if [ -n "$IN_NIX_SHELL" ]; then
        if [ -n "$name" ]; then
            echo "${_omb_prompt_bold_blue}($name) "
        else
            echo "${_omb_prompt_bold_blue}(dev-shell) "
        fi
    fi
}

function _omb_theme_PROMPT_COMMAND {
  local ps_username="${_omb_prompt_purple}\u${_omb_prompt_normal}"
  local ps_host="${_omb_prompt_olive}\h${_omb_prompt_normal}"
  local ps_path="${_omb_prompt_bold_teal}\w${_omb_prompt_normal}"
  local ps_user_mark="${_omb_prompt_bold_red}󰘧${_omb_prompt_normal}"

  local python_venv
  _omb_prompt_get_python_venv

  PS1="$python_venv$(nix_shell_prompt)$ps_path$(git_branch) $ps_user_mark "
}

OMB_PROMPT_SHOW_PYTHON_VENV=${OMB_PROMPT_SHOW_PYTHON_VENV:-false}
OMB_PROMPT_VIRTUALENV_FORMAT="${_omb_prompt_olive}(%s)${_omb_prompt_reset_color} "

_omb_util_add_prompt_command _omb_theme_PROMPT_COMMAND
