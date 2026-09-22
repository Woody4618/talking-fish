#!/usr/bin/env bash
set -euo pipefail

SERVICE_NAME="talking-fish-listener"
# Resolve repo root from this script's location
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
USER_NAME="$(id -un)"
GROUP_NAME="$(id -gn)"
NODE_BIN="$(command -v node || true)"
UNIT_FILE="/etc/systemd/system/${SERVICE_NAME}.service"

if [[ -z "$NODE_BIN" ]]; then
  echo "Error: node not found in PATH. Install Node.js first (e.g., sudo apt install -y nodejs)." >&2
  exit 1
fi

echo "Installing systemd service: $SERVICE_NAME"

echo "Writing unit file to $UNIT_FILE"
sudo tee "$UNIT_FILE" >/dev/null <<EOF
[Unit]
Description=Talking Fish Listener (Solana memo speaker)
After=network-online.target
Wants=network-online.target

[Service]
Type=simple
User=$USER_NAME
Group=$GROUP_NAME
WorkingDirectory=$REPO_ROOT
ExecStart=$NODE_BIN scripts/listener.js
Restart=always
RestartSec=3
# Optional hardening
NoNewPrivileges=true
ProtectSystem=full
ProtectHome=false

[Install]
WantedBy=multi-user.target
EOF

echo "Reloading systemd, enabling and starting service..."
sudo systemctl daemon-reload
sudo systemctl enable "$SERVICE_NAME"
sudo systemctl restart "$SERVICE_NAME"

echo "Service status:"
sudo systemctl status "$SERVICE_NAME" --no-pager || true

echo
echo "Done. Logs: journalctl -u $SERVICE_NAME -f" 