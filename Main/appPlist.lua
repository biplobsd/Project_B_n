if (advnce) then
    testPicapp()
    wait(2)
    if waitf:exists(Pattern("Wel_W.png"):similar(0.5), 0) or verifybtcapp:exists(Pattern("vRfy.png"):similar(0.5), 0) or verifyviaapp:exists(Pattern("verifyViaappW.png"):similar(0.5), 0) then
        Block_1 = true
    else
        Block_1 = false
    end
else
    if rp1:exists(Pattern("App_list_n.png"), 0.5) then
        testPicapp()
        Block_1 = true
    else
        Block_1 = false
    end
end

if not Block_1 then
    if skp == 0 then
        toast("Try reset ...")
    else
        scriptExit("It's not btc app lists.")
    end
end