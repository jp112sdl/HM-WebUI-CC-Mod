# HM-WebUI-CC-Mod
WebUI modification to display battery voltage and valve state

Login via SSH and execute the following commands (note: every point is one line with no line breaks):<br/>
- `mount -o remount,rw /`<br/>
- `cd /www/rega/esp/controls/ ; wget --no-check-certificate -q -O - https://raw.githubusercontent.com/jp112sdl/HM-WebUI-CC-Mod/master/patch/heating_control.patch | patch heating_control.fn`<br/>
- `cd /www/webui/ ; wget --no-check-certificate -q -O - https://raw.githubusercontent.com/jp112sdl/HM-WebUI-CC-Mod/master/patch/webui_cc_add_batvalve.patch | patch webui.js`<br/>
- `mount -o remount,ro /`<br/>
- `/etc/init.d/S70ReGaHss restart`<br/>
  
**At least: clear browser cache!**
<br/>
**Caution: This mod must be applied after every ccu/raspberrymatic firmware update.**


![WebUI](Images/WebUI_Display.png)
