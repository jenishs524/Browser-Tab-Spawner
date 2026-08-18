# Browser Tab Spawner (Stress Test Tool)

A lightweight Bash script designed for automated browser tab spawning, system load testing, and browser memory resilience evaluation.

---

## 📌 Features

- **Automatic Browser Detection**: Automatically detects available web browsers (`firefox`, `google-chrome`, `chromium-browser`, or `xdg-open`).
- **Configurable Parameters**: Easily set total tab count, target URL, and delay interval between launched tabs.
- **Asynchronous Execution**: Launches tabs concurrently using background processes to simulate heavy GUI/memory load.

---

## 📋 Prerequisites

- **Operating System**: Linux / Unix-like environment
- **Shell**: Bash (`/bin/bash`)
- **Supported Browsers**:
  - Mozilla Firefox
  - Google Chrome
  - Chromium
  - Any default browser registered with `xdg-open`

---

## ⚙️ Configuration

Open `tab_bomb.sh` in any text editor to customize the following variables:

```bash
# -------- CONFIGURATION --------
TABS=100                    # Total number of tabs to open
URL="https://example.com"   # Target URL to load in each tab
DELAY=0.1                   # Delay in seconds between each tab
# ------------------------------
```

---

## 🚀 How to Use

### 1. Make the Script Executable
```bash
chmod +x tab_bomb.sh
```

### 2. Run the Script
```bash
./tab_bomb.sh
```

### 3. Stop Execution
If you need to stop spawning tabs early, press `Ctrl + C` in the terminal before the loop finishes.

---

## 💡 How It Works

1. **Browser Discovery**: Checks for installed system browsers (`firefox`, `google-chrome`, `chromium-browser`) using `command -v`.
2. **Loop & Asynchronous Launch**: Iterates from `1` to `TABS`, invoking the browser with `--new-tab "$URL"` in the background (`&`).
3. **Pacing Delay**: Pauses for `DELAY` seconds (`sleep "$DELAY"`) between launches to manage process spawning speed.

---

## ⚠️ Disclaimer

This script is provided for authorized testing, educational purposes, and performance benchmarking only. Launching excessive browser tabs may consume high amounts of system memory (RAM) and CPU resources. Use responsibly on systems you own or have explicit permission to test.
