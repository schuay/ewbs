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

for file in $(find . -name "connect.test[0-9]*.dl"); do
    op=$(dlv connect.dl $file w.dl psh.dl c.dl f.dl s.dl connect.tester.dl -N=60)
    if [ -z $1 ]; then
       echo "$op" | grep '{' | grep --color=auto '[A-Z]\+_[cp]([^)]*)'
    else
       echo "$op"
   fi
done
