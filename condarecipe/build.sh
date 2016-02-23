#!/bin/bash

export MICROPY_STANDALONE=1
export MICROPY_PY_UPIP=1

function build() {
  cd unix;
  make deplibs;
  make;
  mkdir $PREFIX/bin;
  cp micropython $PREFIX/bin;
}

build
