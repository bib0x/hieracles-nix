{ bundlerApp, makeWrapper }:
bundlerApp {
  pname = "hieracles";
  gemdir = ./.;
  exes = [ "hieracles" ];
  buildInputs = [ makeWrapper ];
}
