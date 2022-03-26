{ lib, ruby, bundlerApp, fetchpatch }:

bundlerApp {
  pname = "hieracles";

  gemfile = ./Gemfile;
  lockfile = ./Gemfile.lock;

  gemset = lib.recursiveUpdate (import ./gemset.nix) ({
    "hieracles" = {
      dontBuild = false;
      patches = [
        (fetchpatch {
          url = "https://github.com/Gandi/hieracles/commit/e97e02bb6c94436228af2b2a08718b1a41c22122.patch";
          sha256 = "1mfl94981h4hjj8kjlnwcsmrhvmpb9qdmbqmcd45qvci9ipa3kaz";
        })
      ];
    };
  });

  inherit ruby;
  exes = [ "hieracles" ];
  
  meta = with lib; {
    homepage = "https://github.com/Gandi/hieracles";
    maintainers = with maintainers; [ mose ];
    license = licenses.mit;
    description = "Command-line tool for analysis and deep examination of Hiera paramaters in a Puppet setup";
  };
}
