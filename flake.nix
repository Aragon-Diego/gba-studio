{
  description = "Develop env for gba studio";

  inputs = {

    # Use pkgs from 23.05 branch
    nixpkgs.url = "nixpkgs/nixos-23.05";
    
  };

  outputs = { self, nixpkgs, ... }:
    let
      # Set vars
      lsystem = "x86_64-linux";
      dsystem = "aarch64-darwin";
      lpkgs = nixpkgs.legacyPackages.${lsystem};
      dpkgs = nixpkgs.legacyPackages.${dsystem};
    in {

      # Set linux defualt shell
      devShells.${lsystem}.default = lpkgs.mkShell {
	nativeBuildInputs = with lpkgs; [
	  gtk4
	  pkg-config
	];
      };

      # Set darwin default shell
      devShells.${dsystem}.default = dpkgs.mkShell {
	nativeBuildInputs = with dpkgs; [
	  gtk4
	  pkg-config
	];
      };

    };
}
