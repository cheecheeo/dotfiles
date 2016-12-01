# $HOME/.nixpkgs/config.nix

{
  allowUnfree = true;
  allowBroken = true;
  # for netflix
  chromium.enableWideVine = true;
  chromium.enablePepperFlash = true;
  chromium.hiDPISupport = true;
  packageOverrides = pkgs_: with pkgs_; {
    all = lowPrio (with pkgs; buildEnv {
      name = "all";
      paths = [
        autojump
        bash
        bind
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
        gitAndTools.gitFull
        gitAndTools.gitSVN
        gnugrep
        gnutar
        haskellPackages.cabal-install
        haskellPackages.cabal2nix
        haskellPackages.ghc
        haskellPackages.ghcid
        haskellPackages.happy
        haskellPackages.hindent
        haskellPackages.hlint
        haskellPackages.hscolour
        haskellPackages.idris
        haskellPackages.neil
        haskellPackages.ShellCheck
        #haskellPackages.dash-haskell
        htop
        i2p
        irssi
        jq
        krb5Full
        lastpass-cli
        less
        man
        mercurialFull
        mosh
        mtr
        ncdu
        nethogs
        nmap
        nox
        openconnect_gnutls
        openssh_with_kerberos
        parallel
        pandoc
        pastebinit
        pdftk
        perlPackages.PerlTidy
        pythonPackages.pylint
        #python27
        python27Packages.flake8
        python27Packages.ipython
        sshfsFuse
        silver-searcher
        sloccount
        stack
        tmux
        tree
        texlive.combined.scheme-basic
        unrar
        vim
        wget
        wvdial
        xz
        z3
        zip
        zsh
      ];
    });
    all-gui = with pkgs; buildEnv {
      name = "all-gui";
      paths = [
        baobab
        chromium
        #calibre
        evince
        firefox
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
        skype
        steam
        torbrowser
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
