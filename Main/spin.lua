
timer = Timer();
-- ========== Main Program ================
wait(2)
timer:set()
waitfC = {getColor(waitForApp, 1)}
while waitfC[3] == 217 or waitfC[3] == 84 do 
    wait(2)
    toast("Wait " .. timer:check() .. " sec")
    if timer:check() >= timerSET then
        toast("Internet problem.")
        savebattery()
        break
    end
    waitfC = {getColor(waitForApp, 1)}
end
vpnPasswordRequ()
-- wait(1)
vpnfixnow = false
lowPD = {getColor(lowPowerD, 1)}
spinC = {getColor(spinColG, 1)}
if not (climeNowOnly) then
    while (lowPD[1] == 102 or lowPD[1] == 254) do
        vpnPasswordRequ()
        -- Offer Check
    -----------------
        -- if (offer) and offers == 0 then
        --     if offer1:exists(Pattern("of_1.png"), 0) then
        --         toast("Offer found")
        --         click(Location(325, 1405))
        --         offers = 1
        --     end
        -- end
    
        -- Location error Check
    -----------------
        if (lerrorC) then
            if lerrorR:exists(Pattern("Lerror.png"):similar(0.5), 2) then
                vpnfixnow = true
                break
            end
        end

        -- timer end
    -----------------
        if timer:check() >= timerSET then
            toast("Time is over. \nRuntime: " .. timer:check()/60 .. " minutes")
            break
        end

        -- Spinning
    -----------------
        doubleClick(Location(752, 1704))
        wait(2)
        lowPD = {getColor(lowPowerD, 0)}
    end
end
wait(0.1)
if verifybtcapp:exists(Pattern("vRfy.png"), 0) then oneTime = false end

        -- Clime Now
-----------------
if (ClimeNow) or (climeNowOnly) then
    if LCheck:exists(Pattern("Low_W.png"):similar(0.5), 0.4) or verifybtcapp:exists(Pattern("vRfy.png"):similar(0.5), 0) then
        toast("Try to clime Satoshi")
        click(Location(99, 136))
        click(Location(99, 136))
        wait(0.3)
        click(Location(99, 136))
        if climeS:exists(Pattern("climenowB.png"), 0) then
            toast("Clime Now found")
            click(Location(439, 846))
            wait(0.3)
            if climeC:exists(Pattern("climenow_Confirm.png"), 0) then
                click(Location(747, 1143))
                while PleWait:exists(Pattern("plz_wait.png"), 0) do
                    wait(0.5)
                    toast("Wait for payment")
                end
                if climeSuc:exists(Pattern("climeSucZ.png"), 0) then
                    toast("Clime Success! \nRuntime: " .. timer:check()/60 .. " minutes")
                    click(Location(993, 144))
                    click(Location(993, 144))
                    wait(1)
                end
            end
        else
            toast("Wait for 3 day. Then clime. \nRuntime: " .. timer:check()/60 .. " minutes")
            click(Location(993, 144))
            click(Location(993, 144))
            wait(1)
        end
    end
end

