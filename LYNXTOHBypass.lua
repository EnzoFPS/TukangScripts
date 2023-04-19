for a,b in pairs(getgc()) do 
    if typeof(b) == 'function' then 
        if debug.getinfo(b).name == 'kick' then 
            hookfunction(debug.getinfo(b).func, function()
                print("Anti-Cheat Bypassed!")
            end)
        end
    end 
end 

print("Anti-Cheat Bypassed!")
