{ name }:
let
  root = toString ./.;
  ncharacters = 1;
  prefix = builtins.substring 0 ncharacters name;
  path = "${root}/data/${prefix}/${name}.json";
  json =
    if builtins.pathExists path then
      builtins.fromJSON (builtins.readFile path)
    else
      throw "Metadata of ${name} not found";
in
  json
