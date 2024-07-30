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
import qualified XMonad.StackSet as W

import qualified Colors
import qualified Options

myLayout = mouseResize $ avoidStruts $ spacingWithEdge 0 $ (tiled ||| Mirror tiled ||| Full)
  where
    tiled   = Tall nmaster delta ratio
    nmaster = 1
    ratio   = 1/2
    delta   = 3/100

ws1 = "1:main"
ws2 = "2:dev"
ws3 = "3:web"
ws4 = "4:music"
ws5 = "5:social"

myWorkspaces = [ws1, ws2, ws3, ws4, ws5]

myModMask = Options.modMask

myKeys = [ ((myModMask, xK_r     ), spawn "xmonad --recompile; killall xmobar; xmonad --restart")
         , ((myModMask, xK_s     ), spawn "maim -s | xclip -selection clipboard -t image/png"   )
         , ((myModMask, xK_Return), spawn Options.terminal  )
         , ((myModMask, xK_p     ), spawn "rofi -show combi")
         , ((myModMask, xK_P     ), spawn "pomodoro 25 5"   )
         , ((myModMask, xK_q     ), kill                    )
         ]  

myManageHook = composeAll
  [ className =? "Brave-browser"   --> doShift ws3
  , className =? "Spotify"         --> doShift ws4
  , className =? "TelegramDesktop" --> doShift ws5
  , className =? "discord"         --> doShift ws5
  ]
  
myStartupHook = do
  spawnOnce "discord"
  spawnOnce "telegram-desktop"
  spawnOnce "spotify"
  spawnOnce "brave"
  
main = do
  xmproc <- spawnPipe "xmobar ~/.config/xmobar/xmobarrc"

  xmonad $ docks $ ewmhFullscreen $ ewmh def 
    { borderWidth        = 2
    , terminal           = Options.terminal
    , focusedBorderColor = Colors.lavender
    , normalBorderColor  = Colors.surface2
    , modMask            = Options.modMask
    , layoutHook         = myLayout
    , workspaces         = myWorkspaces 
    , startupHook        = myStartupHook
    , manageHook         = myManageHook <+> manageHook def
    , logHook            = myLogHook xmproc 
    } `additionalKeys` myKeys

myLogHook xmproc = dynamicLogWithPP $ def
    { ppCurrent         = xmobarColor Colors.yellow   "" . wrap "" "*"
    , ppVisible         = xmobarColor Colors.yellow   "" . wrap "" "-"    
    , ppHidden          = xmobarColor Colors.surface2 ""
    , ppHiddenNoWindows = xmobarColor Colors.surface2 ""
    , ppTitle           = xmobarColor Colors.text     "" . shorten 75
    , ppOrder           = \[ws, _, tt] -> [ws, tt]
    , ppOutput          = hPutStrLn xmproc
    }
