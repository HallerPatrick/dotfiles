#!/bin/bash

echo

for y in $(seq 0 7); do
  printf %s '      '
  i=0
  for color in 1 2 12 10 9 11 13 14 8 7  ; do
    tput setab ${color}
    printf %s '     '

    tput sgr0

    if (($i % 2))
    then
        printf %s ' '
    fi
    i=$((i + 1))

  done

  tput sgr0
  echo
done

echo
