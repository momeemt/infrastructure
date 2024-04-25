{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/23.11";
    flake-utils.url = "github:numtide/flake-utils";
    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };
  };
  outputs = {
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
      in {
        packages.deploy-environment = pkgs.mkShell {
          buildInputs = with pkgs; [
            terraform
            sops
            yq-go
          ];
        };

        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [
            nil
            alejandra
            sops
            terraform
            terraform-ls
            yq-go
          ];
        };
      }
    );
}
