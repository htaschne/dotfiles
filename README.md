# .files

### Bootstrap
- Install Command-Line Tools
```
xcode-select --install
```

- Install [Homebrew](https://brew.sh/)
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

- Install brew casks and leaves
```
xml brew install $(<leaves.txt)
xml brew install --cask $(<casks.txt)
```


- Install a [Nerd Font](https://www.nerdfonts.com/).

```
brew tap epk/epk

brew install --cask font-sf-mono-nerd-font
```

- Sync Neovim packages
``` 
neovim
:PackerSync
:q
neovim # let tree-sitter install
```

