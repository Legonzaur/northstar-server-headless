# northstar-server-headless

The docker container automatically installs Northstar if it doesn't finds NorthstarLauncher.exe in the Titanfall2 directory

`docker run -d --mount type=bind,source="PATHTOYOURTITANFALLINSTALLATION",target="/Titanfall2" legonzaur/northstar-server-headless:latest`

Non-docker version : https://gist.github.com/Legonzaur/757ee82da567663a51b6ea5d0e0cc4e6
