# HIERACLES 0.4.2

## Overview

This repository aims to install/build hieracles 0.4.2 with pre-generated 
`gemset.nix` and `Gemfile.lock` files.

## Using custom Gemfile (hieracles 0.4.2)

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
