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
import XMonad.Util.Hacks
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import qualified Colors
import qualified XMonad.StackSet as W

myLayout = avoidStruts $ spacingWithEdge 4 $ (tiled ||| Mirror tiled ||| Full)
  where
    tiled   = Tall nmaster delta ratio
    nmaster = 1
    ratio   = 1/2
    delta   = 3/100

myWorkspaces = ["1:main", "2:dev", "3:web", "4:music", "5:social"]

myModMask = mod4Mask

myKeys = [ ((myModMask, xK_r     ), spawn "xmonad --recompile; killall xmobar; xmonad --restart")
         , ((myModMask, xK_s     ), spawn "maim -s | xclip -selection clipboard -t image/png"   )
         , ((myModMask, xK_Return), spawn "alacritty"       )
         , ((myModMask, xK_p     ), spawn "rofi -show combi")
         , ((myModMask, xK_P     ), spawn "pomodoro 25 5")
         , ((myModMask, xK_q     ), kill                    )
         ]  

myStartupHook = do
  spawnOn "web"    "brave"
  spawnOn "dev"    "alacritty"
  spawnOn "music"  "spotify"
  spawnOn "social" "telegram-desktop"  
  
main = do
  xmproc <- spawnPipe "xmobar ~/.config/xmobar/xmobarrc"

  xmonad $ docks $ ewmhFullscreen $ ewmh def 
    { borderWidth        = 2 
    , terminal           = "alacritty"
    , layoutHook         = myLayout
    , focusedBorderColor = Colors.lavender
    , normalBorderColor  = Colors.base
    , modMask            = myModMask
    , workspaces         = myWorkspaces 
    , startupHook        = myStartupHook
    , manageHook         = manageSpawn <+> manageHook def
    , logHook            = dynamicLogWithPP $ myXmobarPP { ppOutput = hPutStrLn xmproc } 
    } `additionalKeys` myKeys

myXmobarPP = def
    { ppCurrent         = xmobarColor Colors.yellow "" . wrap "" "*"
    , ppVisible         = xmobarColor Colors.yellow "" . wrap "" "-"    
    , ppHidden          = xmobarColor Colors.surface2 ""
    , ppHiddenNoWindows = xmobarColor Colors.surface2 ""
    , ppOrder           = \[ws, _, _] -> [ws]
    }

