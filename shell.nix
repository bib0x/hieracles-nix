with import <nixpkgs> {};
let
   gems = pkgs.bundlerEnv {
     name = "hieracles";
     gemdir = ./.;
   };
in mkShell { buildInputs = [ gems gems.wrappedRuby ]; }
