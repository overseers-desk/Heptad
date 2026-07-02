#!/usr/bin/env bash
#
# Install Heptad as a self-named XKB layout in the system tree, so it shows up
# in GNOME/KDE keyboard settings without overwriting the distro-owned `us` file.
# Re-runnable; safe to run again after an xkeyboard-config package upgrade
# (which reverts anything under /usr/share/X11/xkb).
#
# No-sudo alternative (Wayland / libxkbcommon sessions only): copy
# symbols/heptad to ~/.config/xkb/symbols/heptad and the <layout> block from
# heptad.xml into ~/.config/xkb/rules/evdev.xml. That survives all system
# upgrades, but X11 sessions do not read ~/.config/xkb, so this script uses the
# system tree for portability across X11 and Wayland.
#
set -euo pipefail

here="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
xkb=/usr/share/X11/xkb
symbols="$xkb/symbols/heptad"
rules="$xkb/rules/evdev.xml"

sudo install -m 0644 "$here/symbols/heptad" "$symbols"
echo "Installed $symbols"

if grep -q '<name>heptad</name>' "$rules"; then
  echo "Registry entry already present in $rules"
else
  tmp="$(mktemp)"
  awk -v ins="$here/heptad.xml" '
    /<\/layoutList>/ && !done {
      while ((getline line < ins) > 0) print line
      done = 1
    }
    { print }
  ' "$rules" > "$tmp"
  sudo install -m 0644 "$tmp" "$rules"
  rm -f "$tmp"
  echo "Registered heptad in $rules"
fi

cat <<'MSG'

Done. Activate Heptad:
  GNOME Settings -> Keyboard -> Input Sources -> + -> search "Heptad"
  (log out and back in if it does not appear yet), or from a terminal:
    gsettings set org.gnome.desktop.input-sources sources "[('xkb','heptad')]"
MSG
