{vars, ...}: {
  xdg.configFile."aerospace/aerospace.toml".text =
    /*
    toml
    */
    ''
      start-at-login = true
      after-login-command = []
      after-startup-command = [
        'exec-and-forget /opt/homebrew/bin/borders width=6.0 inactive_color=0x00000000 active_color=0xff98871a'
        # 'exec-and-forget /opt/homebrew/bin/sketchybar'
      ]

      key-mapping.preset = 'qwerty'

      enable-normalization-flatten-containers = true
      enable-normalization-opposite-orientation-for-nested-containers = true

      accordion-padding = 12

      default-root-container-layout = 'tiles'
      default-root-container-orientation = 'auto'

      # exec-on-workspace-change = [
      #   '/bin/bash',
      #   '-c',
      #   'sketchybar --trigger aerospace_workspace_change FOCUSED_WORKSPACE=$AEROSPACE_FOCUSED_WORKSPACE'
      # ]

      # on-focus-changed = [
      #   'exec-and-forget sketchybar --trigger front_app_switched',
      #   'exec-and-forget sketchybar --trigger update_windows'
      # ]

      [gaps]
      outer.bottom =     [{monitor.'^built-in retina display$' = 10 }, 10]
      outer.top =        [{monitor.'^built-in retina display$' = 15 }, 52]
      outer.left =       13
      outer.right =      13
      inner.horizontal = 10
      inner.vertical =   10

      [mode.main.binding]
      # cmd-h = [] # Disable "hide application"
      cmd-alt-h = [] # Disable "hide others"

      cmd-enter = 'exec-and-forget open -n "/Users/${vars.username}/Applications/Home Manager Trampolines/kitty.app"'
      cmd-e = 'exec-and-forget open -n "/Applications/Marta.app"'
      cmd-shift-e = 'exec-and-forget open -n "/Applications/QSpace Pro.app"'
      cmd-b = 'exec-and-forget open -n "/Users/${vars.username}/Applications/Home Manager Trampolines/Firefox.app"'

      alt-semicolon = [
        'mode service'
        # 'exec-and-forget sketchybar --trigger send_message MESSAGE="Aerospace in Service Mode" HOLD="true"',
      ]

      cmd-h = 'focus --boundaries all-monitors-outer-frame --boundaries-action stop left'
      cmd-j = 'focus --boundaries all-monitors-outer-frame --boundaries-action stop down'
      cmd-k = 'focus --boundaries all-monitors-outer-frame --boundaries-action stop up'
      cmd-l = 'focus --boundaries all-monitors-outer-frame --boundaries-action stop right'
      cmd-left = 'focus --boundaries all-monitors-outer-frame --boundaries-action stop left'
      cmd-down = 'focus --boundaries all-monitors-outer-frame --boundaries-action stop down'
      cmd-up = 'focus --boundaries all-monitors-outer-frame --boundaries-action stop up'
      cmd-right = 'focus --boundaries all-monitors-outer-frame --boundaries-action stop right'

      cmd-shift-h = 'move left'
      cmd-shift-j = 'move down'
      cmd-shift-k = 'move up'
      cmd-shift-l = 'move right'
      cmd-shift-left = 'move left'
      cmd-shift-down = 'move down'
      cmd-shift-up = 'move up'
      cmd-shift-right = 'move right'

      cmd-1 = 'workspace 1' # --auto-back-and-forth is optional
      cmd-2 = 'workspace 2'
      cmd-3 = 'workspace 3'
      cmd-4 = 'workspace 4'
      cmd-5 = 'workspace 5'
      cmd-6 = 'workspace 6'
      cmd-7 = 'workspace 7'
      cmd-8 = 'workspace 8'
      cmd-9 = 'workspace 9'
      cmd-0 = 'workspace 10'

      cmd-shift-1 = 'move-node-to-workspace 1'
      cmd-shift-2 = 'move-node-to-workspace 2'
      cmd-shift-3 = 'move-node-to-workspace 3'
      cmd-shift-4 = 'move-node-to-workspace 4'
      cmd-shift-5 = 'move-node-to-workspace 5'
      cmd-shift-6 = 'move-node-to-workspace 6'
      cmd-shift-7 = 'move-node-to-workspace 7'
      cmd-shift-8 = 'move-node-to-workspace 8'
      cmd-shift-9 = 'move-node-to-workspace 9'
      cmd-shift-0 = 'move-node-to-workspace 10'

      # alt-m = 'exec-and-forget sketchybar --trigger aerospace_switch'

      [mode.service.binding]
      esc = [
        'reload-config',
        'mode main',
        # 'exec-and-forget sketchybar --reload',
        'exec-and-forget /opt/homebrew/bin/borders width=6.0 inactive_color=0x00000000 active_color=0xff98871a',
        # 'exec-and-forget sleep 0.5 && sketchybar --trigger send_message MESSAGE="Aerospace Reloaded"',
      ]

      t = [
        'layout tiles vertical horizontal',
      ]
      a = [
        'layout accordion vertical horizontal',
      ]
      f = [
        'layout floating tiling',
      ]
      backspace = ['close-all-windows-but-current', 'mode main']

      minus = 'resize smart -50'
      equal = 'resize smart +50'

      [[on-window-detected]]
      if.app-id = 'net.kovidgoyal.kitty'
      check-further-callbacks = true
      run = ['layout tiling', 'move-node-to-workspace 10']

      [[on-window-detected]]
      if.app-id = 'org.mozilla.firefox'
      check-further-callbacks = true
      run = ['layout tiling', 'move-node-to-workspace 9']

      [[on-window-detected]]
      if.app-id = 'org.mozilla.firefox'
      check-further-callbacks = true
      if.window-title-regex-substring = 'picture-in-picture'
      run = ['layout floating']

      [[on-window-detected]]
      if.app-id = 'com.apple.Safari'
      check-further-callbacks = true
      if.window-title-regex-substring = 'picture-in-picture'
      run = ['layout floating']

      [[on-window-detected]]
      if.app-id = 'com.apple.finder'
      check-further-callbacks = true
      run = ['layout tiling', 'move-node-to-workspace 4']

      [[on-window-detected]]
      if.app-id = 'org.yanex.marta'
      check-further-callbacks = true
      run = ['layout tiling', 'move-node-to-workspace 4']

      [[on-window-detected]]
      if.app-id = 'com.jinghaoshe.qspace.pro'
      check-further-callbacks = true
      run = ['layout tiling', 'move-node-to-workspace 4']

      [[on-window-detected]]
      if.app-id = 'com.microsoft.VSCode'
      check-further-callbacks = true
      run = ['layout tiling', 'move-node-to-workspace 2']

      [[on-window-detected]]
      if.app-id = 'com.google.Chrome'
      check-further-callbacks = true
      run = ['layout tiling', 'move-node-to-workspace 1']
    '';
}
