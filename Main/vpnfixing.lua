-- www.sciweavers.org/utils/i2img
-- www.freeopenvpn.org/logpass/usa.php
-- com.android.chrome
-- it.colucciweb.vpnclient


--alpha build
-- ========== Settings ================

-- Timer
timerVpnfixing = Timer();
timerVpnfixing:set()

-- environment setup
dir = scriptPath();
setImagePath(dir .. "image")

-- ========== Function ================
function Endscript()
    if timerVpnfixing:check() >= 900 then
        scriptExit("Time is up. \nRuntime: " .. timer2:check()/60 .. " minutes")
    end
end

function VConnectedC()
    if connectingC:exists(Pattern("homeConnected.png"), 0) then
        toast("Connected")
        return true
    end
    return false
end

function countdigits(str)
    local total = 0
    for digit in string.gmatch(str, "%d") do
        total = total + 1
    end
    return total
end

function chromeLoadingbar()
    waitPbar = 0
    while true do
        toast("debug")
        chromeloadingCo = {getColor(chromeLoading, 0)}
        while (chromeloadingCo[3] == 232) and 20 >= waitPbar do
            wait(0.5)
            chromeloadingCo = {getColor(chromeLoading, 0)}
            waitPbar = waitPbar + 1
        end
        if not (chromeloadingCo[3] == 232) then
            return
        elseif (chromeloadingCo[3] == 232) and 21 == waitPbar then
            return
        end
        if (waitPbar == 21) then
            wait(4)
            swipe(Location(525, 539), Location(525, 1183))
        end
    end
end

function pinrequc()
    Endscript()
    if chromeAddressBar:exists(Pattern("freeopenvpn.org.png"), 0) then
        swipe(Location(525, 539), Location(525, 1183))
        chromeLoadingbar()
        if cepbepy:exists(Pattern("cepbepyimg.png"), 0) then
            longClick(Location(266, 1045), 1)
        else
            longClick(Location(311, 876), 1)
        end
        chromeDownloadImg:existsClick(Pattern("downIMG.png"), 2)
        if chromeDownloadAgain:exists(Pattern("downloadAgain.png"), 0) then
            click(Location(873, 1817))
        end
        click(Location(875, 157))
        click(Location(445, 445))
    end
    if chromeAddressBar:exists(Pattern("sciweavers.orgHome.png"), 0) then
        chromeLoadingbar()
        click(Location(214, 327))
        wait(1)
        click(Location(136, 406))
        wait(0.2)
        ducumentsReg:existsClick(Pattern("documentMe.png"), 2)
        wait(0.2)
        click(Location(373, 335))
        wait(0.2)
        click(Location(861, 373))
        wait(1)
        click(Location(537, 621))
        wait(1)
        while not sciweaversProg:exists(Pattern("sciweaverProgres.png"), 0) do
            wait(0.8)
        end
        downloadtextfile:existsClick(Pattern("downloadfiletxt.png"), 0)
    end
    if chromeAddressBar:exists(Pattern("sciweavers.org.png"), 1) then
        chromeLoadingbar()
        zoom(421, 537, 300, 537, 650, 537, 771, 537, 300)
        zoom(421, 537, 300, 537, 650, 537, 771, 537, 300)
        swipe(Location(525, 539), Location(525, 1183))
        swipe(Location(97, 539), Location(883, 539))

        pinnumber = numberOCRNoFindException(numberchecking, "numb")
        toast(pinnumber)
        -- if  then
        --     toast("same data")
        -- end
        if countdigits(pinnumber) == 9 then
            toast("found 9 digit")
            pinnumber = string.match(pinnumber, "%d%d%d%d%d%d%d%d%d")
            return pinnumber
        elseif countdigits(pinnumber) == 8 then
            toast("found 8 digit\nadding first 0")
            pinnumber = 0 .. pinnumber
            pinnumber = string.match(pinnumber, "%d%d%d%d%d%d%d%d%d")
            return pinnumber
        else
            click(Location(875, 157))
            wait(0.2)
            click(Location(967, 842))
            wait(0.2)
            click(Location(253, 1337))
            wait(0.2)
            pinrequc()
        end
    end
end

function connectingonoff()
    p = 0
    while true do
        if PinRequT:exists(Pattern("popupPin.png"), 0) then
            click(Location(287, 879))
            return
        elseif not VConnectedC() then
            toast("Not Connecting.\nTry to connecting.")
            click(Location(995, 321))
            if p == 1 then 
                click(Location(995, 321))
            end
            p = 1
        end
        wait(0.2)
        lCon = 0
        while connectingC:exists(Pattern("homeConnecting.png"), 0) and 20 >= lCon do
            wait(1)
            if VConnectedC() then break end
            lCon = lCon + 1
        end
        if VConnectedC() then return end
    end
end

function addingAddressbar()
    if webchromeH:exists(Pattern("webchromeHome.png"), 0) then
        click(Location(414, 766))
        wait(0.2)
        type("www.sciweavers.org/utils/i2img")
        click(Location(966, 1842))
        wait(4)
        -- chromeloadingCo = {getColor(chromeLoading, 0)}
        -- toast(chromeloadingCo[3])
        -- while (chromeloadingCo[3] == 229) do
        --     wait(0.5)
        -- end
    end
    if chromeC:exists(Pattern("chromeChecking.png"), 0) then
        click(Location(875, 157))
        click(Location(84, 157))
        click(Location(414, 766))
        wait(0.2)
        type("www.freeopenvpn.org/logpass/usa.php")
        click(Location(966, 1842))
        wait(4)
    end
end

function maindo()
    while true do
        Endscript() 
        -- VpnClientPro
        while not vpnClientProC:exists(Pattern("appVPNCproC.png"), 0) do
            startApp("it.colucciweb.vpnclient")
            wait(3)
            toast("Starting Vpn Client Pro.")
        end
        if VConnectedC() then break end
        connectingonoff()
        if VConnectedC() then break end
        -- Chrome 
        while not chromeC:exists(Pattern("chromeChecking.png"), 0) do
            startApp("com.android.chrome")
            wait(3)
            toast("Starting Chrome.")
        end
        if chromePlus:exists(Pattern("chromePlusimg.png"), 0) then
            if tabswichingshort:exists(Pattern("tabSwichingShut.png"), 1) then
                toast("Preloaded address")
                click(Location(967, 842))
                wait(0.2)
                click(Location(253, 1337))
                wait(0.2)
            else
                click(Location(993, 155))
                click(Location(485, 450))
                click(Location(84, 157))
                addingAddressbar()
            end
        else
            click(Location(875, 157))
            if tabswichingshort:exists(Pattern("tabSwichingShut.png"), 1) then
                toast("Preloaded address")
                click(Location(967, 842))
                wait(0.2)
                click(Location(253, 1337))
                wait(0.2)
            else
                click(Location(993, 155))
                click(Location(485, 450))
                click(Location(84, 157))
                addingAddressbar()
            end
        end
        --]]
        -- Main Trying
        pinrequc()
        if pinnumber == nil then maindo() end
        while not vpnClientProC:exists(Pattern("appVPNCproC.png"), 0) do
            startApp("it.colucciweb.vpnclient")
            wait(3)
            toast("Starting Vpn Client Pro.")
        end
        if vpnClientProC:exists(Pattern("appVPNCproC.png"), 0) then
            click(Location(694, 338))
            wait(0.4)
            click(Location(743, 158))
            wait(2)
            click(Location(203, 644))
            wait(1)
            click(Location(281, 1269))
            longClick(Location(211, 1211), 1)
            type(pinnumber)
            click(Location(871, 165))
            wait(0.4)
            keyevent(4)
        end
    end
end
-- ========== Main Program ================
maindo()
keyevent(3)
