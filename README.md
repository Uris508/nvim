# 💤 LazyVim

## Requirements

1. neovim
```
winget install Neovim.Neovim
```
2. Fzf
```
winget install fzf 
```
3. Ripgrep
```
winget install BurntSushi.ripgrep.MSVC
```
4. Zig (for treesitter)
```
winget install -e Zig 
```
5. Node.JS
```
winget install -e --id=OpenJS.NodeJS
```
6. [Nerd fonts](https://www.nerdfonts.com/font-downloads)


## Install LazyVim
```
Move-Item $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.bak
```

```
Move-Item $env:LOCALAPPDATA\nvim-data $env:LOCALAPPDATA\nvim-data.bak
```

```
git clone https://github.com/LazyVim/starter $env:LOCALAPPDATA\nvim
```

```
Remove-Item $env:LOCALAPPDATA\nvim\.git -Recurse -Force
```
