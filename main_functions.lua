-- searches for a specific item's information in loot_table.lua

function search_for_item4(itemid)
    for index, value in next, Paranoid_loot_table do
        if value["itemid"] == itemid then
            return value
        end
    end
end
