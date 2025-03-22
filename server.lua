lib.callback.register('d-coupons:checkcode', function(source, kodas)
    local suma = Config.Coupons[kodas]

    if not suma then
        return { success = false, message = 'Invalid coupon code!' }
    end

    local playerIdentifier = GetPlayerIdentifier(source, 0)

    local count = MySQL.scalar.await('SELECT COUNT(*) FROM used_coupons WHERE player_id = ? AND coupon_code = ?', {
        playerIdentifier, kodas
    })

    if count > 0 then
        return { success = false, message = 'This coupon has already been used!' }
    end

    exports.ox_inventory:AddItem(source, 'money', suma)

    MySQL.insert.await('INSERT INTO used_coupons (player_id, coupon_code) VALUES (?, ?)', {
        playerIdentifier, kodas
    })

    return { success = true, message = 'You have successfully received ' .. suma .. '$ in cash!' }
end)

lib.addCommand('code', {
    help = 'Open the coupon input window',
}, function(source, args, rawCommand)
    TriggerClientEvent('d-coupons:showInput', source)
end)
