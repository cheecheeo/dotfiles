# $HOME/.nixpkgs/config.nix

{
  allowUnfree = true;
  allowBroken = true;
  # for netflix
  #chromium.enableWideVine = true;
  #chromium.enablePepperFlash = true;
  #chromium.hiDPISupport = true;
  packageOverrides = pkgs_: with pkgs_; {
    all = lowPrio (with pkgs; buildEnv {
      name = "all";
      paths = [
        autojump
        bash
        bind
	binutils
        curlFull
        ctags
        darcs
        elinks
	emacs
        entr
        expect
        ffmpeg
        file
        fish
        fzf
        gitAndTools.git-imerge
        gitAndTools.gitFull
        gitAndTools.gitSVN
        gnugrep
        gnumake
        gnutar
        haskellPackages.cabal-install
        haskellPackages.cabal2nix
        haskellPackages.ghc
        haskellPackages.ghcid
        haskellPackages.happy
        haskellPackages.hindent
        haskellPackages.hlint
        haskellPackages.hscolour
        #haskellPackages.idris
        haskellPackages.ShellCheck
        #haskellPackages.dash-haskell
        htop
        httpie
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
        neovim
        openconnect_gnutls
        openssh
        parallel
        pandoc
        pastebinit
        pdftk
        perlPackages.PerlTidy
        # https://nixos.wiki/wiki/Python
        #python3
        (python3.withPackages(ps: with ps; [
            markdown2
            weasyprint
            docopt
            (buildPythonPackage rec {
                pname = "md2pdf";
                version = "1.0.1";
                src = fetchPypi {
                    inherit pname version;
                    sha256 = "sha256-PVqrd9zVtvWCexk4GasajBzsUGzl9sd3w0EbcDNSzZg=";
                };
                doCheck = false;
                propagatedBuildInputs = [
                  # Specify dependencies
                  pkgs.python3Packages.pip
                  pkgs.python3Packages.pytest-runner
                ];
            }
            )
            ])
        )
        sshfs-fuse
        silver-searcher
        sloccount
        #stack
        tmux
        tree
        # https://nixos.wiki/wiki/TexLive
        #texlive.combined.scheme-basic
        texlive.combined.scheme-full
        unrar
        vim
        wget
        #wvdial
        xdotool
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
        #gnome3.gnome_terminal
        gparted
        #hipchat
        pavucontrol
        redshift
        steam
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
