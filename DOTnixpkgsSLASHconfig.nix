# $HOME/.nixpkgs/config.nix

{
  allowUnfree = true;
  allowBroken = true;
  packageOverrides = pkgs_: with pkgs_; {
    all = lowPrio (with pkgs; buildEnv {
      name = "all";
      paths = [
        autojump
        bash
        curlFull
        ctags
        darcs
        elinks
        entr
        expect
        ffmpeg
        file
        fzf
        gitAndTools.git-imerge
        #gitAndTools.gitFull #TODO: special git at Twitter, change PATH?
        gnugrep
        haskellPackages.cabal-install
        haskellPackages.cabal2nix
        haskellPackages.ghc
        haskellPackages.ghcid
        haskellPackages.happy
        haskellPackages.hindent
        haskellPackages.hlint
        haskellPackages.idris
        haskellPackages.ShellCheck
        haskellPackages.stack
        haskellPackages.dash-haskell
        htop
        i2p
        irssi
        jq
        krb5Full
        lastpass-cli
        less
        mercurialFull
        mtr
        nmap
        nox
        openconnect_gnutls
        openssh_with_kerberos
        parallel
        pandoc
        pylint
        python27
        python27Packages.flake8
        python27Packages.ipython
        silver-searcher
        sloccount
        tmux
        tree
        texLiveFull
        unrar
        vim
        wvdial
        z3
        zip
        zsh
      ];
    });
    all-gui = with pkgs; buildEnv {
      name = "all-gui";
      paths = [
        baobab
        #calibre
        evince
        #firefox-bin
        #flashplayer
        gimp
        gkrellm
        glxinfo
        gnome3.dconf
        gnome3.eog
        #gnome3.gnome_terminal
        gparted
        #hipchat
        pavucontrol
        redshift
        steam
        transmission_gtk
        unison
        #viber
        vimHugeX
        vlc
        xclip
        zeal
      ];
    };
  };
}
