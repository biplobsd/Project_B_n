
if rp1:exists(Pattern("App_list_n.png"), 0.5) then
    Block_1 = true
else
    if advnce then
        testPicapp()
        if waitf:exists(Pattern("Wel_W.png"), 0) or verifybtcapp:exists(Pattern("vRfy.png"), 0) then
            Block_1 = true
        else
            Block_1 = false
        end
    else
        Block_1 = false
    end
end

    -- Block_1
if (Block_1) then

    testPicapp()
    
end

if not Block_1 then
    scriptExit("It's not btc app lists.")
end