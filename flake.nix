{
  description = "Code, Config, Curricula - Presentation";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    systems.url = "github:nix-systems/default-linux";
    wrappers = {
      url = "github:Lassulus/wrappers";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      systems,
      wrappers,
      ...
    }:
    let
      forEachSystem =
        f: nixpkgs.lib.genAttrs (import systems) (system: f nixpkgs.legacyPackages.${system});

      presenterm =
        pkgs:
        wrappers.lib.wrapPackage {
          inherit pkgs;
          package = pkgs.presenterm;
          runtimeInputs = [ pkgs.python3Packages.weasyprint ];
        };

      presentationScript =
        pkgs:
        pkgs.writeShellScriptBin "run-presentation" ''
          has_config=""
          for arg in "$@"; do
            if [ "$arg" = "--config-file" ]; then
              has_config=1
              break
            fi
          done

          if [ -z "$has_config" ]; then
            set -- --config-file ${self}/config.yaml "$@"
          fi

          exec ${pkgs.lib.getExe (presenterm pkgs)} "$@" "$PWD/code-config-curriculum.md"
        '';

    in
    {
      packages = forEachSystem (pkgs: {
        default = presentationScript pkgs;
      });
      devShells = forEachSystem (pkgs: {
        default = pkgs.mkShell {
          buildInputs = [ (presentationScript pkgs) ];
        };
      });
    };
}
