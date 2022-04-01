{ pkgs ? import <nixpkgs> {} }:

with pkgs;

mkShell {
  buildInputs = [
    rustup
    freetype
    fontconfig
    xorg.libXfixes
    xorg.libxcb
    libxkbcommon
    xorg.libX11
    xorg.libXcursor
    xorg.libXrandr
    xorg.libXi
    gtk3
    cairo
    mesa
    vulkan-loader
    vulkan-tools
    vulkan-headers
    vulkan-validation-layers # maybe?

    kdialog # for tiny-file-dialog - I guess we shouldn't require KDE here ;)
  ];
  nativeBuildInputs = [ cmake pkg-config ];

  LD_LIBRARY_PATH = "${xorg.libX11.out}/lib:${xorg.libXcursor.out}/lib:${xorg.libXrandr.out}/lib:${xorg.libXi.out}/lib:${gtk3.out}/lib:${cairo.out}/lib:${mesa.out}/lib:${glew-egl.out}/lib:${vulkan-loader.out}/lib";
  VULKAN_SDK = "${vulkan-validation-layers}/share/vulkan/explicit_layer.d";
}
