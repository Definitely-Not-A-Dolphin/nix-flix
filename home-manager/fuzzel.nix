{ ... }:
{
  home-manager.users.killioiden.programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "JetBrains Mono";
        use-bold = true;
        prompt = "|=>";
      };
      colors =
        let
          colors = {
            dark-black = "0d0d0dff";
            black = "1a1a1aff";
            gray = "808080ff";
            white = "eaeaeaff";
            light-blue = "00aaffff";
            blue = "0080ffff";
          };
        in
        {
          border = colors.dark-black;
          background = colors.black;
          text = colors.white;
          match = colors.light-blue;
          message = colors.blue;
          input = colors.blue;
          selection-match = colors.blue;
          selection-text = colors.blue;
          selection = colors.black;
        };
    };

  };
}
