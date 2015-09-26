local application = require "mjolnir.application"
local hotkey = require "mjolnir.hotkey"
local window = require "mjolnir.window"
local screen = require "mjolnir.screen"
local fnutils = require "mjolnir.fnutils"
local alert = require "mjolnir.alert"
local grid = require "mjolnir.bg.grid"
local appfinder = require "mjolnir.cmsj.appfinder"

local hotkeys = {}

function createHotkeys()
  for key, fun in pairs(definitions) do
    local mod = hyper
    if string.len(key) == 2 and string.sub(key,2,2) == "c" then
      mod = {"cmd"}
    end

    local hk = hotkey.new(mod, string.sub(key,1,1), fun)
    table.insert(hotkeys, hk)
    hk:enable()
  end
end

function applyPlace(win, place)
  local scrs = screen:allscreens()
  local scr = scrs[place[1]]
  grid.set(win, place[2], scr)
end

function applyLayout(layout)
  return function()
    for appName, place in pairs(layout) do
      local app = appfinder.app_from_name(appName)
      if app then
        for i, win in ipairs(app:allwindows()) do
          applyPlace(win, place)
        end
      end
    end
  end
end

function init()
  createHotkeys()
  alert.show("Mjolnir, at your service.")
end

-- Actual config =================================

-- Set grid size.
grid.GRIDWIDTH  = 6
grid.GRIDHEIGHT = 8
grid.MARGINX = 0
grid.MARGINY = 0
local gw = grid.GRIDWIDTH
local gh = grid.GRIDHEIGHT

local gomiddle = {x = 1, y = 1, w = 4, h = 6}
local goleft = {x = 0, y = 0, w = gw/2, h = gh}
local goright = {x = gw/2, y = 0, w = gw/2, h = gh}
local gobig = {x = 0, y = 0, w = gw, h = gh}

local fullApps = {
  "Google Chrome","Calendar","Spotify","Airmail","Hipchat", "iTerm"
}

local layout2 = {
  Calendar = {1, gomiddle}
}

fnutils.each(fullApps, function(app) layout2[app] = {1, gobig} end)

hyper = {"cmd", "alt", "ctrl","shift"}
definitions = {
  g = applyLayout(layout2),
}

init()
