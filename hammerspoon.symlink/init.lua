-- source: https://gist.github.com/josephholsten/1e17c7418d9d8ec0e783

-- auto reload configuration
function reloadConfig(files)
    doReload = false
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Hammerspoon config loaded")

-- Moves a window to the next or previous screen
-- started with source: https://github.com/Hammerspoon/hammerspoon/issues/235#issuecomment-101069303
function moveWindowOneSpace(win, direction)
  local mouseOrigin = hs.mouse.getAbsolutePosition()
  if win == nil then
    win = hs.window.focusedWindow()
  else
    win:focus()
  end
  local clickPoint = win:zoomButtonRect()
  local arrow = ""

  clickPoint.x = clickPoint.x + clickPoint.w + 25
  clickPoint.y = clickPoint.y + (clickPoint.h / 2)

  -- clicking and dragging with chromes tabs doesn't work so well with the normal y position
  appName = win:application():title()
  if  appName == "Google Chrome" or appName == "Calendar" then
    clickPoint.y = clickPoint.y - clickPoint.h
  end

  local mouseClickEvent = hs.eventtap.event.newMouseEvent(hs.eventtap.event.types.leftMouseDown, clickPoint)
  mouseClickEvent:post()
  hs.timer.usleep(150000)

  local nextSpaceDownEvent = hs.eventtap.event.newKeyEvent({"ctrl"}, direction, true)
  nextSpaceDownEvent:post()
  hs.timer.usleep(150000)

  local nextSpaceUpEvent = hs.eventtap.event.newKeyEvent({"ctrl"}, direction, false)
  nextSpaceUpEvent:post()
  hs.timer.usleep(150000)

  local mouseReleaseEvent = hs.eventtap.event.newMouseEvent(hs.eventtap.event.types.leftMouseUp, clickPoint)
  mouseReleaseEvent:post()
  hs.timer.usleep(150000)

  hs.mouse.setAbsolutePosition(mouseOrigin)

  if direction == "right" then
    arrow = " ❑  ➡︎"
  else
    arrow = " ⬅︎  ❑"
  end
  hs.alert.show(arrow .. "\nspace")
end

--function applicationWatcher(appName, eventType, appObject)
  --if (eventType == hs.application.watcher.launched) then
    --if (appName == "Calendar") then
      --hs.alert.show("Calendar launched")
      --local win = appObject:mainWindow()
      --for i = 0, 2 do
        --moveWindowOneSpace(win, "left")
        --hs.timer.usleep(150000)
      --end
      --local win = appObject:mainWindow()
      --win:maximize()
    --end
  --end
--end
--local appWatcher = hs.application.watcher.new(applicationWatcher)
--appWatcher:start()

function zeroLocation(win)
  for i = 0, 4 do
    moveWindowOneSpace(win, "left")
    hs.timer.usleep(150000)
  end
end

function applyPlace(win, place)
  hs.alert("Applying place " .. win:application():title() .. place)
  zeroLocation(win)
  place = place - 1
  for i = 0, place do
    hs.alert("" .. i)
    moveWindowOneSpace(win, "right")
  end
end

function moveToDefaults(appList)
  hs.alert("Moving Windows to default locations")
  for i, appInfo in ipairs(appList) do
    local app = hs.appfinder.appFromName(appInfo[1])
    if app then
      hs.alert(app:title())
      for i, win in ipairs(app:allWindows()) do
        applyPlace(win,appInfo[2])
      end
      --applyPlace(app:mainWindow(),appInfo[2])
    end
  end
end

local appList = {
  {"Calendar",0},
  {"Airmail",1},
  {"Hipchat",2},
  {"Google Chrome",3},
  {"iTerm",4}
}

-- Key bindings
hs.hotkey.bind({"cmd", "ctrl"}, "right", function() moveWindowOneSpace(nil, "right") end)
hs.hotkey.bind({"cmd", "ctrl"}, "left", function() moveWindowOneSpace(nil, "left") end)
hs.hotkey.bind({"cmd", "ctrl"}, "G", function() moveToDefaults(appList) end)
