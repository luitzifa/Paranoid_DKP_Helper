BINDING_HEADER_DKP = "Paranoid Loot Priority";

GameTooltip:HookScript("OnTooltipSetItem", function(tooltip, ...)
  local itemname, itemlink = tooltip:GetItem()
  local line = {}
  if itemlink then
    ret = search_for_item4(itemlink:match("item:(%d+):"))
  end
  if ret then
	  if ret["pref_class"] then
		table.insert(line, string.format("Class: %s ", ret["pref_class"]))
	  end
	  if ret["prio"] then
		table.insert(line, string.format("Prio: %s ", ret["prio"]))
	  end
	  if ret["dkp"] then
		table.insert(line, string.format("DKP: %s ", ret["dkp"]))
	  end
	  
	  tooltip:AddLine(table.concat(line, " | "))
	  
	  if ret["comment"] then
		tooltip:AddLine(string.format("Comment: %s ", ret["comment"]))
	  end
  end
end)

ItemRefTooltip:HookScript("OnTooltipSetItem", function(tooltip, ...)
  local itemname, itemlink = tooltip:GetItem()
  local line = {}
  if itemlink then
    ret = search_for_item4(itemlink:match("item:(%d+):"))
  end
  
  if ret then
	  if ret["pref_class"] then
		table.insert(line, string.format("Class: %s ", ret["pref_class"]))
	  end
	  if ret["prio"] then
		table.insert(line, string.format("Prio: %s ", ret["prio"]))
	  end
	  if ret["dkp"] then
		table.insert(line, string.format("DKP: %s ", ret["dkp"]))
	  end
	  
	  tooltip:AddLine(table.concat(line, " | "))
	  
	  if ret["comment"] then
		tooltip:AddLine(string.format("Comment: %s ", ret["comment"]))
	  end
  end
end)
