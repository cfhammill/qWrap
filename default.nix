{ pkgs ? import <nixpkgs> {}
, gnused ? pkgs.gnused
, gnugrep ? pkgs.gnugrep
, stdenv ? pkgs.stdenv
, openssl ? pkgs.openssl
, openssh ? pkgs.openssh
, makeWrapper ? pkgs.makeWrapper }:

stdenv.mkDerivation rec {
  name = "qWrap";
  buildInputs = [ gnused gnugrep stdenv openssl openssh makeWrapper ];
  src = /hpf/largeprojects/MICe/chammill/2020-04-30_collinearity-investigation/simulations/qWrap;
  dontUnpack = true;
  installPhase = ''
    mkdir -p $out/bin 
    cd ${src}
    cp qsub qstat qdel $out/bin
    for file in $out/bin/*; do
      wrapProgram $file
    done
  '';    
}
