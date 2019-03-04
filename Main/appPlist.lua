
if rp1:exists(Pattern("App_list_n.png"), 0.5) then
    Block_1 = 1
else
    Block_1 = 0
end

    -- Block_1
if Block_1 == 1 then

    testPicapp()
    
end

if Block_1 == 0 then
    scriptExit("It's not btc app lists.")
end