CTFBase = {
	Properties = {
		Model = "Objects/props/misc/ctf/flag_base.cdf",
		Radius = 10
	},

	Client = {},
	Server = {},

	Editor = {
		Icon = "Item.bmp",
		IconOnTop = 1
	}
}

--
-- Server:OnInit
--
function CTFBase.Server:OnInit()
	--Log(">> CTFBase.Server:OnInit")

	if not self.bInitialized then
		self:OnReset()
		self.bInitialized = 1
		self:SetViewDistRatio(255)
	end
end

--
-- Client:OnInit
--
function CTFBase.Client:OnInit()
	--Log(">> CTFBase.Client:OnInit")

	if not self.bInitialized then
		self:OnReset()
		self.bInitialized = 1
		self:SetViewDistRatio(255)
	end
end

--
-- OnPropertyChange
--
function CTFBase:OnPropertyChange()
	--Log(">> CTFBase:OnPropertyChange")

	self:OnReset()
end

--
-- OnReset
--
function CTFBase:OnReset()
	--Log(">> CTFBase:OnReset")

	local rad = self.Properties.Radius / 2
	local min = {x=-rad, y=-rad, z=-rad}
	local max = {x=rad, y=rad, z=rad}

	self:LoadObject(0, self.Properties.Model)
	self:SetTriggerBBox(min, max)
	self:SetViewDistRatio(255)
	self:Physicalize(0, PE_STATIC, {mass=0})
	self:SetFlags(ENTITY_FLAG_ON_RADAR, 0)
	self:StartAnimation(0, "base_idle", 0, 0.4, 1.0, 1)
end

--
-- OnSpawn
--
function CTFBase:OnSpawn()
	--Log(">> CTFBase:OnSpawn")


end
