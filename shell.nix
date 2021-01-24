with (import ./.);
haskellPackages.shellFor {
  packages = p: [p.polysemy p.polysemy-plugin];
  buildInputs = [haskellPackages.ghcid];
}
