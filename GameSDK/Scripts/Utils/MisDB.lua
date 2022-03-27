--
-- Check MisDB collection exists and is not empty.
--
function IsEmptyCollection(DB, name)
	if (DB:Collection(name).parent.db[name] ~= nil and DB:Collection(name).parent.db[name] ~= {}) then
		return false
	end

	return true
end

--
-- Return random page data for a given collection.
--
function GetRandomPage(DBCollection, lastInsertId)
	local items = {}

	for i = 1, lastInsertId do
		local data = DBCollection:GetPage("location_" .. i)

		if data ~= nil then
			table.insert(items, data)
		end
	end

	local len = #items
	local rnd = random(0, len)

	if len > 0 then
		return items[rnd]
	end
end
