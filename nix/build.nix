{
  base,
}:
let
  niv = import ./sources.nix;
  pkgs = import niv.nixpkgs {};
  overrides = self: super: {
    polysemy = self.callCabal2nix "polysemy" base {};
    polysemy-plugin = self.callCabal2nix "polysemy-plugin" "${base}/polysemy-plugin" {};
  };
  haskellPackages = pkgs.haskell.packages.ghc8102.override { inherit overrides; };
in {
  inherit haskellPackages pkgs;
  inherit (haskellPackages) polysemy polysemy-plugin;
}
