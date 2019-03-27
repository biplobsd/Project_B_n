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
		-- for brks = 1, #appPackesName, 1 do
			sxp = picapp(lognew[brks], brks)
			lognew[brks] = sxp[1]
			sxp[1] = 0
		-- end
		-- while brks <= Nnew do
		-- 	sxp = picapp(lognew[brks], brks)
		-- 	lognew[brks] = sxp[1]
		-- 	sxp[1] = 0
		-- 	brks = brks + 1
		-- end
	end
end

-- function swipeMod(n)
-- 	if (oneTime) then
-- 		if n <= 12 then
-- 			conti = 0
-- 		else
-- 			conti = ((n-1)/12)
-- 			contino = 1
-- 			while contino <= conti do
-- 				swipe(Location(555, 1545), Location(555,798))
-- 				wait(2.5)
-- 				contino = contino + 1
-- 			end
-- 		end
-- 		oneTime = false
-- 	else
-- 		oneTime = false
-- 		if n <= 12 then
-- 			r = 1
-- 		else
-- 			r = (n-1)%12
-- 		end
-- 		if r == 0 then
-- 			swipe(Location(555, 1545), Location(555,798))
-- 			wait(2.5)
-- 		end
-- 	end
-- end

function advacesAppPic(op)
	sop = 0
	-- op = #appPackesName - op
	whoisapp = op
	-- wait(2)
	aov = startApp(appPackesName[op])
	-- toast(startApp(appPackesName[op]))
	-- wait(3)
	-- while not (waitf:exists(Pattern("Wel_W.png"):similar(0.5), 0.1) or verifyviaapp:exists(Pattern("verifyViaappW.png"):similar(0.5), 0.1) or verifybtcapp:exists(Pattern("vRfy.png"):similar(0.5), 0.1)) and (sop <= 30) do 
	-- 	startApp(appPackesName[op])
	-- 	wait(1)
	-- 	sop = sop + 1
	-- end
	toast(op)
	-- print(op.."="..sop)
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

-- function picappL(a)
-- 	x = (210*(a%3)*1.3)
-- 	if x == 0 then
-- 		x = 210*3*1.3
-- 	end
-- 	if (a/4)%3 == 0 then
-- 		y = 275*5
-- 	elseif (a/4)%3 >= 0.25  and (a/4)%3 <= 0.75 then
-- 		y = 275*2
-- 	elseif (a/4)%3 >= 1.0  and (a/4)%3 <= 1.5 then
-- 		y = 275*3
-- 	elseif (a/4)%3 >= 1.75  and (a/4)%3 <= 2.25 then
-- 		y = 275*4
-- 	elseif (a/4)%3 >= 2.5  and (a/4)%3 <= 2.75 then
-- 		y = 275*5
-- 	end
-- 	return Location(x, y)
-- end
