# nix_draftsight
Nix package for running DraftSight (experimental)

This is what I wrote to let me run
[DraftSight](https://www.3ds.com/products-services/draftsight-cad-software/) on
[NixOS](https://nixos.org/)/[Nix](https://nixos.org/nix/).  DraftSight
supports Linux experimentally, but it is closed-source and only Fedora
and Ubuntu binary packages are available.

It does so with Nixpkgs'
[buildFHSUserEnv](https://nixos.org/nixpkgs/manual/#sec-fhs-environments)

Rough instructions:

1. Download the Ubuntu `.deb` for DraftSight.  (I won't try to link
   directly; get it from
   [here](https://www.3ds.com/products-services/draftsight-cad-software/free-download/).)
2. Install `dpkg` (it's in Nixpkgs).
3. Create a directory `draftsight` (or whatever).
4. Extract the `.deb` contents with: `dpkg -x draftSight.deb draftsight`.
5. Run `nix-shell` alongside the `shell.nix` in this repository.
6. Inside of that environment, run
   `draftsight/opt/dassault-systemes/DraftSight/Linux/DraftSight`.

This is liable to break easily as the binaries change.  If they do,
and it's not obvious what dependencies are broken, try running
`HelpGuide` in the same directory as `DraftSight` above, and fix its
dependencies.

## TODO

- Make this an installable package for `nix-env` and the like, perhaps
  as described
  [here](http://anderspapitto.com/posts/2015-02-28-deb-installation-nixos.html) or
  [here](https://sandervanderburg.blogspot.fr/2013/09/composing-fhs-compatible-chroot.html).
- Use patchelf (like in
  [adobe-reader](https://github.com/NixOS/nixpkgs/tree/master/pkgs/applications/misc/adobe-reader) instead of
  this chroot monstrosity.
- Get this into [Nixpkgs](https://nixos.org/nixpkgs/) if possible.
  (Use `requireFile` like
  [this](https://github.com/NixOS/nixpkgs/blob/master/pkgs/development/compilers/oraclejdk/jdk-linux-base.nix#L70)?)
