#!/bin/sh

CC=cc
CC_FLAGS="-O2 -Wall -Wextra -Wpedantic -std=c11 -D_DEFAULT_SOURCE"
$CC -m64 ${CC_FLAGS} -o fsnotifier64 main.c inotify.c util.c
