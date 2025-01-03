{
  vars,
  hostname,
  ...
}: {
  networking = {
    hostName = "${hostname}";
    enableIPv6 = false;
    nameservers = [
      "1.1.1.1"
      "8.8.8.8"
    ];
  };
}
