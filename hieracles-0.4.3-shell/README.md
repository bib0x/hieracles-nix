# HIERACLES 0.4.3 NIX-SHELL

## Overview

It's possible to use hieracles 0.4.3 directly by using a Nix Shell.

## Shell environment using source Gemfile (hieracles 0.4.3)

```shell
$ git clone https://github.com/Gandi/hieracles.git
$ cd hieracles

# Need to patch Gemfile to avoir a DEPRECATED warning
$ cat Gemfile
source 'https://rubygems.org'
gem 'hieracles'

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

$ ./bin/hieracles -v
0.4.3
```
