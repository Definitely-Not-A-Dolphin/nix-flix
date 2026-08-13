{ ... }:
{
  home-manager.users.killioiden = {
    programs.fastfetch = {
      enable = true;
      settings = {
        logo = {
          type = "auto";
          height = 20;
          padding = {
            top = 1;
            bottom = 1;
          };
        };
        display = {
          separator = "";
          percent = {
            type = 1;
            width = 3;
          };
        };
        modules = [
          "break"
          {
            type = "custom";
            format = "{##727272}{{";
          }
          {
            type = "custom";
            format = "  {##575757}system = {##727272}{{";
          }
          {
            type = "os";
            key = "    {##7E97AB}os         {##727272}= ";
            format = "{##88afa2}\"{name} {version} ({codename})\"{##727272};";
          }
          {
            type = "os";
            key = "    {##7E97AB}arch       {##727272}= ";
            format = "{##88afa2}\"{arch}\"{##727272};";
          }
          {
            type = "locale";
            key = "    {##7E97AB}locale     {##727272}= ";
            format = "{##88afa2}\"{result}\"{##727272};";
          }
          {
            type = "uptime";
            key = "    {##7E97AB}uptime     {##727272}= ";
            format = "{##88afa2}\"{days} days, {hours} hours, {minutes} mins\"{##727272};";
          }
          {
            type = "custom";
            format = "  {##727272}}";
          }
          "break"
          {
            type = "cpu";
            key = "  {##575757}hardware.{##7E97AB}cpu      {##727272}= ";
            format = "{##88afa2}\"{name} ({cores-logical}) @ {freq-max}\"{##727272};";
          }
          {
            type = "gpu";
            key = "  {##575757}hardware.{##7E97AB}gpu      {##727272}= ";
            format = "{##88afa2}\"{name}\"{##727272};";
          }
          {
            type = "memory";
            key = "  {##575757}hardware.{##7E97AB}ram      {##727272}= ";
            format = "{##88afa2}\"{used<10} / {total>9}\"{##727272};  {##575757}# {percentage}";
          }
          {
            type = "swap";
            key = "  {##575757}hardware.{##7E97AB}swap     {##727272}= ";
            format = "{##88afa2}\"{used<10} / {total>9}\"{##727272};  {##575757}# {percentage}";
          }
          {
            type = "disk";
            folders = "/";
            key = "  {##575757}hardware.{##7E97AB}disk0    {##727272}= ";
            format = "{##88afa2}\"{size-used<10} / {size-total>9}\"{##727272};  {##575757}# {size-percentage}";
          }
          {
            type = "disk";
            folders = "/srv/media";
            key = "  {##575757}hardware.{##7E97AB}disk1    {##727272}= ";
            format = "{##88afa2}\"{size-used<10} / {size-total>9}\"{##727272};  {##575757}# {size-percentage}";
          }
          "break"
          {
            type = "de";
            key = "  {##575757}desktop.{##7E97AB}de        {##727272}= ";
            format = "{##88afa2}\"{pretty-name} {version}\"{##727272};";
          }
          {
            type = "wm";
            key = "  {##575757}desktop.{##7E97AB}wm        {##727272}= ";
            format = "{##88afa2}\"{pretty-name} ({protocol-name})\"{##727272};";
          }
          {
            type = "display";
            key = "  {##575757}desktop.{##7E97AB}display   {##727272}= ";
            format = "{##88afa2}\"{width}x{height} @ {refresh-rate}Hz\"{##727272};";
          }
          {
            type = "localip";
            key = "  {##575757}desktop.{##7E97AB}localIp   {##727272}= ";
            format = "{##88afa2}\"{ipv4}\"{##727272};";
          }
          "break"
          {
            type = "shell";
            key = "  {##575757}terminal.{##7E97AB}shell    {##727272}= ";
            format = "{##88afa2}\"{pretty-name} {version}\"{##727272};";
          }
          {
            type = "terminal";
            key = "  {##575757}terminal.{##7E97AB}term     {##727272}= ";
            format = "{##88afa2}\"{pretty-name}\"{##727272};";
          }
          {
            type = "packages";
            key = "  {##575757}terminal.{##7E97AB}packages {##727272}= ";
            format = "{##727272}[ {##88afa2}\"{nix-system} nix-system\" \"{nix-user} nix-user\"{##727272} ];";
          }
          "break"
          {
            type = "command";
            text = "deno -v | sed 's/deno //'";
            key = "  {##575757}dev.{##7E97AB}node          {##727272}= ";
            format = "{##88afa2}\"{result}\"{##727272};";
          }
          {
            type = "command";
            text = "rustc --version | cut -d' ' -f2";
            key = "  {##575757}dev.{##7E97AB}rust          {##727272}= ";
            format = "{##88afa2}\"{result}\"{##727272};";
          }
          {
            type = "command";
            text = "nix --version | cut -d' ' -f3";
            key = "  {##575757}dev.{##7E97AB}nix           {##727272}= ";
            format = "{##88afa2}\"{result}\"{##727272};";
          }
          {
            type = "command";
            text = "git --version | cut -d' ' -f3";
            key = "  {##575757}dev.{##7E97AB}git           {##727272}= ";
            format = "{##88afa2}\"{result}\"{##727272};";
          }
          {
            type = "custom";
            format = "{##727272}}";
          }
          "break"
        ];
      };
    };
  };
}
