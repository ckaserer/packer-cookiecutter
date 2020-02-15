#!/bin/bash

readonly DOCKER_COOKIECUTTER_HOME=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# cookiecutter
function cookiecutter () {
  local command="docker run --rm -it -v $(pwd):/cookiecutter ckaserer/cookiecutter"
  echo "+ ${command} $@" && ${command} $@
}
readonly -f cookiecutter
[ "$?" -eq "0" ] || return $?
