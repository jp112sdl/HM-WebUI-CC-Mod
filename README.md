# HM-WebUI-CC-Mod
WebUI modification to display battery voltage and valve state

  - mount -o remount,rw /
  - patch /www/webui/webui.js /tmp/webui_cc_add_batvalve.patch
  - patch /www/rega/esp/controls/heating_control.fn /tmp/heating_control.patch
  - mount -o remount,ro /
  - /etc/init.d/S70ReGaHss restart

![WebUI](Images/WebUI_Display.png)
