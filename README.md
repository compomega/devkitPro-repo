# devkitPro Package Repository
This repository contains additional packages for Nintendo Switch homebrew development. See the following repositories for the sources to build these packages:
* https://github.com/compomega/pacman-packages
* https://github.com/devkitPro/pacman-packages

## Adding the repository
Add these lines to the bottom of your _/opt/devkitpro/pacman/etc/pacman.conf_ file:
```
[comp_hack]
Server = https://compomega.github.io/devkitPro-repo/any
```

Make sure to update the database:
```
sudo dkp-pacman -Sy
```

## Generating packages:
1. Clone this repository.
2. Create a docker container by running this command from inside the repository:
```
docker build --tag devkitpro-build:1.0 .
```
3. Run the _makepkg.sh_ script with the following arguments:
  * Directory inside packman-packages/switch to build the package from.
  * Optional branch.

For example:
```
./makepkg.sh pugixml feature-pugixml
```
4. Update the package database:
```
./update.sh
```
5. Commit your changes.
