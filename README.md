# Updated instructions in the [website](https://bit.ly/ubuntu-pi-fixes)
### Disclaimer:
**everything was tried on a pi4 4gb running Ubuntu Desktop 20.10 and 21.04.
<br>if you use a different OS/Desktop I'm not responsible for any damage that may happen (but should not happen if you follow the instructions)!**

## [Archived old instructions](Archived-old-instructions.md)


## Experimental scripts

the experimental scripts - located in the scripts folder in this repo - ask you if you want to install each app, if yes they install it. they will stay experimental untill they can also fix stuff (like the choppy audio problem). I plan on adding a GUI in the future.<br>
<b>To run:</b><br>
open terminal and type:
```
git clone https://github.com/Itai-Nelken/Ubuntu-on-rpi-fixes.git; cd Ubuntu-on-rpi-fixes/scripts; sudo chmod +x main.sh; ./main.sh
```

## Contribute
- if you have something you want to be added, open a issue and use the [`feature request`](https://github.com/Itai-Nelken/Ubuntu-on-rpi-fixes/issues/new?assignees=&labels=&template=feature_request.md&title=) template
- if you found something that doesn't work, open a issue and use the [`bug report`](https://github.com/Itai-Nelken/Ubuntu-on-rpi-fixes/issues/new?assignees=&labels=&template=bug_report.md&title=) template. if you have a fix , add it.
- anything else? use the [`open a blank issue`](https://github.com/Itai-Nelken/Ubuntu-on-rpi-fixes/issues/new?assignees=&labels=&template=blank-issue.md&title=) option when opening a issue.

## To do
- [ ] [add chromium media edition](https://github.com/monkaBlyat/docker-chromium-armhf)
- [ ] add chromium optimization(s)
- [ ] make automated script for installations
- [x] add rpi imager (not snap or flatpak)
- [ ] add bookshelf app from rpiOS
- [ ] add code the classics games (from rpiOS) - probably won't add.
- [ ] add vnc server (and viewer, from rpiOS)
- [ ] add [youtubuddy](https://github.com/Botspot/youtubuddy)
