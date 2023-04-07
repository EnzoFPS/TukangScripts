if req then
            notify("In Progress...", "Fetching servers, this might take a while...", "rbxassetid://6962520787", 5)
            local servers = {}
            local body = game:GetService("HttpService"):JSONDecode(req({Url = ("https://games.roblox.com/v1/games/%s/servers/Public?sortOrder=Asc&limit=100"):format(game.PlaceId)}).Body)
            if body and body.data then
                for i, v in next, body.data do
                    if type(v) == "table" and tonumber(v.playing) and tonumber(v.maxPlayers) and v.playing < v.maxPlayers and v.id ~= game.JobId then
                        table.insert(servers, 1, v.id)
                    end
                end
            end
            if #servers > 0 then
                notify("Teleporting...", "Teleport in progress, please wait...", "rbxassetid://6962520787", 5)
                game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, servers[math.random(1, #servers)], lp)
            else
                return notify("Error.", "Couldn't find a server, try again later.", "rbxassetid://6962520787", 7.5)
            end
        else
            notify("Error.", "Your exploit is unsupported. (Missing function: request)", "rbxassetid://6962520787", 7.5)
        end
