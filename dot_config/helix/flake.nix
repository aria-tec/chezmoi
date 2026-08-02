{
  description = "Aria's Personal Package Bundle - ARM";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: 
  let
    # Mendeteksi sistem secara otomatis (akan bekerja di aarch64-linux atau aarch64-darwin)
    system = "aarch64-linux"; 
    pkgs = import nixpkgs {
      inherit system;
      config = { allowUnfree = true; };
    };
  in {
    packages.${system}.default = pkgs.buildEnv {
      name = "my-packages";
      paths = with pkgs; [
          # tsx / jsx
          typescript-language-server
          vtsls
          vscode-langservers-extracted #eslint
          tailwindcss-language-server
          prettier

          #javascript / typescript
          vtsls
          typescript-language-server
          vscode-langservers-extracted #eslint
          prettier

          # rust
          # cargo
          # rust-analyzer
          # clippy
          # rustfmt

          
          yaml-language-server
          systemd-lsp
          ruff
          intelephense
          nil
          marksman
          lua-language-server
          texlab
          jdt-language-server
          vscode-langservers-extracted
          dockerfile-language-server
          dart   
          bash-language-server
          astro-language-server

	        helix
	        zellij
	        starship
	        gcc
	        lazygit
	        yazi
	        gitui
	        rainfrog
	        atac
	  
      ];
    };
  };
}
