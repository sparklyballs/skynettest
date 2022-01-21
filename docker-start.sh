#!/usr/bin/env bash

# shellcheck disable=SC2154
skynet start "${service}"

trap "echo Shutting down ...; skynet stop all -d; exit 0" SIGINT SIGTERM

# shellcheck disable=SC2154
if [[ ${log_to_file} == 'true' ]]; then
  # Ensures the log file actually exists, so we can tail successfully
  touch "$SKYNET_ROOT/log/debug.log"
  tail -F "$SKYNET_ROOT/log/debug.log" &
fi

while true; do sleep 1; done
