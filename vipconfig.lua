--[[
	VIPConfig - Shared configuration for the VIP system.
	Rank checks are ALWAYS performed on the server (VIPServer).
	This module only stores settings and command metadata used by both UI and server.

	HOW TO GRANT RANKS:
	- GamePassId : Roblox Game Pass ID (0 = disabled)
	- UserIds    : list of specific Roblox UserIds that get the rank
	- GroupId / MinGroupRank : group members at or above this rank get it (0 = disabled)
	A player with VIP+ automatically has access to all VIP commands.
]]

local VIPConfig = {}

-- Rank definitions. VIP+ is checked first and includes all VIP perks.
VIPConfig.Ranks = {
	VIPPlus = {
		GamePassId = 0, -- <-- put your VIP+ Game Pass ID here
		UserIds = {}, -- e.g. {123456, 789012}
		GroupId = 0,
		MinGroupRank = 0,
	},
	VIP = {
		GamePassId = 0, -- <-- put your VIP Game Pass ID here
		UserIds = {}, -- e.g. {123456}
		GroupId = 0,
		MinGroupRank = 0,
	},
}

-- /size command limits (prevents extreme values).
VIPConfig.Size = {
	Min = 0.5,
	Max = 5,
}

-- BillboardGui tag appearance.
VIPConfig.Tag = {
	Colors = {
		VIP = Color3.fromRGB(140, 92, 255), -- purple
		VIPPlus = Color3.fromRGB(255, 200, 60), -- gold
	},
	StudsOffset = 2.8,
	MaxDistance = 200,
}

-- Command metadata (used by the VIP menu UI and /viphelp).
-- Rank: "VIP", "VIP+", or "Everyone".
VIPConfig.Commands = {
	{
		Name = "/ride",
		Usage = "/ride [player]",
		Example = "/ride Builderman",
		Description = "Ride on another player's shoulders. Use '/ride off' to safely dismount.",
		Rank = "VIP",
	},
	{
		Name = "/size",
		Usage = "/size [number]",
		Example = "/size 2",
		Description = "Change your character's size. Restores to normal on respawn.",
		Rank = "VIP",
	},
	{
		Name = "/korblox",
		Usage = "/korblox",
		Example = "/korblox",
		Description = "Toggle a Korblox-inspired ghost leg effect on your right leg (custom effect, not the official bundle).",
		Rank = "VIP+",
	},
	{
		Name = "/headless",
		Usage = "/headless",
		Example = "/headless",
		Description = "Toggle a Headless-inspired look by hiding your head. Accessories keep working.",
		Rank = "VIP+",
	},
	{
		Name = "/vip",
		Usage = "/vip",
		Example = "/vip",
		Description = "Open the VIP menu.",
		Rank = "Everyone",
	},
	{
		Name = "/viphelp",
		Usage = "/viphelp",
		Example = "/viphelp",
		Description = "Show all VIP commands and what they do.",
		Rank = "Everyone",
	},
}

return VIPConfig
