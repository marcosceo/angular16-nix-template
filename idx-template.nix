{ pkgs, ... }: {
  packages = [ pkgs.nodejs_20 ];
  bootstrap = ''
    npx --prefer-offline -y @angular/cli@16.2.16 new --skip-git --defaults --skip-install --directory "$WS_NAME" "$WS_NAME"
    mkdir "$WS_NAME"/.idx
    cp ${./dev.nix} "$WS_NAME"/.idx/dev.nix && chmod +w "$WS_NAME"/.idx/dev.nix
    mv "$WS_NAME" "$out"
    (cd "$out"; npm install --package-lock-only --ignore-scripts)
  '';
}
