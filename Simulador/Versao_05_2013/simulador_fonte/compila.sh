#!/bin/bash

#g++ Model.cpp -c
#g++ View.cpp -c `pkg-config --libs --cflags gtk+-3.0`
#g++ Controller.cpp -c `pkg-config --libs --cflags gtk+-3.0`
g++ -O2 main.cpp View.cpp Controller.cpp Model.cpp -o sim `pkg-config --libs --cflags gtk+-2.0` -lcurses -pthread -Wall -lgthread-2.0
