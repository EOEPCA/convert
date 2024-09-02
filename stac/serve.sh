#!/usr/bin/env bash

ORIG_DIR="$(pwd)"
cd "$(dirname "$0")"
BIN_DIR="$(pwd)"

onExit() {
  if hash tailscale 2>/dev/null; then
    tailscale funnel off
  fi
  cd "${ORIG_DIR}"
}
trap onExit EXIT

if hash tailscale 2>/dev/null; then
  tailscale funnel --bg 8080
fi

python serve.py
