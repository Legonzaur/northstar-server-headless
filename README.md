# northstar-server-headless

## This repository will be discontinued when a [better image](https://github.com/pg9182/northstar-dedicated) is released

This docker container automatically installs Northstar

This docker container will most likely override your Northsar config and settings at first launch and at every Northstar update

**Build image from `wine_custom` branch for experimental bugfixes**

## How to run

```bash
docker run -d --mount type=bind,source="PATHTOYOURTITANFALLINSTALLATION",target="/Titanfall2" legonzaur/northstar-server-headless:latest
```

## How to build

```bash
git clone https://github.com/Legonzaur/northstar-server-headless
cd northstar-server-headless
docker build -t northstar .
```
then run with 

```bash
docker run -d --mount type=bind,source="PATHTOYOURTITANFALLINSTALLATION",target="/Titanfall2" northstar
```

## Other instructions

Non-docker version : https://gist.github.com/Legonzaur/757ee82da567663a51b6ea5d0e0cc4e6

see [pg9182/northstar-dedicated](https://github.com/pg9182/northstar-dedicated) for detailled informations and future versions
