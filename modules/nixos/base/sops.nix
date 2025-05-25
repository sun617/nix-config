{
  sops = {
    defaultSopsFile = ../../secrets/system/secrets.yaml;
    age = {
      keyFile = "/var/lib/sops-nix/key.txt";
      generateKey = true;
    };
  };
}
