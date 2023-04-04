# Custom Arch-linux

Based on [archiso on Arch-Wiki](https://wiki.archlinux.org/title/Archiso)

Use the Makefile to build, and copy the `.iso`-file in ./out to the
Ventoy-drive, or use it however you like.

## Creating the iso

run

```
make buildToRam
```

## Current modifications

- added ./root_files/init.sh file, which has some very common setup-commands,
  like:

  - disabling the pcspeaker
  - connecting to wifi
  - mounting the main drive, as well as the boot-drive.

  The file is ment to be ran manually, as it may not always be the wanted
  behaviour, but very often, it is.

## Goals of this setup

Since I dont often need the live-drive, I do not need very much, mostly just
some reminders. At this point, this is mostly a rescue-drive, in case I screw
up something.

Therefore, I will keep modications to a minimum.

This project can be updated directly by simply updating the `archiso`-package, and then rebuilding.

## Note

The work-dir is set to write directly to RAM (`/tmp`) when creating the iso. I am
simnply asssuming that the device which is creating the iso has enough ram to
fit everything that pacman needs in RAM.

When making modifications, please ensure that this is scriptable. Assume that the `./archlive/`-dir will be deleted.

## Structure

- `./root_files`: Any files here will be but into the root-users home-folder

## Passwords, secrets

Put them into ./root_files/.env

Current variables:

```
WIFI_NAME="my-wifi"
WIFI_PASSWORD="my-password"
```
