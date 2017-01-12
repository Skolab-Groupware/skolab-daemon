#/bin/bash

rm -f configure Makefile Makefile.in && ./bootstrap && ./configure && make dist
