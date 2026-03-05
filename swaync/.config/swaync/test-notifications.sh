#!/bin/bash

echo "=== SwayNC Notification Debug Script ==="
echo ""

# Check if SwayNC is running
echo "1. Checking if SwayNC is running..."
if pgrep -x swaync > /dev/null; then
    echo "   ✓ SwayNC is running (PID: $(pgrep -x swaync))"
else
    echo "   ✗ SwayNC is NOT running"
fi
echo ""

# Check D-Bus notification service
echo "2. Checking D-Bus notification service..."
if gdbus call --session --dest org.freedesktop.DBus --object-path /org/freedesktop/DBus --method org.freedesktop.DBus.ListNames | grep -q "org.freedesktop.Notifications"; then
    echo "   ✓ org.freedesktop.Notifications is registered"
else
    echo "   ✗ No notification service registered on D-Bus"
fi
echo ""

# Check DND status
echo "3. Checking Do Not Disturb status..."
DND=$(swaync-client -d)
if [ "$DND" = "true" ]; then
    echo "   ✗ DND is ENABLED (notifications are blocked!)"
else
    echo "   ✓ DND is disabled"
fi
echo ""

# Check notification count
echo "4. Current notification count..."
COUNT=$(swaync-client -c)
echo "   Notifications in queue: $COUNT"
echo ""

# Send test notifications
echo "5. Sending test notifications..."
echo "   Sending normal notification (10 second timeout)..."
notify-send -t 10000 "Test Normal" "This is a normal priority notification - 10 second display"
sleep 1

echo "   Sending low priority notification (8 second timeout)..."
notify-send -u low -t 8000 "Test Low" "This is a LOW priority notification - 8 second display"
sleep 1

echo "   Sending critical notification (15 second timeout)..."
notify-send -u critical -t 15000 "Test Critical" "This is a CRITICAL notification - 15 second display"
sleep 2

NEW_COUNT=$(swaync-client -c)
echo "   New notification count: $NEW_COUNT"
if [ "$NEW_COUNT" -gt "$COUNT" ]; then
    echo "   ✓ Notifications are being received by SwayNC"
else
    echo "   ✗ Notifications are NOT being received"
fi
echo ""

# Check desktop portal
echo "6. Checking XDG Desktop Portal..."
if pgrep -x xdg-desktop-portal > /dev/null; then
    echo "   ✓ xdg-desktop-portal is running"
    if [ -f ~/.config/xdg-desktop-portal/hyprland-portals.conf ]; then
        echo "   ✓ Portal config exists"
        echo "   Config contents:"
        cat ~/.config/xdg-desktop-portal/hyprland-portals.conf | sed 's/^/     /'
    else
        echo "   ✗ No portal config found"
    fi
else
    echo "   ✗ xdg-desktop-portal is NOT running"
fi
echo ""

# Check for competing notification daemons
echo "7. Checking for competing notification daemons..."
COMPETING=$(ps aux | grep -E "(dunst|mako)" | grep -v grep)
if [ -z "$COMPETING" ]; then
    echo "   ✓ No competing daemons found"
else
    echo "   ✗ Found competing daemon:"
    echo "$COMPETING" | sed 's/^/     /'
fi
echo ""

# Check browser processes
echo "8. Checking browser processes..."
BROWSERS=$(ps aux | grep -E "(brave|chrome|chromium|firefox)" | grep -v "grep\|crashpad\|zygote\|sandbox" | head -3)
if [ -n "$BROWSERS" ]; then
    echo "   Browsers running:"
    echo "$BROWSERS" | awk '{print "     " $11}' | sort -u
else
    echo "   No browsers running"
fi
echo ""

# Check installed portal backends
echo "9. Checking installed portal backends..."
for backend in /usr/lib/xdg-desktop-portal-*; do
    if [ -f "$backend" ] && [ -x "$backend" ]; then
        echo "   ✓ $(basename $backend)"
    fi
done
echo ""

# Check for portal backend packages
echo "10. Checking for xdg-desktop-portal-gtk package..."
if pacman -Qi xdg-desktop-portal-gtk &>/dev/null; then
    echo "   ✓ xdg-desktop-portal-gtk is installed"
else
    echo "   ✗ xdg-desktop-portal-gtk is NOT installed"
    echo "   → This is needed for browser notifications!"
    echo "   → Install with: sudo pacman -S xdg-desktop-portal-gtk"
fi
echo ""

echo "=== Debug complete ==="
echo ""
echo "To test browser notifications:"
echo "1. Open your browser (Brave/Chrome)"
echo "2. Visit: https://web-push-book.gauntface.com/demos/notification-examples/"
echo "3. Try triggering a notification"
echo ""
echo "If browser notifications show as separate windows instead of SwayNC:"
echo "→ Install xdg-desktop-portal-gtk: sudo pacman -S xdg-desktop-portal-gtk"
echo "→ Then restart the portal: systemctl --user restart xdg-desktop-portal"
