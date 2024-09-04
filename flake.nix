{
    description = "A flake for chisel & verilator development";
    inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    outputs = { self, nixpkgs }: {

        # devShell.x86_64-linux = with nixpkgs.legacyPackages.x86_64-linux; mkShellNoCC {
        #   packages = with pkgs; [
        #     verilator
        #     ninja
        #     cmake
        #     clang_18
        #   ];
        # };
        devShell.aarch64-darwin = with nixpkgs.legacyPackages.aarch64-darwin; mkShellNoCC {
            packages = with pkgs; [
                # Scala 
                sbt
                scala-cli

                # Java
                zulu8

                # Verilator
                verilator
                ninja
                cmake
            ];
            shellHook = ''
                export CXX=/usr/bin/c++
            '';
        };
    };
}
