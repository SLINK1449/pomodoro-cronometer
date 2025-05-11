#!/bin/bash

# Variables
APP_NAME="Pomodoro Timer"
EXEC_PATH="$(pwd)/ui.py"
ICON_PATH="$(pwd)/icon.png"  # Change this if you have a real icon
DESKTOP_FILE="$HOME/.local/share/applications/pomodoro_timer.desktop"

# Create a desktop entry
cat > "$DESKTOP_FILE" << EOL
[Desktop Entry]
Name=$APP_NAME
Comment=A simple Pomodoro timer
Exec=/usr/bin/env python3 $EXEC_PATH
Icon=$ICON_PATH
Terminal=false
Type=Application
Categories=Utility;
EOL

# Make the .desktop file executable
chmod +x "$DESKTOP_FILE"

echo "Launcher created at $DESKTOP_FILE"


#!/bin/bash

# Define variables
ICON_URL="https://www.nicepng.com/png/full/208-2086072_this-free-icons-png-design-of-pomodoro-timer.png"
ICON_PATH="$HOME/pomodoro_cronometre/icon.png"
DESKTOP_FILE="$HOME/.local/share/applications/pomodoro_timer.desktop"

# Create folder if not exists
mkdir -p "$HOME/pomodoro_cronometre"

# Download the icon
echo "Downloading Pomodoro icon..."
curl -L "$ICON_URL" -o "$ICON_PATH"

# Check if download succeeded
if [ $? -ne 0 ]; then
  echo "❌ Failed to download icon."
  exit 1
fi

# Update .desktop file (or create if not exists)
echo "Updating desktop launcher..."

cat > "$DESKTOP_FILE" << EOL
[Desktop Entry]
Name=Pomodoro Timer
Comment=A simple Pomodoro timer
Exec=/usr/bin/env python3 $HOME/pomodoro_cronometre/ui.py
Icon=$ICON_PATH
Terminal=false
Type=Application
Categories=Utility;
EOL

chmod +x "$DESKTOP_FILE"
echo "✅ Icon set and launcher updated."
