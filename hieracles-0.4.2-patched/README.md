# HIERACLES 0.4.2 PATCHED

## Overview

This repository aims to build in fact `hieracles-0.4.4` (not merged https://github.com/Gandi/hieracles/pull/7/files) by manually 
adding the latest patch to `hieracles-0.4.2` code base.

Patches: 
- https://github.com/Gandi/hieracles/commit/904d071a5bc898a08c32155fb076167c7907c77d.patch
- https://github.com/bib0x/hieracles/commit/09e2e5ba6ccaa7a382e868cf2df246b1bc5113a1.patch

However, we can't patch the Gemfile.lock file with the latest hieracles version.
So, we still end up be printing 0.4.2 when doing `hieracles -v`.

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

## Verify

```
# Find the realpath

$ ls -l ./result/bin/hieracles
lrwxrwxrwx 1 root root 73 Jan  1  1970 result/bin/hieracles -> /nix/store/izn9gjh7z7va6jd0gd1f1p2frx1m58w3-hieracles-0.4.2/bin/hieracles 

# Display patched lines

$ sed -n 80p /nix/store/izn9gjh7z7va6jd0gd1f1p2frx1m58w3-hieracles-0.4.2/lib/ruby/gems/2.7.0/gems/hieracles-0.4.2/lib/hieracles/formats/console.rb
          output << format("#{COLORS[i % COLORS.length]}\n", "[#{i}] #{f}")

$ sed -n 101p /nix/store/izn9gjh7z7va6jd0gd1f1p2frx1m58w3-hieracles-0.4.2/lib/ruby/gems/2.7.0/gems/hieracles-0.4.2/lib/hieracles/formats/console.rb
              filecolor = COLORS[filecolor_index % COLORS.length]
```

```
$ readlink -f $(command -v hieracles)
/nix/store/93lj9qpfiilv0wac7mikbj2gvhbfb8nl-hieracles-0.4.2/bin/hieracles

$ tail +55 /nix/store/93lj9qpfiilv0wac7mikbj2gvhbfb8nl-hieracles-0.4.2/lib/ruby/gems/3.1.0/gems/hieracles-0.4.2/lib/hieracles/node.rb | head -n 5
        begin
          data = YAML.load_file(File.join(@config.basepath, f), aliases: true)
        rescue ArgumentError
          data = YAML.load_file(File.join(@config.basepath, f))
        end
```
