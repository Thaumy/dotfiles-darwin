{ inputs, config, pkgs, ... }:
let
  homeDir = config.home.homeDirectory;
  mkSymlink = config.lib.file.mkOutOfStoreSymlink;

  nvim-web-devicons = pkgs.vimUtils.buildVimPlugin {
    pname = "nvim-web-devicons";
    version = "2025-04-24";
    src = pkgs.fetchFromGitHub {
      owner = "Thaumy";
      repo = "nvim-web-devicons";
      rev = "2847eb1c0ab861c65da205e31a94bcc80e65d70d";
      hash = "sha256-puA/8O8VAF/D5D2OQ4KWAwoe2JV6o38aOgarUi98PVM=";
    };
  };

  git-messenger-vim = pkgs.vimUtils.buildVimPlugin {
    pname = "git-messenger.vim";
    version = "2025-01-23";
    src = pkgs.fetchFromGitHub {
      owner = "Thaumy";
      repo = "git-messenger.vim";
      rev = "566545a19c4a5b974c4dedce7fbbcf88292250a7";
      hash = "sha256-6WG1JOr16qL6StSSinpjvaRqb6OmktlGOGLZXej6AT0=";
    };
  };

  colorful-menu-nvim = pkgs.vimUtils.buildVimPlugin {
    pname = "colorful-menu.nvim";
    version = "2025-04-24";
    src = pkgs.fetchFromGitHub {
      owner = "Thaumy";
      repo = "colorful-menu.nvim";
      rev = "baed2c5c4b6a534276cba753e1cc9dd56bb1a42c";
      hash = "sha256-VnvsF8YrvWSSykkK5rIeTtqI8ndWk2CNFPspokTDy+4=";
    };
    doCheck = false;
  };
in
{
  nixpkgs.overlays = [ inputs.nvim-nightly.overlays.default ];

  programs.neovim = {
    enable = true;

    defaultEditor = true;

    plugins = with pkgs.vimPlugins; [
      # infrastructures
      nui-nvim # ui components
      lazy-nvim # lazy plugin loader
      nvim-bufdel # better buffer delete
      plenary-nvim # common utils
      promise-async # promise & async

      # colorizers or signs
      nvim-ufo # code block folding, [deps: promise-async]
      gitsigns-nvim # gutter git signs
      vim-illuminate # similar word hl
      catppuccin-nvim # color scheme
      nvim-web-devicons # icons
      nvim-colorizer-lua # color text hl
      todo-comments-nvim # TODOs hl, [deps: plenary-nvim]
      indent-blankline-nvim # indent lines
      rainbow-delimiters-nvim # colorful delimiters

      # user interfaces
      nvim-bqf # better quickfix
      fidget-nvim # notifications
      lualine-nvim # status line
      neo-tree-nvim # file explorer, [deps: plenary-nvim, nvim-web-devicons, nui-nvim]
      telescope-nvim # fuzzy finder
      bufferline-nvim # buffer tabs
      git-messenger-vim # git blame popup
      colorful-menu-nvim # hl for code completion menu
      actions-preview-nvim # code actions preview
      markdown-preview-nvim # markdown renderer

      # analyzers
      nvim-cmp # code completion, [deps: cmp-path, cmp-buffer, cmp-cmdline, cmp-nvim-lsp, luasnip, nvim-lspconfig]
      cmp-path # path completion source
      cmp-buffer # buffer completion source
      Ionide-vim # F# lsp support
      cmp_luasnip # luasnip completion source
      cmp-cmdline # cmdline completion source
      cmp-nvim-lsp # lsp completion source
      cmp-nvim-lua # nvim lua APIs completion source
      nvim-lspconfig # lsp support
      nvim-treesitter.withAllGrammars # language parser

      # input helpers
      luasnip # snippet
      neoformat # formatter
      crates-nvim # crate.io cmp
      avante-nvim # AI code suggestions
      comment-nvim # better comment support
      autoclose-nvim # auto close pairs and brackets
    ];

    extraPackages = with pkgs; [
      nil # Nix
      ruff # Python fmt
      sqls # SQL
      deno # Deno
      shfmt # Shell fmt
      gopls # Go
      taplo # TOML
      biome # Web
      pyright # Python
      lemminx # XML
      fantomas # F# fmt
      marksman # Markdown
      tinymist # Typst
      nixpkgs-fmt # Nix fmt
      rust-analyzer # Rust
      fsautocomplete # F#
      omnisharp-roslyn # C#
      vue-language-server # Vue
      jdt-language-server # Java
      lua-language-server # Lua
      bash-language-server # Bash
      yaml-language-server # YAML
      kotlin-language-server # Kotlin
      haskell-language-server # Haskell
    ];
  };

  home.file = {
    ".config/nvim".source = mkSymlink "${homeDir}/cfg/neovim";

    ".config/libnvimcfg.so".source = "${inputs.libnvimcfg.packages.${pkgs.system}.default}/lib/libnvimcfg.so";

    ".config/nvim-plugins".source =
      let
        packDir = pkgs.vimUtils.packDir config.programs.neovim.finalPackage.passthru.packpathDirs;
      in
      mkSymlink "${packDir}/pack/myNeovimPackages/start";

    ".config/nvim-treesitter-parsers".source =
      let
        nvim-treesitter-parsers = pkgs.symlinkJoin {
          name = "nvim-treesitter-parsers";
          paths = pkgs.vimPlugins.nvim-treesitter.withAllGrammars.dependencies;
        };
      in
      mkSymlink nvim-treesitter-parsers;
  };

  home.packages = [
    (pkgs.symlinkJoin {
      name = "nvim-alias";
      paths = [ config.programs.neovim.finalPackage ];
      postBuild = "ln -s $out/bin/nvim $out/bin/v";
    })
  ];
}
