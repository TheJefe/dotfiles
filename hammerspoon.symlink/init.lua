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
-- source: https://github.com/Hammerspoon/hammerspoon/issues/235#issuecomment-101069303
function moveWindowOneSpace(direction)
  local mouseOrigin = hs.mouse.getAbsolutePosition()
  local win = hs.window.focusedWindow()
  local clickPoint = win:zoomButtonRect()
  local arrow = ""

  clickPoint.x = clickPoint.x + clickPoint.w + 5
  clickPoint.y = clickPoint.y + (clickPoint.h / 2)

  local mouseClickEvent = hs.eventtap.event.newMouseEvent(hs.eventtap.event.types.leftmousedown, clickPoint)
  mouseClickEvent:post()
  hs.timer.usleep(150000)

  local nextSpaceDownEvent = hs.eventtap.event.newKeyEvent({"ctrl"}, direction, true)
  nextSpaceDownEvent:post()
  hs.timer.usleep(150000)

  local nextSpaceUpEvent = hs.eventtap.event.newKeyEvent({"ctrl"}, direction, false)
  nextSpaceUpEvent:post()
  hs.timer.usleep(150000)

  local mouseReleaseEvent = hs.eventtap.event.newMouseEvent(hs.eventtap.event.types.leftmouseup, clickPoint)
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
hk1 = hs.hotkey.bind({"cmd", "ctrl", "alt"}, "R", function() moveWindowOneSpace("right") end)
hk2 = hs.hotkey.bind({"cmd", "ctrl", "alt"}, "L", function() moveWindowOneSpace("left") end)
