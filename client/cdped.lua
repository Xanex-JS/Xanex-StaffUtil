--[[

    Author: Xanex
    Desc: Stop nerds RPing as default Ped xD

]]

-- Restricted Peds Model List

defaultpedmodel = {
    "a_m_y_skater_01",
    "a_m_y_skater_02",
    "a_m_y_hipster_01",
    "a_m_y_hipster_02",
}

-- Codddeee

Citizen.CreateThread(function()
	while true do
        Wait(5000)


		ped = GetPlayerPed(-1)
		if ped then
			playerModel = GetEntityModel(ped)

        if Saff then 
                -- Check to see if they're the default ped if not they will be ignored completely
				if isPedBlacklisted(playerModel) then
                    RemoveAllPedWeapons(ped, true) -- self explanatory removes guns if they have any
					Notify("~r~You're a default ped you can't drive shoot and RP until you change.!")
				end

                -- Check to see if they're in a car in the default ped
                if IsPedInAnyVehicle(ped) and isPedBlacklisted(playerModel) then
                    ClearPedTasksImmediately(ped)
                    ExecuteCommand("dv")
                end

                Citizen.Wait(10000) -- 10 Seconds delay between running the script on a player if they're the default peds. helps with spam..

		end
    end
end)

function isPedBlacklisted(model)
	for _, blacklistedPed in pairs(defaultpedmodel) do
		if model == GetHashKey(blacklistedPed) then
			return true
		end
	end

	return false
end

function Notify(Text)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(Text)
    DrawNotification(true, true)
end
