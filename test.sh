#!/bin/bash

for comp in w psh c f s; do
    for file in $(find . -name "$comp.test[0-9].dl"); do
        dlv $comp.dl $file component.tester.dl -N=60 | grep '{'
    done
done
