#!/usr/env/bash


curl -L https://github.com/asdf-vm/asdf/releases/download/v0.16.7/asdf-v0.16.7-linux-amd64.tar.gz | tar -xz
sudo mv asdf /usr/local/bin/

asdf plugin add python
asdf plugin add nodejs
asdf plugin add java
asdf plugin add dotnet-core
asdf plugin add golang
asdf plugin add rust
asdf plugin add ruby
asdf plugin add lua
asdf plugin add perl
