require("vicious")

spacer = widget({ type = "textbox" })
spacer.text = "::"

batterytext = widget({ type ="textbox" })

battery = awful.widget.progressbar()
battery:set_width(100)
battery:set_ticks(10)
vicious.register(battery, vicious.widgets.bat,
        function (widget, args)
        if args[1] == "+" then
            if args[2] < 20 then
                battery:set_color("#FF0000")
            else battery:set_color("#28ec51")
            end
            batterytext.text = ""
        else
            if args[2] < 20 then
                battery:set_color("#FF0000")
            else battery:set_color("#28ec51")
            end
            batterytext.text = args[1]
        end

        return args[2]
        end
      
       ,6, "BAT0")
