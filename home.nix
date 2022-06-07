{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "sun";
  home.homeDirectory = "/home/sun";

  # Packages that should be installed to the user profile.
  home.packages = [
    pkgs.awscli2
    # pkgs.ssm-session-manager-plugin
    # pkgs.aws-client-vpn
    pkgs.bat
    pkgs.bottom
    pkgs.curl
    pkgs.fd
    pkgs.gopls
    pkgs.jq
    pkgs.nodePackages.typescript-language-server
    pkgs.nodePackages.vls
    pkgs.nodePackages.vscode-langservers-extracted
    pkgs.nodePackages.yaml-language-server
    pkgs.ripgrep
    pkgs.rnix-lsp
    pkgs.rustup
    pkgs.rust-analyzer
    pkgs.skim
    pkgs.sumneko-lua-language-server
    pkgs.unar
    pkgs.zip
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.tmux = {
    enable = true;
    baseIndex = 1;
    escapeTime = 10;
    prefix = "'C-\\'";
    terminal = "screen-256color";

    extraConfig = ''
      set-option -g  focus-events on
      # set-option -g  history-limit 100000
      set-option -g  renumber-windows on
      set-option -ag update-environment I3SOCK
      set-option -ag update-environment SWAYSOCK
      set-option -as terminal-overrides ",foot:Tc"

      # source config
      # bind s source-file ~/.tmux.conf
      source-file -q ~/.local/share/nvim/site/pack/packer/start/nightfox.nvim/extra/nightfox/nightfox_tmux.tmux

      # server
      bind-key q confirm-before -p "kill-server? (y/n)" kill-server

      # session
      bind-key -T root M-Space choose-tree -s
      bind-key -T root M-N command-prompt "new-session -s '%%'"
      bind-key -T root M-L switch-client -n
      bind-key -T root M-H switch-client -p
      bind-key -T root 'M-;' switch-client -l

      # window
      bind-key -T root M-n new-window -c "#{pane_current_path}"
      bind-key -T root M-K next-window
      bind-key -T root M-J previous-window
      bind-key -T root M-/ choose-tree -w
      bind-key -T root 'M-\' last-window
      bind-key -T root M-1 select-window -t :=1
      bind-key -T root M-2 select-window -t :=2
      bind-key -T root M-3 select-window -t :=3
      bind-key -T root M-4 select-window -t :=4
      bind-key -T root M-5 select-window -t :=5
      bind-key -T root M-6 select-window -t :=6
      bind-key -T root M-7 select-window -t :=7
      bind-key -T root M-8 select-window -t :=8
      bind-key -T root M-9 select-window -t :=9

      # pane
      bind-key -T root M-h if-shell "[[ 'nvim' == $(tmux display-message -p '#{pane_current_command}') ]]" "send-keys M-h" "select-pane -L"
      bind-key -T root M-j if-shell "[[ 'nvim' == $(tmux display-message -p '#{pane_current_command}') ]]" "send-keys M-j" "select-pane -D"
      bind-key -T root M-k if-shell "[[ 'nvim' == $(tmux display-message -p '#{pane_current_command}') ]]" "send-keys M-k" "select-pane -U"
      bind-key -T root M-l if-shell "[[ 'nvim' == $(tmux display-message -p '#{pane_current_command}') ]]" "send-keys M-l" "select-pane -R"
      bind-key -T root M-s split-window -v -c "#{pane_current_path}"
      bind-key -T root M-v split-window -h -c "#{pane_current_path}"
      bind-key -T root M-z resize-pane -Z

      # copy-mode
      # bind-key -T root M-/ command-prompt -p "(search up)" "send -X search-backward \"%%%\""

      # popup
      bind-key -T root M-o display-popup -w 80% -h 80%
    '';

    plugins = with pkgs; [
      tmuxPlugins.resurrect
      {
        plugin = tmuxPlugins.continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
        '';
      }
    ];
  };

  # programs.fish = {
  #   enable = true;
  #   plugins = [
  #     {
  #       name="foreign-env";
  #       src = pkgs.fetchFromGitHub {
  #         owner = "oh-my-fish";
  #         repo = "plugin-foreign-env";
  #         rev = "dddd9213272a0ab848d474d0cbde12ad034e65bc";
  #         sha256 = "00xqlyl3lffc5l0viin1nyp819wf81fncqyz87jx8ljjdhilmgbs";
  #       };
  #     }
  #   ];
  #   shellInit = ''
  #     if test -e /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
  #       fenv source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
  #     end
  #   '';
  # };
}
