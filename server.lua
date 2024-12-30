ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('d-coupons:checkcode')
AddEventHandler('d-coupons:checkcode', function(kodas)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then
        TriggerClientEvent('ox_lib:notify', source, { title = 'Coupons system', description = 'Failed to retrieve player data!', type = 'error' })
        return
    end

    local suma = Config.Coupons[kodas]
    if not suma then
        TriggerClientEvent('ox_lib:notify', source, { title = 'Coupons system', description = 'Invalid coupon code!', type = 'error' })
        return
    end

    MySQL.Async.fetchScalar('SELECT COUNT(*) FROM used_coupons WHERE player_id = @player_id AND coupon_code = @kodas', {
        ['@player_id'] = xPlayer.identifier,
        ['@kodas'] = kodas
    }, function(count)
        if count > 0 then
            TriggerClientEvent('ox_lib:notify', source, { title = 'Coupons system', description = 'This coupon has already been used!', type = 'warning' })
            return
        end

        xPlayer.addAccountMoney('money', suma)

        MySQL.Async.execute('INSERT INTO used_coupons (player_id, coupon_code) VALUES (@player_id, @kodas)', {
            ['@player_id'] = xPlayer.identifier,
            ['@kodas'] = kodas
        })

        TriggerClientEvent('ox_lib:notify', source, { title = 'Coupons system', description = 'You have successfully received ' .. suma .. '$ in cash!', type = 'success' })
    end)
end)
