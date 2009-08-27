local bOB = CreateFrame"Frame"
bOB:RegisterEvent("PLAYER_LOGIN")
bOB:SetScript("OnEvent", function(self, event, ...) 
	if self[event] then 
		return self[event](self, event, ...) 
	end 
end)

function bOB:PLAYER_LOGIN()
	self:RegisterEvent("AUCTION_HOUSE_SHOW")
	self:RegisterEvent("BANKFRAME_OPENED")
	self:RegisterEvent("GUILDBANKFRAME_OPENED")
	self:RegisterEvent("MAIL_SHOW")
	self:RegisterEvent("MERCHANT_SHOW")
	self:RegisterEvent("TRADE_SHOW")
	self:RegisterEvent("TRADE_SKILL_SHOW")
end
function bOB:YesBlockTrades(block)
	if block then
		SetCVar("BlockTrades", 1)
	else
		SetCVar("BlockTrades", 0)
	end
end

function bOB:AUCTION_HOUSE_SHOW()
	OpenAllBags(true)
	self:YesBlockTrades(true)
	self:RegisterEvent("AUCTION_HOUSE_CLOSED")

end

function bOB:BANKFRAME_OPENED()
	OpenAllBags(true)
	self:YesBlockTrades(true)
	self:RegisterEvent("BANKFRAME_CLOSED")
end

function bOB:GUILDBANKFRAME_OPENED()
	OpenAllBags(true)
	self:YesBlockTrades(true)
	self:RegisterEvent("GUILDBANKFRAME_CLOSED")
end

function bOB:MAIL_SHOW()
	OpenAllBags(true)
	self:YesBlockTrades(true)
	self:RegisterEvent("MAIL_CLOSED")
end

function bOB:MERCHANT_SHOW()
	OpenAllBags(true)
	self:YesBlockTrades(true)
	self:RegisterEvent("MERCHANT_CLOSED")
end

function bOB:TRADE_SHOW()
	OpenAllBags(true)
	self:RegisterEvent("TRADE_CLOSED")
end

function bOB:TRADE_SKILL_SHOW()
	OpenAllBags(true)
	self:RegisterEvent("TRADE_SKILL_CLOSE")
end

function bOB:MERCHANT_CLOSED()
	CloseAllBags()
	self:YesBlockTrades(false)
end
bOB.AUCTION_HOUSE_CLOSED = bOB.MERCHANT_CLOSED
bOB.BANKFRAME_CLOSED = bOB.MERCHANT_CLOSED
bOB.GUILDBANKFRAME_CLOSED = bOB.MERCHANT_CLOSED
bOB.MAIL_CLOSED = bOB.MERCHANT_CLOSED
bOB.TRADE_CLOSED = bOB.MERCHANT_CLOSED
bOB.TRADE_SKILL_CLOSE = bOB.MERCHANT_CLOSED

