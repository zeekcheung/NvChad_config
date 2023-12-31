# NvChad_config

This can be used as an custom config for [NvChad](https://nvchad.com)

## Installation

### Windows

```bash
# Make a backup of your current Neovim files:

# required
Move-Item $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.bak

# optional but recommended
Move-Item $env:LOCALAPPDATA\nvim-data $env:LOCALAPPDATA\nvim-data.bak

# Install NvChad
git clone https://github.com/NvChad/NvChad $HOME\AppData\Local\nvim --depth 1 && nvim

# Clone the starter:
git clone git@github.com:zeekcheung/NvChad_config.git $env:LOCALAPPDATA\nvim\lua\custom
```

### Linux/MacOS

```bash
# Make a backup of your current Neovim files:

# required
mv ~/.config/nvim{,.bak}

# optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}

# Install NvChad
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim

# Clone the starter:
git clone git@github.com:zeekcheung/NvChad_config.git ~/.config/nvim/lua/custom
```
