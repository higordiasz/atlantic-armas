local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRPex = Tunnel.getInterface("atlantic_arsenal")


RegisterNetEvent("atlantic_arsenal:arma")
AddEventHandler("atlantic_arsenal:arma", function (arma)
    if vRPex.checkAdmin() then
		local ped = PlayerPedId()
		if arma == '' or arma == 'smg' then
        GiveWeaponToPed(ped,GetHashKey("WEAPON_SMG"),100,0,0)
		elseif arma == 'rpg' then
			GiveWeaponToPed(ped,GetHashKey("WEAPON_RPG"),100,0,0)
		elseif arma == 'pistol' then
			GiveWeaponToPed(ped,GetHashKey("WEAPON_PISTOL"),100,0,0)
		elseif arma == 'sniper' then
			GiveWeaponToPed(ped,GetHashKey("WEAPON_MARKSMANRIFLE"),100,0,0)
		elseif arma == 'c4' then
			GiveWeaponToPed(ped,GetHashKey("WEAPON_STICKYBOMB"),100,0,0)
		elseif arma == 'ak' then
			GiveWeaponToPed(ped,GetHashKey("WEAPON_ASSAULTRIFLE"),100,0,0)
		elseif arma == 'ray' then
			GiveWeaponToPed(ped,GetHashKey("WEAPON_RAYPISTOL"),100,0,0)
		else
			GiveWeaponToPed(ped,GetHashKey(arma),100,0,0)
		end
	end
end)

RegisterNetEvent("atlantic_arsenal:colete")
AddEventHandler("atlantic_arsenal:colete", function (source, args)
    if vRPex.checkAdmin() then
        vRPex.addColete()
    end
end)