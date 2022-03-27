--
-- Check MisDB collection exists and is not empty.
--
function IsEmptyCollection(DB, name)
	if (DB:Collection(name).parent.db[name] ~= nil and DB:Collection(name).parent.db[name] ~= {}) then
		return false
	end

	return true
end
