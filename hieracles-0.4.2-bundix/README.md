# HIERACLES WITH BUNDIX

## Overview

This repository is the same as hieracles-0.4.2 but you need to generate `Gemfile.lock` and `gemset.nix` 
files before trying any build.

```
$ nix-shell -p bundler bundix --run 'bundle lock && bundix'
```

## Build

```
$ nix-build
$ ./result/bin/hieracles -v
0.4.2
```

## Install

```
$ nix-env -f default.nix -i hieracles
$ hieracles -v
0.4.2
```

## Shell

```
$ nix-shell
$ hieracles -v
0.4.2
```

