import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Util.Run
import XMonad.Util.SpawnOnce
import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Layout.Grid
import XMonad.Layout.Spacing
import Data.Monoid
import System.Exit
import XMonad.Actions.WithAll

import qualified XMonad.StackSet as W
import qualified Data.Map        as M
import qualified Data.List       as L


myTerminal = "alacritty"
myBrowser = "firefox"
myBrowserIncognito = "firefox --private-window"

myBar = "xmobar $(HOME).config/xmobar/.xmobarrc"
myPP = xmobarPP { ppCurrent = xmobarColor "#000000" "" . wrap "<" ">" }
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

myBorderWidth = 2

myModMask = mod4Mask --equates to super or "windows key"

myWorkspaces = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

myNormalBorderColor  = "#312d3f"
myFocusedBorderColor = "#f5cfd3"

myKeys :: [(String, X ())]
myKeys =
 --start programs
 [ ("M-t", spawn (myTerminal)),
   ("M-w", spawn (myBrowser)),
   ("M-S-w", spawn (myBrowserIncognito)),
 --navigation
   ("M-q", kill),
   ("M-j", windows W.focusDown),
   ("M-k", windows W.focusUp),
   ("M-S-j", windows W.swapDown),
   ("M-S-k", windows W.swapUp),
   ("M-m", windows W.swapMaster),
 --language
   ("M-<Space>", spawn ("sh ~/utility_scripts/toggle_lang.sh")),
 --layout
   ("M-<Tab>", sendMessage NextLayout),
   ("M-S-t", sinkAll),
 --audio
   ("<XF86AudioMute>", spawn ("pamixer -t")),
   ("<XF86AudioLowerVolume>", spawn ("pamixer -d 5")),
   ("<XF86AudioRaiseVolume>", spawn ("pamixer -i 5")),
   ("<XF86MonBrightnessDown>", spawn ("xbacklight -dec 5")),
   ("<XF86MonBrightnessUp>", spawn ("xbacklight -inc 5")),
 --quit and restart
   ("M-<Delete>", spawn "xmonad --recompile; xmonad --restart"),
   ("M-S-<Delete>", io (exitWith ExitSuccess))
 ]

mySpacing = spacingRaw True (Border 9 9 16 16) True (Border 4 4 8 8) True
myLayoutHook = (mySpacing $ Tall 1 (3/100) (1/2)) ||| Full ||| (mySpacing $ Grid)
myEventHook = handleEventHook def

myLogHook = return ()

myStartupHook = do
 spawnOnce "nitrogen --restore &"
 spawnOnce "wal -R"
 spawnOnce "sh ~/utility_scripts/wal_x.sh"
 spawnOnce "picom &"

main :: IO ()
main = do
 xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig

--main configuration
myConfig = def {
    --simple stuff
    terminal           = myTerminal,
    focusFollowsMouse  = myFocusFollowsMouse,
    borderWidth        = myBorderWidth,
    modMask            = myModMask,
    workspaces         = myWorkspaces,
    normalBorderColor  = myNormalBorderColor,
    focusedBorderColor = myFocusedBorderColor,
    --hooks and layouts
    layoutHook         = myLayoutHook,
    handleEventHook    = myEventHook,
    startupHook        = myStartupHook,
    logHook            = myLogHook
    }
  `additionalKeysP` myKeys

