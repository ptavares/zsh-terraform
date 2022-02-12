#!/bin/zsh
# Terraform plugin for zsh
#
# Author : Patrick Tavares <tavarespatrick01@gmail.com>
#

# From original terraform plugin
function tf_prompt_info() {
  # dont show 'default' workspace in home dir
  [[ "$PWD" != ~ ]] || return
  # check if in terraform dir and file exists
  [[ -d .terraform && -r .terraform/environment ]] || return

  local workspace="$(< .terraform/environment)"
  echo "${ZSH_THEME_TF_PROMPT_PREFIX-[}${workspace:gs/%/%%}${ZSH_THEME_TF_PROMPT_SUFFIX-]}"
}

#################################
# Define all lower levels aliases
#################################
alias tf='terraform'
alias tff='tf fmt'
alias tfv='tf validate'
alias tfi='tf init'
alias tfp='tf plan'
alias tfa='tf apply'
alias tfd='tf destroy'
alias tfo='tf output'
alias tfr='tf refresh'
alias tfs='tf show'
alias tfw='tf workspace'

#################################
# All others aliases
#################################
# Basics
alias tffr='tff -recursive'
alias tfip='tfi & tfp'
alias tfia='tfi & tfa'
alias tfid='tfi & tfd'
# Warning : with auto-approuve
alias tfa!='tfa -auto-approve'
alias tfia!='tfi && tfa!'
alias tfd!='tfd -auto-approve'
alias tfid!='tfi && tfd!'
# Utils
alias tfversion='tf version'

################################
# Custom function
################################
function tfws() {
    if (( $# != 1 ))
      then
        echo "> Usage:  $0 [workspace_name]"
    else
        count=$(find ./ -maxdepth 1 -type f -name '*.tf' | wc -l)
        [[ -d .terraform &&  $count -gt 0 ]] ||  echo "> Not in terraform directory"
        tfw select "$1" || tfw new "$1" ;
    fi
}
