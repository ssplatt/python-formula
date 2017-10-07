# python-formula
Salt formula to easily toggle the installation of python versions and modules. Currently, lets you choose version 2 or 3, and modules from packages or pip.

# Config examples
defaults:
```
python:
  enabled: false
  version: 2
  from_pkgs: true
```
to install python3 and modules via pip:
```
python:
  enabled: true
  version: 3
  from_pkgs: false
  modules:
    - pcapy
    - simpledaemon
  deps:
    - libpcap0.8-dev
```
If build requirements are needed, specify them in the 'deps' list.

## Local development requirements
Install and setup brew:
```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

```
brew install cask
brew cask install vagrant
```

```
cd <formula dir>
bundle install
```
or
```
sudo gem install test-kitchen
sudo gem install kitchen-vagrant
sudo gem install kitchen-salt
```

Run a converge on the default configuration:
```
kitchen converge default
```
