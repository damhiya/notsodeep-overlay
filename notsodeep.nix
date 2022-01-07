{ lib, stdenv, notsodeep-src, version, libnetfilter_queue, libnfnetlink }:
stdenv.mkDerivation {
  pname = "notsodeep";
  inherit version;
  src = notsodeep-src;
  buildInputs = [ libnetfilter_queue libnfnetlink ];
  installPhase = ''
    mkdir -p $out/bin
    cp notsodeep $out/bin
  '';
  meta = with lib; {
    description = "Active DPI circumvention utility for Linux";
    homepage = "https://github.com/farukuzun/notsodeep";
    license = licenses.asl20;
    platforms = platforms.linux;
  };
}
