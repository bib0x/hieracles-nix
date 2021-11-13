# HIERACLES-NIX

## Overview

This repository aims to test ruby gems setup on NixOS.

## Using custom Gemfile (hieracles 0.4.2)

Gather files from this repository

```shell
$ git clone <this repo>
```

### Development environment only

```
$ nix-shell
$ hieracles -h

Usage: hieracles <command> [extra_args] 
```

Generate **Gemfile.lock** and **gemset.nix** using `bundler` and `bundix`

```shell
$ nix-shell -p bundler bundix --run 'bundle lock && bundix'
```

### Build

```shell
$ nix-build -E '(import <nixpkgs> {}).callPackage ./. {}'
```

### Test

```shell
$ ./result/bin/hieracles -h

Usage: hieracles <command> [extra_args]

Available commands:
...
```

## Shell environment using source Gemfile (hieracles 0.4.3)

```shell
$ git clone https://github.com/Gandi/hieracles.git
$ cd hieracles

# Bundler version will be updated
$ nix-shell -p bundler bundix --run 'bundle lock && bundix'
$ cat << EOF > shell.nix
with import <nixpkgs> {};
let
   gems = pkgs.bundlerEnv {
     name = "hieracles";
     gemdir = ./.;
   };
in mkShell { buildInputs = [ gems gems.wrappedRuby ]; }
EOF
$ nix-shell
... waiting to build ...

$ ./bin/hieracles -h

Usage: hieracles <command> [extra_args] 
...
```

## Useful resources

- https://manveru.dev/blog/Ruby%20-%20Nix.html
- https://github.com/nix-community/bundix
- https://nixos.wiki/wiki/Packaging/Ruby
- https://discourse.nixos.org/t/wrapping-ruby-applications-into-custom-path/9148
