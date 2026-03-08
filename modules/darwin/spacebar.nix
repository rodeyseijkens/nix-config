{pkgs, ...}: {
  services.spacebar = {
    enable = true;
    package = pkgs.spacebar;
    config = {
      position = "top";
      display = "main";
      height = 38;
      title = "off";
      spaces = "on";
      clock = "on";
      power = "on";
      padding_left = 20;
      padding_right = 20;
      spacing_left = 25;
      spacing_right = 15;
      text_font = ''"Maple Mono NF CN:Regular:12.0"'';
      icon_font = ''"Maple Mono NF CN:Regular:12.0"'';
      background_color = "0xff3C3836";
      foreground_color = "0xffFBF1C7";
      power_icon_color = "0xffD79921";
      battery_icon_color = "0xff689D6A";
      dnd_icon_color = "0xffFBF1C7";
      clock_icon_color = "0xffFBF1C7";
      power_icon_strip = " ";
      space_icon = "•";
      space_icon_strip = "I II III IV V VI VII VIII IX X";
      spaces_for_all_displays = "on";
      display_separator = "on";
      display_separator_icon = "";
      space_icon_color = "0xffD65D0E";
      space_icon_color_secondary = "0xff78c4d4";
      space_icon_color_tertiary = "0xfffff9b0";
      clock_icon = "";
      dnd_icon = "";
      clock_format = ''"%d/%m %R"'';
      right_shell = "off";
      right_shell_icon = "";
      right_shell_command = "whoami";
    };
  };
}
