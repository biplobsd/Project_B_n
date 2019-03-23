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
require 'functions'

-- Some setting
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
addCheckBox("reverse", "\tReverse app picter.", false)
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

if (modeChange == 2) then
	preferencePutNumber("Nnew", #appPackesNameVia)
	preferencePutBoolean("vpnfixingS", false)
	vpnfixingS = false
	dialogInit()
	addSeparator()
	addSeparator()
	newRow()
	addCheckBox("reverse", "\tReverse app picter.", false)
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
if (reverse) then
	appPackesName = reverseTB(appPackesName)
end
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

--- Veriable
sxp = {0, 0, 0}
oneTime = true
offers = 0
appOped = false
skp = true

-- ========== Main Program ================

savebattery()

if (brNess) then setBrightness(0) end

if (vpnfixingS) then
	dofile(dir .. "vpnfixing.lua")
end
while true do
	if (modeChange == 1) then
		if not appOped then
			testPicapp()
			bugs = "false"
			dofile(dir .. "spin.lua")
		else
			bugs = "true"
			dofile(dir .. "spin.lua")
		end
	else
		if not appOped then
			testPicapp()
			dofile(dir .. "working.lua")
		else
			dofile(dir .. "working.lua")
		end
	end
	
	wait(1)
	-- Close back
	if (oneTime == false) or waitf:exists(Pattern("Wel_W.png"):similar(0.5), 0) or verifyviaapp:exists(Pattern("verifyViaappW.png"):similar(0.5), 0) or verifyviaapp:exists(Pattern("verifyViaapp.png"):similar(0.5), 0) then
		-- wait(1)
		toast("App switch")
		killApp(appPackesName[whoisapp])
		-- wait(1)
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

	if (vpnfixnow) then dofile(dir .. "vpnfixing.lua") end
	
	-- Pic right app
	skp = true

		    -- Vpn Fixing
-----------------
	vpnPasswordRequ()

	testPicapp()

	if not appOped then
		if (skp) then
			toast("Trying reset ...")
		else
			scriptExit("It's not btc app lists.")
		end
	end

	if (skp) then
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
		scriptExit("All done and Reset log file.")
	end

	--
	savebattery()
end