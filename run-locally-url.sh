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
  cwltool --outdir out convert-url-app.cwl#convert --fn resize --url "https://eoepca.org/media_portal/images/logo6_med.original.png" --size "50%"
}

main "$@"
