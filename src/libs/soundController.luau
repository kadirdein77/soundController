--!native
--!optimize 2
--!strict
local soundService = game:GetService("SoundService")

--// Libs
local _soundData = require(script.Parent.soundData)
local types = require(script.Parent.global.types)

--// Types
export type _soundName = types.soundName

--// Constants

--// Variables

--// Lib Decleration
local soundController = {}
local _cache = {}

--// Lib Private Functions
function isUi(_sound) end

function _applySoundInfo(sound, info)
	sound.PlaybackRegionsEnabled = info.LoopRegion ~= nil or info.PlaybackRegion ~= nil
	for key, value in info do
		sound[key] = value
	end

	if info.Volume then
		if isUi(sound.SoundId) then
			-- sound:SetAttribute("BaseVolume", info.Volume)
			return
		end

		-- sound:SetAttribute("BaseVolume", info.Volume)
		sound.Volume = info.Volume
	end
end

function _createSound()
	local sound = Instance.new("Sound")
	sound.Parent = soundService
end

--// Lib Public Functions

return soundController
