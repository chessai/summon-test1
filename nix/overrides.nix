{ pkgs }:

self: super:

with { inherit (pkgs.stdenv) lib; };

with pkgs.haskell.lib;

{
  summon-test1 = (
    with rec {
      summon-test1Source = pkgs.lib.cleanSource ../.;
      summon-test1Basic  = self.callCabal2nix "summon-test1" summon-test1Source { };
    };
    overrideCabal summon-test1Basic (old: {
    })
  );
}
