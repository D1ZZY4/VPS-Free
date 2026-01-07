#!/usr/bin/env bash
source /workspaces/VPS-Free/.venv/bin/activate

while true; do
  echo "▶ starting tg_bot..."
  python -m tg_bot &
  PID=$!

  inotifywait -r -e modify,create,delete,move tg_bot config.ini

  echo "🔄 change detected, restarting..."
  kill $PID
  wait $PID
done
