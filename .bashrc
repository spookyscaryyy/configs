#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

ros-start(){
docker run -it --env="DISPLAY" --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" -v /home/$(whoami)/ros:/ros --device /dev/video0 --device /dev/dri osrf/ros:kinetic-desktop-full bash -c "cp /ros/.bashrc /root/.bashrc && bash"
}
 
ros-connect(){
docker exec -ti $(docker ps -aq --filter ancestor=osrf/ros:kinetic-desktop-full --filter status=running) bash
}
 
ros-clean(){
docker rm $(docker ps -aq --filter ancestor=osrf/ros:kinetic-desktop-full --filter status=exited)
}

# Powerline-Shell
function _update_ps1() {
    PS1=$(powerline-shell $?)
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

alias cp='/usr/local/bin/cpg -g'
alias mv='/usr/local/bin/mvg -g'

[ -n "$NNNLVL" ] && PS1="N$NNNLVL $PS1"
