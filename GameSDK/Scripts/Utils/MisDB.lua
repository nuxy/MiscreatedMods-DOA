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
-- Return page iterator for a given collection.
--
function GetLastInsertId(DBCollection)
	local id = DBCollection:GetPage("lastInsertId")

	if id ~= nil and id > 0 then
		id = (id + 1)
	else
		id = 1
	end

	return id
end

--
-- Return random page data for a given collection.
--
function GetRandomPage(DBCollection)
	local lastInsertId = GetLastInsertId(DBCollection)

	local items = {}

	for i = 1, lastInsertId do
		local data = GetPageData(DBCollection, i)

		if data ~= nil then
			table.insert(items, data)
		end
	end

	local len = #items
	local rnd = random(1, len)

	if len > 0 then
		return items[rnd]
	end
end

--
-- Get page data for a given collection by ID.
--
function GetPageData(DBCollection, id)
	return DBCollection:GetPage("record_" .. id)
end

--
-- Purge page data for a given collection by ID.
--
function PurgePageData(DBCollection, id)
	DBCollection:PurgePage("record_" .. id)

	-- Force table state IO update.
	DBCollection.parent.db:save()
end

--
-- Set page data for a given collection.
--
function SetPageData(DBCollection, obj)
	local lastInsertId = GetLastInsertId(DBCollection)

	-- Simplify iterating over stored pages.
	DBCollection:SetPage("lastInsertId", lastInsertId)
	DBCollection:SetPage("record_" .. lastInsertId, obj)
end
