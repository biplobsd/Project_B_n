-- ========== Function ================

function reverseTB(tbl)
	for i=1, math.floor(#tbl / 2) do
	  local tmp = tbl[i]
	  tbl[i] = tbl[#tbl - i + 1]
	  tbl[#tbl - i + 1] = tmp
	end
	return tbl
end

function vpnPasswordRequ()
	if (vpnfixingS) then
		unfortunatelyStoped:existsClick(Pattern("unforStoped.png"):similar(0.4), 0) -- Unfortunately Stoped error finding and click the cencel.
		if passwordRequP:existsClick(Pattern("disconnectimg.png"):similar(0.4), 0) then
			dofile(dir .. "vpnfixing.lua")
		end
	end
end

function savebattery()
	local wapdonen = preferenceGetNumber("wapdone", 0) 
	if saveBartilvl > batteryLevel() then
		batterylvls = batteryLevel() - saveBartilvl
		preferencePutNumber("batteryinfopast", batterylvls)
		setStopMessage(batterylvls.."% battery used.\n\t"..(wapdonen-startaPs).." apps are commpletd.".."\n\tTotal commpleted apps : "..wapdonen.."\nRuntime: " .. Gtimer:check()/60 .. " minutes") 
	elseif saveBartilvl < batteryLevel() then
		batterylvls = batteryLevel() - saveBartilvl
		preferencePutNumber("batteryinfopast", batterylvls)
		setStopMessage(batterylvls.."% battery used.\n\t"..(wapdonen-startaPs).." apps are commpletd.".."\n\tTotal commpleted apps : "..wapdonen.."\nRuntime: " .. Gtimer:check()/60 .. " minutes") 
	elseif 15 >= batteryLevel() then
		return scriptExit("Battery is low, less then 15%.\n\t"..(wapdonen-startaPs).." apps are commpletd.".."\n\tTotal commpleted apps : "..wapdonen.."\nRuntime: " .. Gtimer:check()/60 .. " minutes") 
	else
		setStopMessage("0% battery used.\n\t"..(wapdonen-startaPs).." apps are commpletd.".."\n\tTotal commpleted apps : "..wapdonen.."\nRuntime: " .. Gtimer:check()/60 .. " minutes") 
		preferencePutNumber("batteryinfopast", 0)
	end
end

function testPicapp()
	if (skp) then
		brks = (preferenceGetNumber("wapdone", 0)+1)
		toast(#appPackesName)
		sxp = picapp(lognew[brks], brks)
		lognew[brks] = sxp[1]
		sxp[1] = 0
	end
end

function advacesAppPic(op)
	sop = 0
	whoisapp = op
	-- wait(2)
	aov = startApp(appPackesName[op])
	toast(op)
	wait(3)
	if (aov or waitf:exists(Pattern("Wel_W.png"):similar(0.5), 0.1) or verifyviaapp:exists(Pattern("verifyViaappW.png"):similar(0.5), 0.1) or verifybtcapp:exists(Pattern("vRfy.png"):similar(0.5), 0.1)) then
		appOped = true
	else
		appOped = false
	end
end

function picapp(a, n)
	if a == "0" and (skp) then
        if (reverse) then 
            toast((#appPackesName - n + 1) .. " app are not complated")
        else
            toast(n .. " app are not complated")
        end
		advacesAppPic(n)
		a = 1
		skp = false
	end
	a = "0"
	return {a}
end