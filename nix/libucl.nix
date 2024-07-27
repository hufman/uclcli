{ stdenv }:

stdenv.mkDerivation {
  name = "ucl-1.03";

  src = fetchTarball {
    url = "http://www.oberhumer.com/opensource/ucl/download/ucl-1.03.tar.gz";
    sha256 = "0i5sg0md2q0z8wv5b2hd5maf1py4jzb50mwaqgn31dsyxm0zi08l";
  };
}
