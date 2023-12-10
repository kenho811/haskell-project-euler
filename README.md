# Setup with ghcup


## ghcup tui

- install ghc version 9.4.8
- set it to the default (so that it has 2 ticks)
- Run the below to install haskell language server for ghc version 9.4.8

```
ghcup compile hls --version 2.4.0.0 --ghc 9.4.8

```

# modify settings.json for vscode

```
{
    "haskell.serverEnvironment": {
        "PATH": "${HOME}/.ghcup/bin:$PATH"
    },
    "files.autoSave": "afterDelay",
    "haskell.manageHLS": "GHCup",
    "window.zoomLevel": 1,
    "haskell.plugin.rename.config.crossModule": true,

    "code-runner.executorMap": {
        "haskell": "~/.ghcup/bin/stack run"
    },
    "git.confirmSync": false,
    "debug.disassemblyView.showSourceCode": false
}

```


# make sure stack uses the system ghc
## Add the below lines

```
system-ghc: true
```

# add hie.yaml in the root for the cradle


```
cradle:
  stack:
```