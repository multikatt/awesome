require("awful")
require("naughty")

local rc,err = loadfile(awful.util.getdir("config") .. "/aw.lua")

if rc then
    rc, err = pcall(rc)
    if rc then
        return
    end
end

dofile("/etc/xdg/awesome/rc.lua")

for s = 1,screen.count() do
  mypromptbox[s].text = awful.util.escape(err:match("[^\n]*"))
end

naughty.notify({ text = "Seems like there is something wrong with your config.\n Error:" .. err .. "\n", timeout = 0 })
