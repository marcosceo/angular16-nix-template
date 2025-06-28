{ pkgs, ... }: {
  packages = [ pkgs.nodejs_22 ];
  bootstrap = ''
    npx --prefer-offline -y @angular/cli@19.2.15 new --skip-git --defaults --skip-install --directory "$WS_NAME" "$WS_NAME"
    mkdir "$WS_NAME"/.idx
    cp ${./dev.nix} "$WS_NAME"/.idx/dev.nix && chmod +w "$WS_NAME"/.idx/dev.nix
    mv "$WS_NAME" "$out"
    (cd "$out"; npm install --package-lock-only --ignore-scripts)
  '';
}
