{ pkgs, lib, fetchFromGitHub, rustPlatform }:

# https://nixos.org/manual/nixpkgs/stable/#compiling-rust-applications-with-cargo
rustPlatform.buildRustPackage rec {
  pname = "uclcli";
  version = "0.1";

  src = fetchFromGitHub {
    owner = "afflux";
    repo = pname;
    rev = "7a8eb15f7bf0b54598e1d54aff6cd81bfab5f493";
    hash = "sha256-a8fcwmROnqljMYf+2+rv/aOzaAPzAaUTrAXOPuTGLJA=";
  };

  cargoHash = "sha256-PgGjxM6/WuL4iirfLZM5EoPgzZU6IsPXRyUeHvTomtE=";

  buildInputs = [ (pkgs.callPackage ./libucl.nix {}) ];

  checkFlags = [
    "--skip=tests::decompress_8k_too_small"
    "--skip=tests::decompress_buffer_8k_too_small"
  ];

  meta = {
    description = "uclcli - cli for libucl";
    homepage = "https://github.com/afflux/uclcli";
    license = lib.licenses.gpl3Only;
    maintainers = ["afflux"];
  };
}
