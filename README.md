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
7. Chafa
```
winget install --id=hpjansson.Chafa  -e
```

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

## Compile Neovide (VS 2017 later required)

1. Install Rust 
```
winget install -e --id=Rustlang.Rustup
```
```
winget install -e --id=Rustlang.Rust.MSVC
```

2. Install Cmake
```
winget install -e --id=Kitware.CMake
```


3. Compile Neovide
>
> If you don't have VS2017 
> ```
> winget install Microsoft.VisualStudio.2022.Community --silent --override "--wait --quiet --add ProductLang En-us --add Microsoft.VisualStudio.Workload.NativeDesktop --includeRecommended"
> ```
>
```
cargo install --git https://github.com/neovide/neovide.git
```
