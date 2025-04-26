{
  services.nginx = {
    enable = true;

    recommendedTlsSettings = true;
    recommendedProxySettings = true;

    virtualHosts = {
      "open-webui.qqnana.net" = {
        forceSSL = true;

        sslCertificate = "/etc/nixos/nginx/ssl/certs/qqnana.net.crt";
        sslCertificateKey = "/etc/nixos/nginx/ssl/private/qqnana.net.key";

        locations."/" = {
          proxyPass = "http://qqnana.net:15000";
          proxyWebsockets = true;
        };
      };
    };
  };

  # https://github.com/NixOS/nixpkgs/issues/309623
  # security.pki.certificateFiles = [
  #   "/etc/nixos/nginx/ssl/certs/server.crt"
  # ];
  security.pki.certificates = [
    ''
    qqnana.net
    -----BEGIN CERTIFICATE-----
    MIIDuDCCAqCgAwIBAgIUKupuJ61VSRZMfXKrcmKFD/cr5qMwDQYJKoZIhvcNAQEL
    BQAwWTELMAkGA1UEBhMCSlAxEDAOBgNVBAgMB1NhaXRhbWExEjAQBgNVBAcMCUth
    d2FndWNoaTEPMA0GA1UECgwGUVFuYW5hMRMwEQYDVQQDDApxcW5hbmEubmV0MB4X
    DTI1MDQyMTAwMzkzMFoXDTI2MDQyMTAwMzkzMFowWTELMAkGA1UEBhMCSlAxEDAO
    BgNVBAgMB1NhaXRhbWExEjAQBgNVBAcMCUthd2FndWNoaTEPMA0GA1UECgwGUVFu
    YW5hMRMwEQYDVQQDDApxcW5hbmEubmV0MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8A
    MIIBCgKCAQEAqR1N7VtCItwPn9J4lg6rsbkovQJd9JPn32jnnPnY1stuyE7aSTz0
    jKl+IplGil/frCum5l8dQsj+KS2ZzqRrfErTU+FRYfk/BMlxE9ky+lCzD9svotAh
    BhE/TJhIIOh3+Uq52tHpWe0Rk3wQkCI8tt95fCQaweKJwO2WrJcT6zLVrbAgRN5G
    jhZv5Y+yv3pJ4yCa3p7SlsHk612P3DX1m1CC6qPAXXJAab9BB/FhKOCQFyVMC8Sx
    OcymU3u3kB1iawhnuNzqYOOgPsTeM3mqU/gz/hoMbccLfZ+w7Hrt1G1cbiiO3w0a
    +T9Bawz4HGpxW+qL46ehAi/+YVTP7NP59QIDAQABo3gwdjAdBgNVHQ4EFgQUauAz
    rfGi4gffmf+20EbqHCD+r+0wHwYDVR0jBBgwFoAUauAzrfGi4gffmf+20EbqHCD+
    r+0wDwYDVR0TAQH/BAUwAwEB/zAjBgNVHREEHDAaggpxcW5hbmEubmV0ggwqLnFx
    bmFuYS5uZXQwDQYJKoZIhvcNAQELBQADggEBAGbA90IqltP4Y28LcdhlSyiCHvKt
    cJntMoxkGsOGTYIMdgFiid35DbMR6DWKjZg4XH0Bnrvaz5mWQemyFySf3oUd+1+D
    GptMR96YhuLklJfDqrd2UuSyeIso8H0fQBRakr/h+0hUNCks3EAc+PFOMQLt79yR
    PJAK50VcXD2nAloIdSr8021VNryLW9AIJuIMex3enqEpCopJLmmYYwKKgaXB80JK
    8JcGDKDjer2xdfSv8iuJG8fsMVJUHSoqOORgyaYc/ZUIKGJ3Rhp17c1tnCkDsN3U
    mx95hHzXlEYe2I/cq06lzXkCvi34Jr3EmhZEpw0GmZRZYFFuXNnvtJh2v58=
    -----END CERTIFICATE-----
    ''
    ''
    -----BEGIN CERTIFICATE-----
    MIIDuDCCAqCgAwIBAgIUM2QeEtLoDtMUwQirRAZksHZVWIMwDQYJKoZIhvcNAQEL
    BQAwWjELMAkGA1UEBhMCSlAxDjAMBgNVBAgMBVRva3lvMRIwEAYDVQQHDAlTaGlu
    YWdhd2ExEzARBgNVBAoMClJha3N1bCBkZXYxEjAQBgNVBAMMCXJha3N1bC5tZTAe
    Fw0yNTA0MjEwMTUyMjRaFw0yNjA0MjEwMTUyMjRaMFoxCzAJBgNVBAYTAkpQMQ4w
    DAYDVQQIDAVUb2t5bzESMBAGA1UEBwwJU2hpbmFnYXdhMRMwEQYDVQQKDApSYWtz
    dWwgZGV2MRIwEAYDVQQDDAlyYWtzdWwubWUwggEiMA0GCSqGSIb3DQEBAQUAA4IB
    DwAwggEKAoIBAQDSQ/6qZTp4URhyETn24Ci5Ky1qEvC+dQWWYJQ4TGtfmXMfM9Ah
    dKftprHc50YKccaSdgmncnwbQ0EzTOH4B0281yJ8EUePsvIAqckDKr4PHYa2+7V+
    nakJUYwrCSmou9xxYG8KULG54J5nSmoFRglwrrZmitmPJHbe7U38QG9250YGXwUr
    n8YYTTOK1r5RyaDBc9Jz53LOKQnNtvkQTGDBHmhCM4MyAfhuoYOCjetrhD3ZN+eY
    L/u5o6LEckk04mUlsq75hy9uVHOneEtg8P+nvSx1h5HsnY0V2cLbAyI39W5zMKHW
    22qBH61wl3V451IlBOWtOQY/4h5Tbd28EhbbAgMBAAGjdjB0MB0GA1UdDgQWBBRO
    RjPTFH2o4yujtNoR9BPMQHBDOjAfBgNVHSMEGDAWgBRORjPTFH2o4yujtNoR9BPM
    QHBDOjAPBgNVHRMBAf8EBTADAQH/MCEGA1UdEQQaMBiCCXJha3N1bC5tZYILKi5y
    YWtzdWwubWUwDQYJKoZIhvcNAQELBQADggEBALvgdwiBNiM26/K/Dy8npUN9sPT/
    K6ICoUiFp42vUhnoKEI/SGQ9geMLFde0cnEiGdmYUFjRLZZhqAgbbMSQHgyG+vxg
    1FCnyJrhH0oiQcNO47tyXsdyvF1AXhW+Ks2EdZA8tRERhD5U2dERAqRUzOLc8DQi
    HzbedK5TZCFO9ONmV/uO9q5ZgMzAV3XoF9rIlqnmZoQ+W+cwVRZUO2i2ZbsGdci8
    A4PZOwwfDsbopnM+SA4YUNKVlsr4xEuw5OF+Lc8IKzB42oDEXTx2nUwE2DfeYeJ8
    Kf60LN5lsjaXiJ/nfi3EzXEFD2iPI1oxaWC5BpslNcFfMzTUCFifsHuRD2s=
    -----END CERTIFICATE-----
    ''
  ];
}
