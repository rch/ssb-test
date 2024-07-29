{ pkgs, ... }:

{
  packages = [ 
    pkgs.git
    pkgs.jdk11
    pkgs.maven
  ];
}

