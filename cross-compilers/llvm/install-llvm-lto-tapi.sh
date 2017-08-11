#!/bin/bash

. activate "${PREFIX}"
cd "${SRC_DIR}"

DEST="${PWD}"/install-llvm-lto-tapi
pushd llvm_build_final/tools/lto
  make install DESTDIR="${DEST}"
popd
pushd llvm_build_final/projects/tapi
  make install DESTDIR="${DEST}"
popd
pushd "${DEST}"/"${PWD}"/prefix
  cp -Rf * "${PREFIX}"
popd
