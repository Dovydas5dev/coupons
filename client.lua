RegisterCommand('code', function()
    local input = lib.inputDialog('Įveskite kupono kodą:', {
        {
            type = 'input',
            label = 'Code',
            required = true,
        }
    })

    if input and input[1] then
        TriggerServerEvent('d-coupons:checkcode', input[1])
    else
        lib.notify({
            title = 'Coupons system',
            description = 'No code entered!!',
            type = 'error'
        })
    end
end)

TriggerEvent('chat:addSuggestion', '/code', 'Enter the coupon code and get a cash bonus')
