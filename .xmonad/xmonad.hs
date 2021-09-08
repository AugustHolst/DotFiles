import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Util.Run
import XMonad.Util.SpawnOnce
import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Layout.Spacing
import Data.Monoid
import System.Exit
import XMonad.Actions.WithAll

import qualified XMonad.StackSet as W
import qualified Data.Map        as M
import qualified Data.Text       as T
import qualified Data.Text.IO    as T
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

--myColors = fmap T.lines (T.readFile "$(HOME).cache/wal/colors")

--myNormalBorderColor  = snd (uncurry (myColors !! 0))
--myFocusedBorderColor = snd (uncurry (myColors !! 6))

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
   ("M-<Space>", windows W.swapMaster),
 --layout
   ("M-<Tab>", sendMessage NextLayout),
   ("M-S-t", sinkAll),
 --audio
   ("<XF86AudioMute>", spawn ("pamixer -t")),
   ("<XF86AudioLowerVolume>", spawn ("pamixer -d 5")),
   ("<XF86AudioRaiseVolume>", spawn ("pamixer -i 5")),
 --quit and restart
   ("M-<Delete>", spawn "xmonad --recompile; xmonad --restart"),
   ("M-S-<Delete>", io (exitWith ExitSuccess))
 ]

myLayoutHook = tiled ||| Full
 where
  tiled = spacing 16 $ Tall nmaster delta ratio
  nmaster = 1
  ratio = 1/2
  delta = 3/100

myEventHook = handleEventHook def

myLogHook = return ()

myStartupHook = do
 spawnOnce "nitrogen --restore &"
 spawnOnce "wal -R"
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

