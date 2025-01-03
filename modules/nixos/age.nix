{vars, ...}: {
  age = {
    identityPaths = ["/home/${vars.username}/.ssh/id_personal"];

    secrets = {
      # TODO: Add secrets
    };
  };
}
