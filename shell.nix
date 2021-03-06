{pkgs ? import <nixpkgs> {
  config.android_sdk.accept_license = true;
}}:
let
  buildToolsVersion = "29.0.2";
  android = pkgs.androidenv.composeAndroidPackages {
    platformVersions = [ "30" ];
    abiVersions = ["armeabi-v7a" "arm64-v8a"]; 
    buildToolsVersions = [buildToolsVersion];
    useGoogleAPIs = true;
  };
  jdk = pkgs.jdk8;
  JAVA_HOME = "${jdk.home}";
  sdk = android.androidsdk.overrideAttrs (oldAttrs: {
    installPhase = oldAttrs.installPhase + ''
      # mkdir -p "$out/libexec/android-sdk/licenses"
      # function lic {
      #   file="$0"; shift
      #   echo -e "\n$2" >> "$out/libexec/android-sdk/licenses/$1"
      # }
      # lic android-googletv-license 601085b94cd77f0b54ff86406957099ebe79c4d6
      # lic android-sdk-arm-dbt-license 859f317696f67ef3d7f30a50a5560e7834b43903
      # lic android-sdk-license 8933bad161af4178b1185d1a37fbf41ea5269c55
      # lic android-sdk-license 24333f8a63b6825ea9c5514f83c2829b004d1fee
      # lic android-sdk-preview-license 84831b9409646a918e30573bab4c9c91346d8abd
      # lic google-gdk-license 33b6a2b64607f11b759f320ef9dff4ae5c47d97a
      # lic mips-android-sysimage-license e9acab5b5fbb560a72cfaecce8946896ff6aab9d
    '';
  });
  runtimeLibPackages = with pkgs; [
    gtk3
    glib
    util-linux
    lzma
    pcre
    xorg.libX11
    wayland
    atk
    libglvnd
    libselinux
    libsepol
    libthai
    libdatrie
    xorg.xdm
  ];
  buildLibPackages = with pkgs; [
    gtk3.dev
    glib.dev
    util-linux.dev
    lzma.dev
    pcre.dev
    xorg.libX11.dev
    libselinux.dev
    libsepol.dev
    libthai.dev
    libdatrie.dev
  ];
in
pkgs.mkShell rec {
  shellHook = with pkgs; ''
    # autoPatchelfFile ./linux/flutter/ephemeral/libflutter_linux_gtk.so -- "${wayland}/lib" "${gtk3-x11}/lib" "/run/current-system/sw/lib"
  '';
  buildInputs = with pkgs; [
    flutter
    glibc
    jre
    dart
    # linux dev
    cmake
    ninja
    clang
    pkg-config
  ] ++ buildLibPackages;
  # override the aapt2 that gradle uses with the nix-shipped version
  # GRADLE_OPTS = "-Dorg.gradle.project.android.aapt2FromMavenOverride=${ANDROID_HOME}/build-tools/${buildToolsVersion}/aapt2";
  ANDROID_HOME = "${sdk}/libexec/android-sdk";
  NIX_LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath runtimeLibPackages;
  C_INCLUDE_PATH = builtins.concatStringsSep ":" (builtins.map (p: "${p.outPath}/include") buildLibPackages);
  CPLUS_INCLUDE_PATH = C_INCLUDE_PATH;
  LD_LIBRARY_PATH = NIX_LD_LIBRARY_PATH;
  NIX_LD = builtins.readFile "${pkgs.stdenv.cc}/nix-support/dynamic-linker";
}
