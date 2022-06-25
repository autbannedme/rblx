local functions_module = {}

local CHAT_COLORS =
{
  Color3.new(253/255, 41/255, 67/255), -- BrickColor.new("Bright red").Color,
  Color3.new(1/255, 162/255, 255/255), -- BrickColor.new("Bright blue").Color,
  Color3.new(2/255, 184/255, 87/255), -- BrickColor.new("Earth green").Color,
  BrickColor.new("Bright violet").Color,
  BrickColor.new("Bright orange").Color,
  BrickColor.new("Bright yellow").Color,
  BrickColor.new("Light reddish violet").Color,
  BrickColor.new("Brick yellow").Color,
}

functions_module.get_chat_color = function(pName)
		local value = 0
		for index = 1, #pName do
			local cValue = string.byte(string.sub(pName, index, index))
			local reverseIndex = #pName - index + 1
			if #pName%2 == 1 then
				reverseIndex = reverseIndex - 1
			end
			if reverseIndex%4 >= 2 then
				cValue = -cValue
			end
			value = value + cValue
		end
		return CHAT_COLORS[(value % #CHAT_COLORS) + 1]
end

functions_module.richtext = function(chat_gui)
	chat_gui.Frame.ChatChannelParentFrame.Frame_MessageLogDisplay.Scroller.ChildAdded:Connect(function(ch)
		ch.TextLabel.RichText = true
	end)
end
