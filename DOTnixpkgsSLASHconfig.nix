# $HOME/.nixpkgs/config.nix

{
  allowUnfree = true;
  packageOverrides = pkgs_: with pkgs_; {
    all = lowPrio (with pkgs; buildEnv {
      name = "all";
      paths = [
        autojump
        bash
        curlFull
        ctags
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
        haskellPackages.dash-haskell
        htop
        i2p
        jq
        krb5
        lastpass-cli
        less
        mercurialFull
        mtr
        nmap
        nox
        openconnect_gnutls
        openssh_with_kerberos
        parallel
        pylint
        python27
        python27Packages.flake8
        #python27Packages.ipython
        silver-searcher
        sloccount
        tmux
        tree
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
