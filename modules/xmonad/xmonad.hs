import XMonad 
import XMonad.Util.EZConfig
import XMonad.Operations
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import XMonad.Util.Loggers
import XMonad.Actions.SpawnOn
import XMonad.Layout.Spacing
import XMonad.Util.Run
import XMonad.Hooks.ManageDocks
import qualified XMonad.StackSet as W

myLayout = avoidStruts (tiled ||| Mirror tiled ||| Full)
  where
    tiled   = Tall nmaster delta ratio
    nmaster = 1
    ratio   = 1/2
    delta   = 3/100

myWorkspaces = ["main", "dev", "web", "music", "social", "..."]

myKeys = [ ((mod1Mask, xK_q), spawn "xmonad --recompile; killall xmobar; xmonad --restart")
         , ((mod1Mask, xK_p), spawn "rofi -show run")
         ]  

myStartupHook = do
  spawnOn "music"  "spotify"
  spawnOn "web"    "firefox"
  spawnOn "dev"    "alacritty && tmux attach"
  spawnOn "social" "telegram-desktop"

main = do
  xmproc <- spawnPipe "xmobar ~/.config/xmobar/xmobarrc"

  xmonad $ docks $ def 
    { borderWidth        = 2 
    , terminal           = "alacritty"
    , layoutHook         = spacingWithEdge 8 myLayout
    , focusedBorderColor = "#959595"
    , normalBorderColor  = "#3c3c3c"
    , workspaces         = myWorkspaces 
		, startupHook        = myStartupHook
		, manageHook         = manageSpawn <+> manageHook def
    , logHook            = dynamicLogWithPP $ myXmobarPP { ppOutput = hPutStrLn xmproc } 
    } `additionalKeys` myKeys

myXmobarPP = def
    { ppCurrent         = xmobarColor color1 "" . wrap "<fn=1>(" ")</fn>"
    , ppHidden          = xmobarColor color3 ""
    , ppHiddenNoWindows = xmobarColor color3 ""
    , ppVisible         = xmobarColor color2 "" . wrap "<fn=1>" "</fn>"
    , ppOrder           = \[ws, _, _] -> [ws]
    }

color1 = "#A6A6A6"
color2 = "#737373"
color3 = "#404040"
color4 = "#262626"
color5 = "#0D0D0D"
