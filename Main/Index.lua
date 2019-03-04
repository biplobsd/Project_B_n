-- ========== Settings ================

-- Globle Variables Setup 
setImmersiveMode(true)
Settings:setCompareDimension(true, 1080)
Settings:setScriptDimension(true, 1080)

-- environment setup
dir = scriptPath();
setImagePath(dir .. "image")

-- Region config
-- BTC spinner
LCheck = Region(228, 93, 207, 87)
wlc = Region(229, 1273, 455, 285)
spin = Region(762, 1709, 62, 22)
conE = Region(415, 771, 219, 93)
findspintre = Region(145, 581, 69, 79)
verifybtcapp = Region(896, 69, 128,132)
applist = Region(129, 437, 857, 1153)
rp1 = Region(643, 261, 97, 81)
rpc2 = Region(547, 292, 232, 47)
last_app = Region(420, 1318, 106, 59)
waitf = Region(277,1313, 373, 209)
LCheck = Region(228, 93, 207, 87)
offer1 = Region(137, 495, 45, 57)
spin = Region(692, 1680, 130, 51)
spinColG = Region(811, 1690, 0, 0)
waitColG = Region(806, 1691, 0, 0)
lerrorR = Region(595, 845, 183, 75)
climeS = Region(286, 807, 284, 64)
climeC = Region(131, 755, 171, 71)
climeSuc = Region(297, 793, 259, 57)
PleWait = Region(163, 763, 757, 99)
verifybtcapp = Region(896, 69, 128,132)
lowPowerD = Region(273, 122, 0, 0)

-- Via app
homeBTCwA = Region(35, 419, 525, 95)
waitX = Region(976, 95, 83, 75)
topCoinBase = Region(115, 105, 247, 65)
verifyBTCw = Region(487, 465, 111, 111)
sendN = Region(189, 831, 197, 75)
sendNC = Region(189, 831, 0, 0)
sendBtc = Region(56, 247, 270, 66)
sendBtcE = Region(348, 758, 147, 60)
amount = Region(61, 645, 179, 63)
conticol = Region(512, 1584, 0, 0)
conticol2 = Region(711, 1489, 0, 0)
transD = Region(55, 413, 395, 65)
verifyviaapp = Region(497, 1821, 85, 79)
rp = Region(317, 303, 443, 77)
homeforWC = Region(166, 446, 0, 0)
rp1 = Region(643, 261, 97, 81)

-- Vpn Fixing
PinRequT = Region(269, 563, 69, 51)

-- Some setting
timer2 = Timer();
saveBartilvl = batteryLevel()
-- User Interface
dialogInit()
addSeparator()
addSeparator()
newRow()
addCheckBox("rsValue", "\tReset all value and create logfile", false)
newRow()
addCheckBox("vpnfixingS", "\tLet me Connected vpn.", false)
newRow()
addCheckBox("ClimeNow", "\tSet Clime Now after spin complated", false)
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
	preferencePutNumber("Nnew", 35)
	dialogInit()
	newRow()
	addCheckBox("rsValue", " Reset all value and create logfile", false)
	newRow()
	addTextView("Input your Gmail: ")
	addEditText("emailInit", "biplobsd11@gmail.com")
	newRow()
	addTextView("Your total app ")
	addEditNumber("Nnew", 2)
	dialogShow("Setup")
	toast("Your email: "..emailInit.."\nYour total apps: "..Nnew)
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
function savebattery()
	if saveBartilvl > batteryLevel() then
		batterylvls = batteryLevel() - saveBartilvl
		preferencePutNumber("batteryinfopast", batterylvls)
	elseif saveBartilvl < batteryLevel() then
		batterylvls = batteryLevel() - saveBartilvl
		preferencePutNumber("batteryinfopast", batterylvls)
	elseif 15 >= batteryLevel() then
		return scriptExit("Battery is low, less then 10%. \nRuntime: " .. timer2:check()/60 .. " minutes")
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
function picapp(a, n)
	if a == "0" and skp == 0 then
		swipeMod(n)
		toast(n .. " app are not complated")
		click(picappL(n))
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
		keyevent(187)
		swipe(Location(450, 1000), Location(0,1000))
		click(Location(513, 289))
		wait(0.1)

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
	if (vpnfixingS) then
		if PinRequT:exists(Pattern("popupPin.png"), 0) then
			click(Location(287, 879))
			dofile(dir .. "vpnfixing.lua")
		end
	end

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