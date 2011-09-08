require("vicious")
require("vicious.contrib")

spacer = widget({ type = "textbox" })
spacer.text = " :: "

batterytext = widget({ type ="textbox" })

battery = awful.widget.progressbar()
battery:set_width(100)
battery:set_ticks(10)
battery:set_color("#28ec51")

vicious.register(battery, vicious.contrib.batproc,
        function (widget, args)
            battery:set_color("#28ec51")

            if args[2] < 20 then
                if args[1] == "-" then
                battery:set_color("#FF0000")
                end
            end

            if args[1] == "↯" then
                batterytext.text = "BAT0:"
            else
                batterytext.text = "BAT0(" .. args[1] .."):"
                battery.widget:add_signal("mouse::enter", function () batterytext.text = "BAT0(" .. args[2] .. "%):" end)
            end

            return args[2]
        end
      
       ,6, "BAT0")

volumetext = widget({ type = "textbox"})

volume = awful.widget.progressbar()
volume:set_width(100)
volume:set_ticks(10)
volume:set_color("#28ec51")
vicious.register(volume, vicious.widgets.volume,
        function (widget, args)
            if args[2] == "♩" then
                volumetext.text = "Volume (M):"
            else
                volumetext.text = "Volume:"
            end
            return args[1]
        end
        ,0.2, "Master")

