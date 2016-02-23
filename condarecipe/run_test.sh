#!/bin/bash

export MICROPY_MICROPYTHON=$PREFIX/bin/micropython

function run_test() {
  cd $SRC_DIR/tests;
  ./run-tests;
}

run_test
