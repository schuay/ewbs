#!/bin/bash

for comp in w psh c f s; do
    for file in $(find . -name "$comp.test[0-9]*.dl"); do
        op=$(dlv $comp.dl $file component.tester.dl -N=60)
        if [ -z $1 ]; then
           echo "$op" | grep '{' | grep --color=auto '[A-Z]\+_[cp]([^)]*)'
        else
           echo "$op"
       fi
    done
done
