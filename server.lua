local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

vRPex = {}
Tunnel.bindInterface("atlantic_arsenal", vRPex)

local webhookArma = ""

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end

function vRPex.addColete()
    local src = source
    local user_id = vRP.getUserId(src)
    if vRP.hasPermission(user_id, "admin.permissao") then
        local colete = 100
        vRPclient.setArmour(src, 100)
        vRP.setUData(user_id, "vRP:colete", json.encode(colete))
    end
end

function vRPex.checkAdmin()
    local src = source
    local user_id = vRP.getUserId(src)
    return vRP.hasPermission(user_id, "admin.permissao")
end

RegisterCommand('arma', function (source, args,rawCommand)
	local src = source
    local user_id = vRP.getUserId(src)
	local identity = vRP.getUserIdentity(user_id)
    if vRP.hasPermission(user_id, "admin.permissao") then
		if args[1] then
			SendWebhookMessage(webhookArma,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").."\n[ARMA]:"..args[1].."\r```")
			TriggerClientEvent("atlantic_arsenal:arma", source, args[1])
		else
			SendWebhookMessage(webhookArma,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").."\n[ARMA]: SMG\r```")
			TriggerClientEvent("atlantic_arsenal:arma", source, '')
		end
	end
end)

RegisterCommand('colete', function (source, args, rawCommand)
	TriggerClientEvent("atlantic_arsenal:colete", source, args)
end)