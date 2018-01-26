#!/bin/bash

deploy () {
  for file in $@
  do
    link=$HOME/$file
    dotfile_path=$(readlink -f $file)
    if [ ! -e $link ]
    then
      ln -sn $dotfile_path $link
      echo "linked. $dotfile_path -> $link"
    else
      # todo backup
      echo "skiped. $link"
    fi
  done
}

clean () {
  for file in $@
  do
    link=$HOME/$file
    if [ -L $link ]
    then
      unlink $link
      echo "unlink. $link"
    else
      echo "skiped. $link"
    fi
  done
}

while [ $# -gt 0 ]
do
  case $1 in
  --deploy )
    shift
    deploy $@
    exit 0
    ;;
  --clean )
    shift
    clean $@
    exit 0
    ;;
  * )
    echo "need option."
    ;;
  esac
  shift	
done
