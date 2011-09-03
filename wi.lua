require("vicious")
require("vicious.contrib")

spacer = widget({ type = "textbox" })
spacer.text = "::"

batterytext = widget({ type ="textbox" })

battery = awful.widget.progressbar()
battery:set_width(100)
battery:set_ticks(10)
--vicious.register(battery, vicious.widgets.bat,
vicious.register(battery, vicious.contrib.batproc,
        function (widget, args)
        battery:set_color("#28ec51")

        if args[2] < 20 then
            if args[1] == "-" then
            battery:set_color("#FF0000")
            end
        end

        if args[1] == "↯" then
            batterytext.text = ""
        else
            batterytext.text = args[1]
        end

        return args[2]
        end
      
       ,6, "BAT0")
