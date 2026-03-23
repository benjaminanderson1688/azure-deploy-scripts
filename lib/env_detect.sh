#!/bin/bash
detect_env() {
  echo "OS: $(uname -s)"
  echo "Arch: $(uname -m)"
  echo "Shell: $SHELL"
  echo "Env: ${APP_ENV:-development}"
  echo "CI: ${CI:-false}"
  [[ -f /.dockerenv ]] && echo "Docker: true" || echo "Docker: false"
}

is_production() { [[ "${APP_ENV:-}" == "production" ]]; }
is_ci() { [[ -n "${CI:-}" ]]; }
