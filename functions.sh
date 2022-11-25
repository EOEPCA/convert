
createVenv() {
  if [ ! -d venv ]; then
    echo "Creating python venv..."
    python -m venv venv
    source venv/bin/activate
    echo -n "  Updating python venv... "
    python -m pip install -U pip >/dev/null
    pip install -U wheel >/dev/null
    echo "[done]"
    echo -n "  Installing cwltool... "
    pip install -U cwlref-runner >/dev/null
    echo "[done]"
    deactivate
    echo "...python venv created"
  else
    echo "Using existing python venv"
  fi
}

activateVenv() {
  createVenv
  source venv/bin/activate
}

deactivateVenv() {
  if hash deactivate >/dev/null 2>&1; then
    echo -n "Deactivating python venv... "
    deactivate
    echo "[done]"
  fi
}
