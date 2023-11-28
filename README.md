# dotfiles

### Install Oh My Zsh (https://github.com/ohmyzsh/ohmyzsh)
```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Run setup script
```shell
./setup.sh
```

### Edit `.zshrc`
1. Theme
```shell
ZSH_THEME="wezm"
```

2. Plugins
```shell
plugins=(
    git
    adb
    macos
    flutter
    zsh-autosuggestions
)

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#586e75,bold,underline"
ZSH_AUTOSUGGEST_USE_ASYNC=1
```
