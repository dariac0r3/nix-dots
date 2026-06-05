### Some other info that you may need

This config is by no means comprehensive, it's very much unreadable. I tried to make it as reproducible as I could.

The code is self-documenting, and needs no comments /j

Notes for the different configs:
1. Plasma
   - This is almost as default as you could go, but beware, you need to install Papirus Icons to make it work.
   - uncomment `./modules/desktop/plasma-home.nix` in home.nix
   - uncomment `./modules/desktop/plasma.nix` in configuration.nix
   
2. XFCE
   - I personally don't think this config is daily-driveable and I wouldn't use it day to day.
   - It's pretty ok, just remember to comment the line `decorations = "none";` in the alacritty config if you're gonna use it.
   - uncomment `./modules/desktop/xfce-home.nix` in home.nix
   - uncomment `./modules/desktop/xfce.nix` in configuration.nix
     
3. Niri
   - This is the most usable config out of the three, though it may lack some things that I just simply didn't think of implementing.
   - uncomment `./modules/desktop/niri-home.nix` in home.nix
   - uncomment `./modules/desktop/noctalia.nix` in home.nix
   - uncomment `./modules/desktop/niri.nix` in configuration.nix


  ### ALSO, you can safely remove the configuration that you will not use from flake inputs and outputs,<br> eg. if you only want niri, you can remove plasma-manager from the flake inputs and outputs.<br> Make sure to also remove it from shared modules for home-manager.
  just read the compiler errors if you dont know what to do...
