#!/usr/bin/env sh

function error() {
  >&2 echo ERROR: $1
  mount -o remount,ro /
  exit 1
}

if ! grep -qF 'object oBatteryState = cObj.DPByHssDP("BATTERY_STATE");' ; then
  error 'Seems like heating_control.fn is already patched';
fi

echo "Remounting Filesystem in read-write mode"
mount -o remount,rw / \
  || error "Could not remount in rw mode"

echo "Patching /www/rega/esp/controls/heating_control.fn"
cd /www/rega/esp/controls/ \
  || error "Could not change dir to /www/rega/esp/controls"
wget --no-check-certificate -q -O - \
  https://raw.githubusercontent.com/jp112sdl/HM-WebUI-CC-Mod/master/patch/heating_control.patch \
  | patch heating_control.fn \
  || error "Could not download or apply patch heating_control.fn"

echo "Patching /www/webui/webui.js"
cd /www/webui || error "Could not change dir to /www/webui"
wget --no-check-certificate -q -O - \
  https://raw.githubusercontent.com/jp112sdl/HM-WebUI-CC-Mod/master/patch/webui_cc_add_batvalve.patch \
  | patch webui.js \
  || error "Could not download or apply patch webui.js"

echo "Remounting Filesystem in read-only mode"
mount -o remount,ro /

echo "Restarting ReGaHss"
/etc/init.d/S70ReGaHss restart \
  || error "Could not restart ReGaHss"

echo "All done"
echo "Remember to clear your Browser cache!"
echo "Cya"