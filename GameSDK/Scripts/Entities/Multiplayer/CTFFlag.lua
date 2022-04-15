CTFFlag = {
	Properties = {
		Model = "GameSDK/Objects/props/misc/ctf/flag_neutral_small.cgf",
		Physics = {
			density = 0.0,
			mass = 20.0
		}
	},
	
	Client = {},
	Server = {},
	
	Editor = {
		Icon = "Item.bmp",
		IconOnTop=1
	}
}

--
-- Server:OnInit
--
function CTFFlag.Server:OnInit()
	--Log(">> CTFFlag.Server:OnInit")

	if not self.bInitialized then
		self:OnReset()
		self.bInitialized = 1
		self:SetViewDistRatio(255)
	end
end

--
-- Server:OnHit
--
function CTFFlag.Server:OnHit()
	--Log(">> CTFFlag.Server:OnHit")


end

--
-- Client:OnInit
--
function CTFFlag.Client:OnInit()
	--Log(">> CTFFlag.Client:OnInit")

	if not self.bInitialized then
		self:OnReset()
		self.bInitialized = 1
		self:SetViewDistRatio(255)
	end
end

--
-- Client:OnHit
--
function CTFFlag.Client:OnHit()
	--Log(">> CTFFlag.Client:OnHit")


end

--
-- OnPropertyChange
--
function CTFFlag:OnPropertyChange()
	--Log(">> CTFFlag:OnPropertyChange")

	self:OnReset()
end

--
-- OnReset
--
function CTFFlag:OnReset()
	--Log(">> CTFFlag:OnReset")

	self:LoadGeometry(0, self.Properties.Model)
end

--
-- OnSpawn
--
function CTFFlag:OnSpawn()
	--Log(">> CTFFlag:OnSpawn")


end
