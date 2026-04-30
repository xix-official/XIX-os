# CC0 1.0 Universal (CC0 1.0) Public Domain Dedication
#
# The person who associated a work with this deed has dedicated the work to the
# public domain by waiving all of their rights to the work worldwide under
# copyright law, including all related and neighboring rights, to the extent
# allowed by law.
#
# You can copy, modify, distribute and perform the work, even for commercial
# purposes, all without asking permission.
#
# In jurisdictions that recognize copyright laws, the author or authors of this
# work dedicate any and all copyright interest in the work to the public domain.
# They make this dedication for the benefit of the public at large and to the
# detriment of their heirs and successors. They intend this dedication to be an
# overt act of relinquishment in perpetuity of all present and future rights to
# this work under copyright law.
#
# UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING, THE WORK IS PROVIDED
# "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
# LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE
# AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM,
# DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
# ARISING FROM, OUT OF OR IN CONNECTION WITH THE WORK OR THE USE OR OTHER
# DEALINGS IN THE WORK.
#
# For more information, please see:
# https://creativecommons.org/publicdomain/zero/1.0/
# My GitLab: https://gitlab.com/XIX_Official
 
#!/bin/sh

echo "=== XIX: Starting offline post-installation ==="

# Install all offline packages into the target system
echo "Installing offline packages..."
for pkg in /preinstalled/pkgs/*.pkg; do
    pkg -c /mnt add "$pkg"
done

echo "Enabling GNOME services..."
sysrc -f /mnt/etc/rc.conf gnome_enable="YES"
sysrc -f /mnt/etc/rc.conf gdm_enable="YES"
sysrc -f /mnt/etc/rc.conf dbus_enable="YES"
sysrc -f /mnt/etc/rc.conf hald_enable="YES"

echo "Configuring X11..."
mkdir -p /mnt/usr/local/etc/X11/xorg.conf.d/

cat << EOF > /mnt/usr/local/etc/X11/xorg.conf.d/00-x11.conf
Section "Device"
    Identifier "Card0"
    Driver "modesetting"
EndSection
EOF

echo "Installing XIX wallpaper..."
mkdir -p /mnt/usr/local/share/backgrounds/xix/
cp /preinstalled/wallpapers/wallpaper.png /mnt/usr/local/share/backgrounds/xix/default.png

echo "Setting XIX wallpaper as GNOME default..."
mkdir -p /mnt/usr/share/glib-2.0/schemas/

cat << EOF > /mnt/usr/share/glib-2.0/schemas/99_xix_background.gschema.override
[org.gnome.desktop.background]
picture-uri='file:///usr/local/share/backgrounds/xix/default.png'
picture-uri-dark='file:///usr/local/share/backgrounds/xix/default.png'
EOF

# Compile GNOME schemas
chroot /mnt glib-compile-schemas /usr/share/glib-2.0/schemas/

echo "=== XIX: Post-installation completed successfully ==="
