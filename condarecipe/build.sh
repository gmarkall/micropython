#!/bin/bash

export MICROPY_STANDALONE=1
export MICROPY_PY_UPIP=1

function build() {
  # Build/install Micropython
  cd unix;
  make deplibs;
  make;
  mkdir $PREFIX/bin;
  cp micropython $PREFIX/bin;

  # Create scripts to set micropython path on environment activation
  ACTIVATEDIR=$PREFIX/etc/conda/activate.d
  DEACTIVATEDIR=$PREFIX/etc/conda/deactivate.d
  mkdir -p $ACTIVATEDIR;
  mkdir -p $DEACTIVATEDIR;
  echo -e "#\x21/bin/bash\nLOC=$PREFIX\nexport MICROPYPATH=\$LOC/lib" > $ACTIVATEDIR/env_vars.sh;
  echo -e "#\x21/bin/bash\nunset MICROPYPATH" > $DEACTIVATEDIR/env_vars.sh;
}

build
