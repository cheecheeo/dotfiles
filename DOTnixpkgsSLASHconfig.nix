# $HOME/.nixpkgs/config.nix

# TODO: curlFull from git-nixpkgs

{
  packageOverrides = pkgs_: with pkgs_; {
    all = with pkgs; buildEnv {
      name = "all";
      paths = [
        autojump
        curl # TODO curlFull
        elinks
        evince
        expect
        ffmpeg
        file
        gitAndTools.git-imerge
        #gitAndTools.gitFull
        gkrellm
        glxinfo
        haskellPackages.cabal-install
        haskellPackages.ghc
        haskellPackages.happy
        haskellPackages.hlint
        haskellPackages.idris
        jq
        krb5
        lastpass-cli
        mercurialFull
        nox
        openconnect # TODO: gnutls!!!
        pylint
        python27
        python27Packages.flake8
        python27Packages.ipython
        silver-searcher
        tmux
        vim
        vlc
        wvdial
        z3
      ];
    };
  };
}
