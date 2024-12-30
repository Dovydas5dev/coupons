RegisterNetEvent('d-coupons:showInput', function()
    local input = lib.inputDialog('Enter coupon code:', {
        {
            type = 'input',
            label = 'Code',
            required = true,
        }
    })

    if input and input[1] then
        lib.callback('d-coupons:checkcode', false, function(response)
            if response.success then
                lib.notify({ title = 'Coupons system', description = response.message, type = 'success' })
            else
                lib.notify({ title = 'Coupons system', description = response.message, type = 'error' })
            end
        end, input[1])
    end
end)

TriggerEvent('chat:addSuggestion', '/code', 'Enter the coupon code and get a cash bonus')
