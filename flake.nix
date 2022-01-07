{
  description = "notsodeep nix overlay";

  inputs.notsodeep-src.url =
    "github:farukuzun/notsodeep/470532243bff92fd8314f3693c4748604078b484";
  inputs.notsodeep-src.flake = false;

  outputs = { self, notsodeep-src }: {
    overlay = self: super: {
      notsodeep = super.callPackage ./notsodeep.nix {
        inherit notsodeep-src;
        version = "20190529";
      };
    };
  };
}
