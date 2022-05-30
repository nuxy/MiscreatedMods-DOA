RemoteInventoryStorage = {
	type = "RemoteInventoryStorage",

	Properties = {
		bPickable = 0,
		eiPhysicsType = 2,
		bMounted = 0,
		bSpecialSelect = 0,
		bUsable = 0,
		soclasses_SmartObjectClass = "",
		initialSetup = ""
	},

	Client = {},
	Server = {},

	Editor = {
		Icon = "Item.bmp",
		IconOnTop = 1
	}
}

--
-- Client:OnInit
--
function RemoteInventoryStorage.Client:OnInit()
	--Log(">> RemoteInventoryStorage.Client:OnInit")

	if not self.bInitialized then
		self:OnReset()
		self.bInitialized = 1
	end

	self:CacheResources()
end

--
-- Server:OnInit
--
function RemoteInventoryStorage.Server:OnInit()
	--Log(">> RemoteInventoryStorage.Server:OnInit")

	if not self.bInitialized then
		self:OnReset()
		self.bInitialized = 1
	end
end

--
-- CacheResources
--
function RemoteInventoryStorage:CacheResources()
	--Log(">> RemoteInventoryStorage:CacheResources")

end

--
-- GetActions
--
function RemoteInventoryStorage:GetActions(user)
	--Log(">> RemoteInventoryStorage:GetActions")

	local actions = {}
	table.insert(actions, "@item_open_inventory")
	return actions
end

--
-- IsActionable
--
function RemoteInventoryStorage:IsActionable(user)
	--Log(">> RemoteInventoryStorage:IsActionable")

	return 1
end

--
-- OnDestroy
--
function RemoteInventoryStorage:OnDestroy()
	--Log(">> RemoteInventoryStorage:OnDestroy")

end

--
-- OnEditorSetGameMode
--
function RemoteInventoryStorage:OnEditorSetGameMode(gameMode)
	--Log(">> RemoteInventoryStorage:OnEditorSetGameMode")

end

--
-- OnPropertyChange
--
function RemoteInventoryStorage:OnPropertyChange()
	--Log(">> RemoteInventoryStorage:OnPropertyChange")

	self:OnReset()
end

--
-- OnReset
--
function RemoteInventoryStorage:OnReset()
	--Log(">> RemoteInventoryStorage:OnReset")

end

--
-- OnShutdown
--
function RemoteInventoryStorage:OnShutdown()
	--Log(">> RemoteInventoryStorage:OnShutdown")

end

--
-- OnSpawn
--
function RemoteInventoryStorage:OnSpawn()
	--Log(">> RemoteInventoryStorage:OnSpawn")

end

--
-- PerformAction
--
function RemoteInventoryStorage:PerformAction(user, name)
	--Log(">> RemoteInventoryStorage:PerformAction")

	local entity = System.GetEntity(RemoteInventoryStorageId)

	entity.item:PerformAction(user.id, name)
end

--
-- Create globally-scoped object instance.
--
AddInteractLargeObjectProperty(RemoteInventoryStorage)

local function CreateRemoteInventoryStorageTable()
	--Log(">> CreateRemoteInventoryStorageTable")

	_G["RemoteInventoryStorage"] = new(RemoteInventoryStorage)
end

CreateRemoteInventoryStorageTable()
