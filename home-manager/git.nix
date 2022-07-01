{
  programs.git = {
    enable = true;
    userName = "Hongri Cui";
    userEmail = "hongri.cui@gmail.com";
    extraConfig = {
      pull.rebase = false;
    };
  };

  programs.gh.enable = true;

  programs.fish.shellAbbrs = {
    ga = "git add";
    gb = "bit branch";
    gcf = "git config";
    gc = "git checkout";
    gcl = "git clone";
    gcm = "git commit";
    gd = "git diff";
    gdt = "git difftool";
    gf = "git fetch";
    gl = "git log";
    gm = "git merge";
    gP = "git pull";
    gp = "git push";
    grb = "git rebase";
    grm = "git remote";
    grs = "git reset";
    gra = "git remote add upstream";
    gs = "git status";
    gsp = "git stash push";
    gsP = "git stash pop";
    gt = "git tag";
  };
}
