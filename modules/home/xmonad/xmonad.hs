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
import Control.Monad
import XMonad.Actions.MouseResize
import XMonad.ManageHook
import XMonad.Util.SpawnOnce
import XMonad.Layout.NoBorders
import XMonad.Layout.IndependentScreens
import XMonad.Hooks.ManageHelpers
import qualified XMonad.StackSet as W
import XMonad.Actions.OnScreen as O
import XMonad.Util.SessionStart (doOnce)

import qualified Colors
import qualified Options

myLayout = mouseResize $ avoidStruts $ spacingWithEdge 4 $ (tiled ||| Mirror tiled ||| Full)
  where
    tiled   = Tall nmaster delta ratio
    nmaster = 1
    ratio   = 1/2
    delta   = 3/100

ws1 = "1"
ws2 = "2"
ws3 = "3"
ws4 = "4"
ws5 = "5"
ws6 = "6"
ws7 = "7"
ws8 = "8"
ws9 = "9"

myWorkspaces = [ws1, ws2, ws3, ws4, ws5, ws6, ws7, ws8, ws9]

myKeys = [ ("M-r"       , spawn "xmonad --recompile && xmonad --restart") 
         , ("M-s"       , spawn "maim -s | xclip -selection clipboard -t image/png")
         , ("M-<Return>", spawn Options.terminal)
         , ("M-p"       , spawn "rofi -show combi")
         , ("M-S-p"     , spawn "pomodoro 25 5")
         , ("M-<Left>"  , sendMessage Shrink)
         , ("M-<Right>" , sendMessage Expand)
         , ("M-<Up>"    , windows W.focusUp)
         , ("M-<Down>"  , windows W.focusDown)
         , ("M-q"       , kill)
         , ("M-S-<Up>"  , windows W.swapUp)
         , ("M-S-<Down>", windows W.swapDown)
         ]

customCenterFloat :: W.RationalRect -> ManageHook
customCenterFloat rect = doRectFloat rect <+> doFloat

myManageHook = composeAll
  [ className =? "Brave-browser"   --> doShift ws2 
  , className =? "Spotify"         --> doShift ws3
  , className =? "TelegramDesktop" --> doShift ws4
  , className =? "vesktop"         --> doShift ws4
  , className =? "zen-twilight"    --> doShift ws2 
  , className =? "kitty-music"     --> doShift ws3
  , className =? "Emulator"        --> doFloat 
  , className =? "pavucontrol"     --> customCenterFloat (W.RationalRect 0.25 0.20 0.5 0.6)
  ]
  
myStartupHook = do
  spawnOnce "zen"
  spawnOnce "kitty --class kitty-music ncspot"
  spawnOnOnce ws1 "kitty tmux a"

  windows $ O.viewOnScreen 1 ws2
  windows $ O.viewOnScreen 0 ws1 

myLogHook xmproc = dynamicLogWithPP $ def
    { ppCurrent         = xmobarColor Colors.base0A "" . wrap "" "*"
    , ppVisible         = xmobarColor Colors.base0A "" . wrap "" "-"    
    , ppHidden          = xmobarColor Colors.base04 ""
    , ppHiddenNoWindows = xmobarColor Colors.base04 ""
    , ppTitle           = xmobarColor Colors.base04 "" . shorten 75
    , ppOrder           = \[workspaces, _, title] -> [workspaces]
    , ppOutput          = hPutStrLn xmproc
    }

main = do
  xmproc <- spawnPipe "xmobar ~/.config/xmobar/xmobarrc"

  xmonad $ docks $ ewmhFullscreen $ ewmh def 
    { borderWidth        = 2
    , terminal           = Options.terminal
    , focusedBorderColor = Colors.base04
    , normalBorderColor  = Colors.base02
    , modMask            = Options.modMask
    , layoutHook         = myLayout
    , workspaces         = myWorkspaces 
    , startupHook        = myStartupHook
    , manageHook         = myManageHook <+> manageHook def
    , logHook            = myLogHook xmproc 
    } `additionalKeysP` myKeys
