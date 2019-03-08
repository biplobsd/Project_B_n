-- ========== Settings ================

-- Globle Variables Setup 
setImmersiveMode(true)
Settings:setCompareDimension(true, 1080)
Settings:setScriptDimension(true, 1080)

-- environment setup
dir = scriptPath();
package.path = package.path .. ';'..dir..'?.lua'
setImagePath(dir .. "image")
require 'Region'
require 'Ids'

-- Some setting
timer2 = Timer();
saveBartilvl = batteryLevel()
-- User Interface
preferencePutNumber("Nnew", #appPackesNameBTC)
dialogInit()
addSeparator()
addSeparator()
newRow()
addCheckBox("rsValue", "\tReset all value and create logfile", false)
newRow()
addCheckBox("vpnfixingS", "\tLet me Connected vpn.", false)
newRow()
addCheckBox("advnce", "\tAdvence app picter.", false)
newRow()
addCheckBox("ClimeNow", "\tSet Clime Now after spin complated", false)
newRow()
addCheckBox("climeNowOnly", "\tSet only Clime Now.", false)
newRow()
addCheckBox("offer", "\tSet Offer Check", false)
newRow()
addCheckBox("lerrorC", "\tSet Location error Check", false)
newRow()
addCheckBox("brNess", "\tSet low Brightness.", false)
addSeparator()
newRow()
addTextView("\tSet time eatch app for spin\t")
addEditNumber("timerSET", 3.42)
addTextView("min")
newRow()
addTextView("\tChange your mode ")
addRadioGroup("modeChange", 1)
addRadioButton("Spinner", 1)
addRadioButton("Sum money", 2)
newRow()
addTextView("\tPast session battery used ")
addEditNumber("batteryinfopast", 0)
addTextView("%")
newRow()
addTextView("\tYour total ")
addEditNumber("Nnew", 2)
addTextView("apps")
dialogShow("Setup")

if (brNess) then
	setBrightness(0)
end
if (modeChange == 2) then
	preferencePutNumber("Nnew", #appPackesNameVia)
	preferencePutBoolean("vpnfixingS", false)
	dialogInit()
	addSeparator()
	addSeparator()
	newRow()
	addCheckBox("advnce", "\tAdvence app picter.", false)
	newRow()
	addCheckBox("rsValue", " Reset all value and create logfile", false)
	addSeparator()
	newRow()
	addTextView("\tInput your Gmail: ")
	addEditText("emailInit", "biplobsd11@gmail.com")
	newRow()
	addTextView("\tYour total app ")
	addEditNumber("Nnew", 2)
	dialogShow("Setup")
	toast("Your email: "..emailInit.."\nYour total apps: "..Nnew)
	appPackesName = appPackesNameVia
else 
	appPackesName = appPackesNameBTC
end
toast(Nnew)
timerSET = timerSET * 60
lognew = {}
if (rsValue) then
	count = 1
	while Nnew >= count do
		lognew[count] = "0"
		count = count + 1
	end
	
	if (modeChange == 1) then
		log_filenew = assert(io.open(dir .. "logfilenew1.txt", "w"))
	else
		log_filenew = assert(io.open(dir .. "logfilenew2.txt", "w"))
	end
	for k,v in pairs(lognew) do
		log_filenew:write(v.."\n")
	end
	io.close(log_filenew)
	
else
	needED = 0
	if (modeChange == 1) then
		log_filenew = assert(io.lines(dir .. "logfilenew1.txt", "r"))
	else
		log_filenew = assert(io.lines(dir .. "logfilenew2.txt", "r"))
	end
	for l in log_filenew do
		local p = l:match '(%S+)'
		table.insert(lognew, p)
		if p == "1" then
			needED = needED + 1
		end
	end
	
	toast(needED.." app are complated")
end
-- Nnew = 16
-- count = 1
-- lognew = {}
-- while Nnew >= count do
-- 	lognew[count] = "0"
-- 	count = count + 1
-- end
-- lognew = {"1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0"}

-- toast(typeOf(lognew[1]))
-- toast("now")
-- toast("len:"..#lognew)
-- toast(lognew[1]..lognew[2])
-- log_file:read("*n")
-- for v in pairs(lognew) do toast(v) end

--- Veriable
sxp = {0, 0, 0}
timer2:set()
oneTime = true
offers = 0
version = "\n\nv1.2"

-- params = {id="4", title="Post 4" }
-- result = httpPost("http://my-json-server.typicode.com/biplobsd/datainput/posts", params)
-- print (result)
-- ========== Function ================
function vpnPasswordRequ()
	if (vpnfixingS) then
		if passwordRequP:existsClick(Pattern("disconnectimg.png"), 0.1) then
			dofile(dir .. "vpnfixing.lua")
		end
	end
end

function savebattery()
	if saveBartilvl > batteryLevel() then
		batterylvls = batteryLevel() - saveBartilvl
		preferencePutNumber("batteryinfopast", batterylvls)
	elseif saveBartilvl < batteryLevel() then
		batterylvls = batteryLevel() - saveBartilvl
		preferencePutNumber("batteryinfopast", batterylvls)
	elseif 15 >= batteryLevel() then
		return scriptExit("Battery is low, less then 15%. \nRuntime: " .. timer2:check()/60 .. " minutes")
	else
		preferencePutNumber("batteryinfopast", 0)
	end
end

function testPicapp()
	if skp == 0 then
		brks = 1
		while brks <= Nnew do
			sxp = picapp(lognew[brks], brks)
			lognew[brks] = sxp[1]
			sxp[1] = 0
			brks = brks + 1
		end
	end
end

function swipeMod(n)
	if (oneTime) then
		if n <= 12 then
			conti = 0
		else
			conti = ((n-1)/12)
			contino = 1
			while contino <= conti do
				swipe(Location(555, 1545), Location(555,798))
				wait(2.5)
				contino = contino + 1
			end
		end
		oneTime = false
	else
		oneTime = false
		if n <= 12 then
			r = 1
		else
			r = (n-1)%12
		end
		if r == 0 then
			swipe(Location(555, 1545), Location(555,798))
			wait(2.5)
		end
	end
end

function advacesAppPic(op)
	sop = 0
	-- op = #appPackesName - op
	toast(op)
	whoisapp = op
	while not waitf:exists(Pattern("Wel_W.png"), 0) and sop <= 10 do 
		startApp(appPackesName[op])
		sop = sop + 1
	end
end

function picapp(a, n)
	if a == "0" and skp == 0 then
		toast(n .. " app are not complated")
		if (advnce) then
			advacesAppPic(n)
		else
			swipeMod(n)
			click(picappL(n))
		end
		a = 1
		skp = 1
	end
	return {a}
end

function picappL(a)
	x = (210*(a%3)*1.3)
	if x == 0 then
		x = 210*3*1.3
	end
	if (a/4)%3 == 0 then
		y = 275*5
	elseif (a/4)%3 >= 0.25  and (a/4)%3 <= 0.75 then
		y = 275*2
	elseif (a/4)%3 >= 1.0  and (a/4)%3 <= 1.5 then
		y = 275*3
	elseif (a/4)%3 >= 1.75  and (a/4)%3 <= 2.25 then
		y = 275*4
	elseif (a/4)%3 >= 2.5  and (a/4)%3 <= 2.75 then
		y = 275*5
	end
	return Location(x, y)
end

savebattery()
-- ========== Main Program ================
if (vpnfixingS) then
	dofile(dir .. "vpnfixing.lua")
end
while true do
	if (modeChange == 1) then
		dofile(dir .. "spin.lua")
	else
		dofile(dir .. "working.lua")
	end

	-- Close back
	if (oneTime == false) or waitf:exists(Pattern("Wel_W.png"), 0) or verifyviaapp:exists(Pattern("verifyViaappW.png"), 0) or verifyviaapp:exists(Pattern("verifyViaapp.png"), 0) then
		wait(1)
		toast("App switch")
		if (advnce) then
			killApp(appPackesName[whoisapp])
		else
			keyevent(187)
			swipe(Location(450, 1000), Location(0,1000))
			click(Location(513, 289))
			wait(0.1)
		end

		-- Save logs
		if (modeChange == 1) then
			log_filenew = assert(io.open(dir .. "logfilenew1.txt", "w"))
		else
			log_filenew = assert(io.open(dir .. "logfilenew2.txt", "w"))
		end
		for k,v in pairs(lognew) do
			log_filenew:write(v.."\n")
		end
		io.close(log_filenew)
		savebattery()
	end

	if (vpnfixnow) then
		dofile(dir .. "vpnfixing.lua")
	end
	
	-- Pic right app
	skp = 0

		    -- Vpn Fixing
-----------------
	vpnPasswordRequ()

	dofile(dir .. "appPlist.lua")

	if skp == 0 then
		-- Reset log file
		count = 1
		while Nnew >= count do
			lognew[count] = "0"
			count = count + 1
		end
		if (modeChange == 1) then
			log_filenew = assert(io.open(dir .. "logfilenew1.txt", "w"))
		else
			log_filenew = assert(io.open(dir .. "logfilenew2.txt", "w"))
		end
		for k,v in pairs(lognew) do
			log_filenew:write(v.."\n")
		end
		io.close(log_filenew)
		scriptExit("All done and Reset log file. \nRuntime: " .. timer2:check()/60 .. " minutes")
	end

	--
	savebattery()
end