while true do
    homeforWCc = {getColor(homeforWC, 0)}
    while (homeforWCc[3] == 255) do
        homeforWCc = {getColor(homeforWC, 0)}
        wait(0.5)
        toast("waiting")
    end
    wait(0.5)
    if verifyviaapp:exists(Pattern("verifyViaappW.png"), 0.5) then
        oneTime = false
    else
        break
    end
    wait(0.5)
    if homeBTCwA:exists(Pattern("HomeBTCWA.png"):similar(0.4), 1) then
        click(Location(197,447))
    end
    wait(0.5)
    while waitX:exists(Pattern("wait_x.png"), 0) do
        wait(3)
        toast("Found wait_X. Waiting")
    end
    while topCoinBase:exists(Pattern("topRcoinbase.png"), 0) do
        wait(3)
        toast("Wait for full page load")
    end
    wait(0.3)
    if verifyBTCw:exists(Pattern("btcWvL.png"), 0) then
        sendNcode = {getColor(sendNC, 0)}
        -- toast(sendNcode[3])
        if (sendNcode[3] == 203) or (sendNcode[3] == 204) then
            toast("You don't have btc")
            break
        elseif sendN:exists(Pattern("sendBTCN.png"):similar(0.4), 0) then
            click(Location(305, 867))
            waitVanish(Pattern("sendBTCN.png"):similar(0.4), 2.5)
        end
    end
    -- wait(1.7)
    if not sendBtcEmail:existsClick(Pattern("sbEmailArs.png"):similar(0.3), 0.7) then
        toast("Maybe any things changes")
        break
    end
    if sendBtcE:exists(Pattern("sendbtcEmail.png"):similar(0.4), 0) then
        type(Location(417, 784), emailInit)
        keyevent(4)
        swipe(Location(530, 1350), Location(530,800))
    end
    if amount:exists(Pattern("amountbox.png"):similar(0.4)) then
        click(Location(233, 819))
        wait(0.2)
        click(Location(827, 821))
        keyevent(4)
        wait(0.5)
        click(Location(512, 1584))
        wait(1)
    end
    wait(0.5)
    contC = {getColor(conticol, 1)}
    -- toast(contC[3])
    while (contC[3] == 239) do
        wait(0.5)
        contC = {getColor(conticol, 0)}
    end
    wait(0.2)
    if transD:exists(Pattern("transtiD.png"):similar(0.4), 0.4) then
        click(Location(711, 1489))
        toast("found>>")
        wait(1)
        contC = {getColor(conticol2, 0)}
        while (contC[3] == 239) do
        wait(1)
        contC = {getColor(conticol2, 0)}
        end
    end
    break
end