RemoteInventory = {
	type = "RemoteInventory",

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
-- Expose
--
function RemoteInventory:Expose()
	--Log(">> RemoteInventory:Expose")

	Net.Expose {
		Class = self,

		ClientMethods = {
			SetStorageId = {RELIABLE_ORDERED, POST_ATTACH, ENTITYID}
		},
		ServerMethods = {},

		ServerProperties = {}
	}
end

--
-- Client:OnInit
--
function RemoteInventory.Client:OnInit()
	--Log(">> RemoteInventory.Client:OnInit")

	if not self.bInitialized then
		self:OnReset()
		self.bInitialized = 1
	end

	self:CacheResources()
end

--
-- Client:SetStorageId
--
function RemoteInventory.Client:SetStorageId(entityId)
	--Log(">> RemoteInventory.Client:SetStorageId")

	RemoteInventoryStorageId = entityId
end

--
-- Server:OnInit
--
function RemoteInventory.Server:OnInit()
	--Log(">> RemoteInventory.Server:OnInit")

	if not self.bInitialized then
		self:OnReset()
		self.bInitialized = 1
	end
end

--
-- Server:OnInitClient
--
function RemoteInventory.Server:OnInitClient(channelId)
	--Log(">> RemoteInventory.Server:OnInitClient")

	self.onClient:SetStorageId(channelId, RemoteInventoryStorageId)
end

--
-- CacheResources
--
function RemoteInventory:CacheResources()
	--Log(">> RemoteInventory:CacheResources")

end

--
-- GetActions
--
function RemoteInventory:GetActions(user)
	--Log(">> RemoteInventory:GetActions")

end

--
-- IsActionable
--
function RemoteInventory:IsActionable(user)
	--Log(">> RemoteInventory:IsActionable")

	return 1
end

--
-- OnDestroy
--
function RemoteInventory:OnDestroy()
	--Log(">> RemoteInventory:OnDestroy")

end

--
-- OnEditorSetGameMode
--
function RemoteInventory:OnEditorSetGameMode(gameMode)
	--Log(">> RemoteInventory:OnEditorSetGameMode")

end

--
-- OnPropertyChange
--
function RemoteInventory:OnPropertyChange()
	--Log(">> RemoteInventory:OnPropertyChange")

	self:OnReset()
end

--
-- OnReset
--
function RemoteInventory:OnReset()
	--Log(">> RemoteInventory:OnReset")

end

--
-- OnShutdown
--
function RemoteInventory:OnShutdown()
	--Log(">> RemoteInventory:OnShutdown")

end

--
-- OnSpawn
--
function RemoteInventory:OnSpawn()
	--Log(">> RemoteInventory:OnSpawn")

end

--
-- PerformAction
--
function RemoteInventory:PerformAction(user, name)
	--Log(">> RemoteInventory:PerformAction")

end

--
-- Create globally-scoped object instance.
--
AddInteractLargeObjectProperty(RemoteInventory)
RemoteInventory:Expose()

local function CreateRemoteInventoryTable()
	--Log(">> CreateRemoteInventoryTable")

	_G["RemoteInventory"] = new(RemoteInventory)
end

CreateRemoteInventoryTable()
