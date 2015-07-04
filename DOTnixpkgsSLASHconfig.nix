# $HOME/.nixpkgs/config.nix

{
  packageOverrides = pkgs_: with pkgs_; {
    all = with pkgs; buildEnv {
      name = "all";
      paths = [
        autojump
        bash
        curl # TODO curlFull from git
        elinks
        expect
        ffmpeg
        file
        gitAndTools.git-imerge
        #gitAndTools.gitFull #TODO: special git at Twitter, change PATH?
        gnugrep
        haskellPackages.cabal-install
        haskellPackages.ghc
        haskellPackages.happy
        haskellPackages.hlint
        haskellPackages.idris
        haskellPackages.ShellCheck
        i2p
        jq
        krb5
        lastpass-cli
        less
        mercurialFull
        mtr
        nox
        openconnect_gnutls
        openssh_with_kerberos
        parallel
        pylint
        python27
        python27Packages.flake8
        python27Packages.ipython
        silver-searcher
        sloccount
        tmux
        unrar
        vim
        wvdial
        z3
        zip
        zsh
      ];
    };
    all-gui = with pkgs; buildEnv {
      name = "all-gui";
      paths = [
        baobab
        calibre
        evince
        gimp
        gkrellm
        glxinfo
        gnome3.eog
        gparted
        redshift
        transmission_gtk
        vlc
        zeal
      ];
    };
  };
}
