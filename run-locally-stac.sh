#!/usr/bin/env bash

ORIG_DIR="$(pwd)"
cd "$(dirname "$0")"
BIN_DIR="$(pwd)"

source functions.sh

onExit() {
  deactivateVenv
  cd "${ORIG_DIR}"
}
trap onExit EXIT

main() {
  activateVenv
  cwltool --outdir out convert-stac-app.cwl#convert --fn resize --stac ./stac --size "50%"
}

main "$@"
