# northstar-server-headless

The docker container automatically installs Northstar if it doesn't finds NorthstarLauncher.exe in the Titanfall2 directory

`docker run -d --mount type=bind,source="PATHTOYOURTITANFALLINSTALLATION",target="/Titanfall2" legonzaur/northstar-server-headless:latest`
