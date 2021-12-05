{
  description = "notsodeep nix overlay";

  inputs.notsodeep-src.url = "github:farukuzun/notsodeep/470532243bff92fd8314f3693c4748604078b484";
  inputs.notsodeep-src.flake = false;

  outputs = { self, notsodeep-src }: {
    overlay = self:
      super@{ pkgs, lib, stdenv, ... }: {
        notsodeep = stdenv.mkDerivation {
          pname = "notsodeep";
          version = "2019-05-29";
          src = notsodeep-src;
          buildInputs = with pkgs; [ libnetfilter_queue libnfnetlink ];
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
        };
      };
  };
}
