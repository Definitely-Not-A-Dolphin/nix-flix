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
          dark-black = "0d0d0dff";
          black = "1a1a1aff";
          white = "eaeaeaff";
          light-blue = "00aaffff";
          blue = "0080ffff";
        in
        {
          border = dark-black;
          background = black;
          text = white;
          match = light-blue;
          message = blue;
          input = blue;
          selection-match = blue;
          selection-text = blue;
          selection = black;
        };
    };
  };
}
