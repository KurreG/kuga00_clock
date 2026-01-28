-- kuga00_clock: Simple WoW Clock Addon
local addonName = ...

-- Create main frame
local clockFrame = CreateFrame("Frame", "Kuga00ClockFrame", UIParent, "BackdropTemplate")
clockFrame:SetSize(70, 40)
clockFrame:SetPoint("CENTER", UIParent, "CENTER", 0, 200)
clockFrame:SetMovable(true)
clockFrame:EnableMouse(true)
clockFrame:RegisterForDrag("LeftButton")
clockFrame:SetScript("OnDragStart", clockFrame.StartMoving)
clockFrame:SetScript("OnDragStop", clockFrame.StopMovingOrSizing)
clockFrame:SetBackdrop({
  bgFile = "Interface/Tooltips/UI-Tooltip-Background",
  edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
  tile = true, tileSize = 16, edgeSize = 16,
  insets = { left = 4, right = 4, top = 4, bottom = 4 }
})
clockFrame:SetBackdropColor(0, 0, 0, 0.7)

-- Create font string
local clockText = clockFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlightLarge")
clockText:SetPoint("CENTER", clockFrame, "CENTER", 0, 0)



local function UpdateClock()
    local hour, minute = GetGameTime()
    clockText:SetText(string.format("%02d:%02d", hour, minute))
end

-- OnUpdate script
local elapsed = 0
clockFrame:SetScript("OnUpdate", function(self, delta)
	elapsed = elapsed + delta
	if elapsed > 1 then
		UpdateClock()
		elapsed = 0
	end
end)

-- Initial update
UpdateClock()
