#!/usr/bin/env bash

sudo DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential \
  make gdb clang clang-tidy ninja-build

