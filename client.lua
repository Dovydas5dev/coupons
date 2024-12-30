RegisterCommand('kodas', function()
    local input = lib.inputDialog('Įveskite kupono kodą:', {
        {
            type = 'input',
            label = 'Kodas',
            required = true,
        }
    })

    if input and input[1] then
        TriggerServerEvent('d-coupons:checkcode', input[1])
    else
        lib.notify({
            title = 'Klaida',
            description = 'Neįvestas kodas!',
            type = 'error'
        })
    end
end)

TriggerEvent('chat:addSuggestion', '/kodas', 'Įveskite kupono kodą ir gaukite pinigų bonusą')