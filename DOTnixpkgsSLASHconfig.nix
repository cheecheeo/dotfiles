# $HOME/.nixpkgs/config.nix

{
  packageOverrides = pkgs_: with pkgs_; {
    all = with pkgs; buildEnv {
      name = "all";
      paths = [
        autojump
        curl # TODO curlFull from git
        elinks
        evince
        expect
        ffmpeg
        file
        gitAndTools.git-imerge
        #gitAndTools.gitFull #TODO: special git at Twitter, change PATH?
        gkrellm
        glxinfo
        gnome3.eog
        gnugrep
        haskellPackages.cabal-install
        haskellPackages.ghc
        haskellPackages.happy
        haskellPackages.hlint
        haskellPackages.idris
        jq
        krb5
        lastpass-cli
        less
        mercurialFull
        nox
        #openconnect # TODO: openconnect_gnutls from git
        pylint
        python27
        python27Packages.flake8
        python27Packages.ipython
        silver-searcher
        sloccount
        tmux
        vim
        vlc
        wvdial
        z3
        zsh
      ];
    };
  };
}
