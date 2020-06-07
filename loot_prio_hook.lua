BINDING_HEADER_DKP = "Paranoid Loot Priority";

function build_tooltip(tooltip, content)
  local line = {}
  if content["pref_class"] then
    table.insert(line, string.format("Class: %s ", content["pref_class"]))
  end
  if content["prio"] then
    table.insert(line, string.format("Prio: %s ", content["prio"]))
  end
  if content["dkp"] then
    table.insert(line, string.format("DKP: %s ", content["dkp"]))
  end
	  
  tooltip:AddLine(table.concat(line, " | "))
	  
  if content["comment"] then
    tooltip:AddLine(string.format("Comment: %s ", content["comment"]))
  end
  if content["craftplayer"] then
    tooltip:AddLine(string.format("Craftable by:\n  %s ", content["craftplayer"]))
  end  
end

function multi_table_search(uid, tables)
  for tindex, tvalue in next, tables do
    ret = search_for_unit(uid, tvalue)
	if ret then
		return ret
	end
  end
  return nil
end

function search_for_unit(uid, stable)
	uid = tonumber(uid)
    for index, value in next, stable do
		if type(value["itemid"]) == "table" then
			for index, pvalue in next, value["itemid"] do		
				if pvalue == uid then
					return value
				end
			end		
		else
			if value["itemid"] == uid then
				return value
			end
        end
    end
end

GameTooltip:HookScript("OnTooltipSetItem", function(tooltip, ...)
  local itemname, itemlink = tooltip:GetItem()
  local id = itemlink:match("item:(%d+):")
  ret = multi_table_search(id, { Paranoid_loot_table, Paranoid_prof_table})
  if not ret then
    return
  end
  build_tooltip(tooltip, ret)
end)

ItemRefTooltip:HookScript("OnTooltipSetItem", function(tooltip, ...)
  local itemname, itemlink = tooltip:GetItem()
  local id = itemlink:match("item:(%d+):")
  ret = multi_table_search(id, { Paranoid_loot_table, Paranoid_prof_table})
  if not ret then
    return
  end
  build_tooltip(tooltip, ret)
end)

GameTooltip:HookScript("OnTooltipSetSpell", function(tooltip)
  local id = select(2, tooltip:GetSpell())
  if id then
    ret = search_for_unit(id, Paranoid_prof_table)
  end
  if ret then
	build_tooltip(tooltip, ret)
  end
end)
