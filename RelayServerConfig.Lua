local Lua_Config = {
	MaxClient = 10,
	SendPacketSizeForClient = 2048 * 10,	--20kb
	RecvPacketSizeForClient = 2048 * 10,	--20kb
	Port = 85000,
	
	DBINFO = "Driver={MySQL ODBC 3.51 Driver};Server=192.168.100.100;Database=game;User=fbManager;Password=!@#vkqldysemejrpdla098;port=7306;Option=3;charset=euckr",
}


function LoadConfig()
	return Lua_Config
end


local PvpDefault = 5000	-- 기본 매칭 증가 단위
local PvpDefaultLP = 0	-- 기본 매칭 증가 단위
local PvpDefaultRecon = 25	-- 기본 승리보상

local PvpDefenceRecon	= 0	-- 방어자 보상
local PvpDefenceLP		= 0	-- 방어자 보상

------------------------------------------------------------------------------------------------------------
-- 매치 정의 테이블
local PvpMatch = {
	-- 순위 구간,	매칭 랭킹 증가값
		--  최소~최대레벨에 따른 리콘 엘피보상값
	
	{ 1, 	 	10,		1, 
	byLvl = {{MinLvl = 1, MaxLvl= 40,Recon=0,LP=30},},		
	},	
		
	{ 11, 	 	50,		1, 
	byLvl = {{MinLvl = 1, MaxLvl= 40,Recon=0,LP=25},},		
	},
	
	{ 51, 	 	100,		1, 
	byLvl = {{MinLvl = 1, MaxLvl= 40,Recon=0,LP=20},},		
	},
		
	{ 101, 	 	500,		10, 
	byLvl = {{MinLvl = 1, MaxLvl= 40,Recon=0,LP=20},},
	},

	{ 501, 	 	1000,		10, 
	byLvl = {{MinLvl = 1, MaxLvl= 40,Recon=0,LP=15},},
	},	
	
	{ 1001, 	 	5000,		50, 
	byLvl = {{MinLvl = 1, MaxLvl= 40,Recon=0,LP=15},},
	},
	
	{ 5001, 	 	10000,		100, 
	byLvl = {{MinLvl = 1, MaxLvl= 40,Recon=0,LP=15},},
	},
	
	{ 10001, 	 	20000,		200, 
	byLvl = {{MinLvl = 1, MaxLvl= 40,Recon=0,LP=10},},	
	},
	
	{ 20001, 	 	50000,		500, 
	byLvl = {{MinLvl = 1, MaxLvl= 40,Recon=0,LP=10},},
	},
	
	{ 50001, 	 	100000,		1000, 
	byLvl = {{MinLvl = 1, MaxLvl= 40,Recon=0,LP=10},},
	},
	
	{ 100001, 	 	500000,		5000, 
	byLvl = {{MinLvl = 1, MaxLvl= 40,Recon=0,LP=10},},
	},
	
}

------------------------------------------------------------------------------------------------------------
-- 일일보상 테이블
local PvpDailyReward = {
 
  
 
--[[1~1위--]]{1,1,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=25000,LP=2500,Items={}},

},},	   
--[[2~2위--]]{2,2,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=17000,LP=1500,Items={}},

},},	   
--[[3~3위--]]{3,3,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=15000,LP=1300,Items={}},

},},	   
--[[4~4위--]]{4,4,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=13500,LP=1200,Items={}},

},},	   
--[[5~5위--]]{5,5,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=12500,LP=1100,Items={}},

},},	   
--[[6~6위--]]{6,6,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=12000,LP=1000,Items={}},

},},	   
--[[7~7위--]]{7,7,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=11500,LP=950,Items={}},

},},	   
--[[8~8위--]]{8,8,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=11000,LP=900,Items={}},

},},	   
--[[9~9위--]]{9,9,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=10500,LP=850,Items={}},

},},	   
--[[10~10위--]]{10,10,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=10000,LP=800,Items={}},

},},	   
--[[11~11위--]]{11,11,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=9950,LP=790,Items={}},

},},	   
--[[12~12위--]]{12,12,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=9900,LP=780,Items={}},

},},	   
--[[13~13위--]]{13,13,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=9850,LP=770,Items={}},

},},	   
--[[14~14위--]]{14,14,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=9800,LP=760,Items={}},

},},	   
--[[15~15위--]]{15,15,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=9750,LP=750,Items={}},

},},	   
--[[16~16위--]]{16,16,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=9700,LP=740,Items={}},

},},	   
--[[17~17위--]]{17,17,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=9650,LP=730,Items={}},

},},	   
--[[18~18위--]]{18,18,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=9600,LP=720,Items={}},

},},	   
--[[19~19위--]]{19,19,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=9550,LP=710,Items={}},

},},	   
--[[20~20위--]]{20,20,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=9500,LP=700,Items={}},

},},	   
--[[21~21위--]]{21,21,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=9450,LP=690,Items={}},

},},	   
--[[22~22위--]]{22,22,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=9400,LP=680,Items={}},

},},	   
--[[23~23위--]]{23,23,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=9350,LP=670,Items={}},

},},	   
--[[24~24위--]]{24,24,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=9300,LP=660,Items={}},

},},	   
--[[25~25위--]]{25,25,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=9250,LP=650,Items={}},

},},	   
--[[26~26위--]]{26,26,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=9200,LP=640,Items={}},

},},	   
--[[27~27위--]]{27,27,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=9150,LP=630,Items={}},

},},	   
--[[28~28위--]]{28,28,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=9100,LP=620,Items={}},

},},	   
--[[29~29위--]]{29,29,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=9050,LP=610,Items={}},

},},	   
--[[30~30위--]]{30,30,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=9000,LP=600,Items={}},

},},	   
--[[31~31위--]]{31,31,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=8950,LP=590,Items={}},

},},	   
--[[32~32위--]]{32,32,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=8900,LP=580,Items={}},

},},	   
--[[33~33위--]]{33,33,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=8850,LP=570,Items={}},

},},	   
--[[34~34위--]]{34,34,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=8800,LP=560,Items={}},

},},	   
--[[35~35위--]]{35,35,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=8750,LP=550,Items={}},

},},	   
--[[36~36위--]]{36,36,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=8700,LP=540,Items={}},

},},	   
--[[37~37위--]]{37,37,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=8650,LP=530,Items={}},

},},	   
--[[38~38위--]]{38,38,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=8600,LP=520,Items={}},

},},	   
--[[39~39위--]]{39,39,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=8550,LP=510,Items={}},

},},	   
--[[40~40위--]]{40,40,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=8500,LP=500,Items={}},

},},	   
--[[41~41위--]]{41,41,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=8450,LP=490,Items={}},

},},	   
--[[42~42위--]]{42,42,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=8400,LP=480,Items={}},

},},	   
--[[43~43위--]]{43,43,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=8350,LP=470,Items={}},

},},	   
--[[44~44위--]]{44,44,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=8300,LP=460,Items={}},

},},	   
--[[45~45위--]]{45,45,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=8250,LP=450,Items={}},

},},	   
--[[46~46위--]]{46,46,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=8200,LP=440,Items={}},

},},	   
--[[47~47위--]]{47,47,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=8150,LP=430,Items={}},

},},	   
--[[48~48위--]]{48,48,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=8100,LP=420,Items={}},

},},	   
--[[49~49위--]]{49,49,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=8050,LP=410,Items={}},

},},	   
--[[50~50위--]]{50,50,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=8000,LP=400,Items={}},

},},	   
--[[51~51위--]]{51,51,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=7560,LP=400,Items={}},

},},	   
--[[52~52위--]]{52,52,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=7520,LP=400,Items={}},

},},	   
--[[53~53위--]]{53,53,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=7480,LP=400,Items={}},

},},	   
--[[54~54위--]]{54,54,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=7440,LP=400,Items={}},

},},	   
--[[55~55위--]]{55,55,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=7400,LP=400,Items={}},

},},	   
--[[56~56위--]]{56,56,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=7360,LP=400,Items={}},

},},	   
--[[57~57위--]]{57,57,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=7320,LP=400,Items={}},

},},	   
--[[58~58위--]]{58,58,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=7280,LP=400,Items={}},

},},	   
--[[59~59위--]]{59,59,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=7240,LP=400,Items={}},

},},	   
--[[60~60위--]]{60,60,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=7200,LP=400,Items={}},

},},	   
--[[61~61위--]]{61,61,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=7160,LP=400,Items={}},

},},	   
--[[62~62위--]]{62,62,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=7120,LP=400,Items={}},

},},	   
--[[63~63위--]]{63,63,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=7080,LP=400,Items={}},

},},	   
--[[64~64위--]]{64,64,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=7040,LP=400,Items={}},

},},	   
--[[65~65위--]]{65,65,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=7000,LP=400,Items={}},

},},	   
--[[66~66위--]]{66,66,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=6960,LP=400,Items={}},

},},	   
--[[67~67위--]]{67,67,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=6920,LP=400,Items={}},

},},	   
--[[68~68위--]]{68,68,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=6880,LP=400,Items={}},

},},	   
--[[69~69위--]]{69,69,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=6840,LP=400,Items={}},

},},	   
--[[70~70위--]]{70,70,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=6800,LP=400,Items={}},

},},	   
--[[71~71위--]]{71,71,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=6760,LP=400,Items={}},

},},	   
--[[72~72위--]]{72,72,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=6720,LP=400,Items={}},

},},	   
--[[73~73위--]]{73,73,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=6680,LP=400,Items={}},

},},	   
--[[74~74위--]]{74,74,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=6640,LP=400,Items={}},

},},	   
--[[75~75위--]]{75,75,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=6600,LP=400,Items={}},

},},	   
--[[76~76위--]]{76,76,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=6560,LP=350,Items={}},

},},	   
--[[77~77위--]]{77,77,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=6520,LP=350,Items={}},

},},	   
--[[78~78위--]]{78,78,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=6480,LP=350,Items={}},

},},	   
--[[79~79위--]]{79,79,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=6440,LP=350,Items={}},

},},	   
--[[80~80위--]]{80,80,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=6400,LP=350,Items={}},

},},	   
--[[81~81위--]]{81,81,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=6360,LP=350,Items={}},

},},	   
--[[82~82위--]]{82,82,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=6320,LP=350,Items={}},

},},	   
--[[83~83위--]]{83,83,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=6280,LP=350,Items={}},

},},	   
--[[84~84위--]]{84,84,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=6240,LP=350,Items={}},

},},	   
--[[85~85위--]]{85,85,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=6200,LP=350,Items={}},

},},	   
--[[86~86위--]]{86,86,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=6160,LP=350,Items={}},

},},	   
--[[87~87위--]]{87,87,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=6120,LP=350,Items={}},

},},	   
--[[88~88위--]]{88,88,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=6080,LP=350,Items={}},

},},	   
--[[89~89위--]]{89,89,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=6040,LP=350,Items={}},

},},	   
--[[90~90위--]]{90,90,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=6000,LP=350,Items={}},

},},	   
--[[91~91위--]]{91,91,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=5960,LP=350,Items={}},

},},	   
--[[92~92위--]]{92,92,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=5920,LP=350,Items={}},

},},	   
--[[93~93위--]]{93,93,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=5880,LP=350,Items={}},

},},	   
--[[94~94위--]]{94,94,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=5840,LP=350,Items={}},

},},	   
--[[95~95위--]]{95,95,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=5800,LP=350,Items={}},

},},	   
--[[96~96위--]]{96,96,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=5760,LP=350,Items={}},

},},	   
--[[97~97위--]]{97,97,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=5720,LP=350,Items={}},

},},	   
--[[98~98위--]]{98,98,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=5680,LP=350,Items={}},

},},	   
--[[99~99위--]]{99,99,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=5640,LP=350,Items={}},

},},	   
--[[100~100위--]]{100,100,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=5600,LP=350,Items={}},

},},	   
--[[101~110위--]]{101,110,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=5490,LP=300,Items={}},

},},	   
--[[111~120위--]]{111,120,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=5470,LP=300,Items={}},

},},	   
--[[121~130위--]]{121,130,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=5450,LP=300,Items={}},

},},	   
--[[131~140위--]]{131,140,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=5430,LP=300,Items={}},

},},	   
--[[141~150위--]]{141,150,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=5410,LP=300,Items={}},

},},	   
--[[151~160위--]]{151,160,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=5390,LP=300,Items={}},

},},	   
--[[161~170위--]]{161,170,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=5370,LP=300,Items={}},

},},	   
--[[171~180위--]]{171,180,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=5350,LP=300,Items={}},

},},	   
--[[181~190위--]]{181,190,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=5330,LP=300,Items={}},

},},	   
--[[191~200위--]]{191,200,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=5310,LP=300,Items={}},

},},	   
--[[201~210위--]]{201,210,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=5290,LP=300,Items={}},

},},	   
--[[211~220위--]]{211,220,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=5270,LP=300,Items={}},

},},	   
--[[221~230위--]]{221,230,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=5250,LP=300,Items={}},

},},	   
--[[231~240위--]]{231,240,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=5230,LP=300,Items={}},

},},	   
--[[241~250위--]]{241,250,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=5210,LP=300,Items={}},

},},	   
--[[251~260위--]]{251,260,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=5190,LP=300,Items={}},

},},	   
--[[261~270위--]]{261,270,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=5170,LP=300,Items={}},

},},	   
--[[271~280위--]]{271,280,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=5150,LP=300,Items={}},

},},	   
--[[281~290위--]]{281,290,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=5130,LP=300,Items={}},

},},	   
--[[291~300위--]]{291,300,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=5110,LP=300,Items={}},

},},	   
--[[301~310위--]]{301,310,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=5090,LP=300,Items={}},

},},	   
--[[311~320위--]]{311,320,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=5070,LP=300,Items={}},

},},	   
--[[321~330위--]]{321,330,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=5050,LP=300,Items={}},

},},	   
--[[331~340위--]]{331,340,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=5030,LP=300,Items={}},

},},	   
--[[341~350위--]]{341,350,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=5010,LP=300,Items={}},

},},	   
--[[351~360위--]]{351,360,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=4990,LP=300,Items={}},

},},	   
--[[361~370위--]]{361,370,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=4970,LP=300,Items={}},

},},	   
--[[371~380위--]]{371,380,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=4950,LP=300,Items={}},

},},	   
--[[381~390위--]]{381,390,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=4930,LP=300,Items={}},

},},	   
--[[391~400위--]]{391,400,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=4910,LP=300,Items={}},

},},	   
--[[401~410위--]]{401,410,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=4890,LP=300,Items={}},

},},	   
--[[411~420위--]]{411,420,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=4870,LP=300,Items={}},

},},	   
--[[421~430위--]]{421,430,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=4850,LP=300,Items={}},

},},	   
--[[431~440위--]]{431,440,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=4830,LP=300,Items={}},

},},	   
--[[441~450위--]]{441,450,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=4810,LP=300,Items={}},

},},	   
--[[451~460위--]]{451,460,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=4790,LP=300,Items={}},

},},	   
--[[461~470위--]]{461,470,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=4770,LP=300,Items={}},

},},	   
--[[471~480위--]]{471,480,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=4750,LP=300,Items={}},

},},	   
--[[481~490위--]]{481,490,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=4730,LP=300,Items={}},

},},	   
--[[491~500위--]]{491,500,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=4710,LP=300,Items={}},

},},	   
--[[501~510위--]]{501,510,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=4690,LP=250,Items={}},

},},	   
--[[511~520위--]]{511,520,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=4670,LP=250,Items={}},

},},	   
--[[521~530위--]]{521,530,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=4650,LP=250,Items={}},

},},	   
--[[531~540위--]]{531,540,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=4630,LP=250,Items={}},

},},	   
--[[541~550위--]]{541,550,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=4610,LP=250,Items={}},

},},	   
--[[551~560위--]]{551,560,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=4590,LP=250,Items={}},

},},	   
--[[561~570위--]]{561,570,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=4570,LP=250,Items={}},

},},	   
--[[571~580위--]]{571,580,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=4550,LP=250,Items={}},

},},	   
--[[581~590위--]]{581,590,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=4530,LP=250,Items={}},

},},	   
--[[591~600위--]]{591,600,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=4510,LP=250,Items={}},

},},	   
--[[601~610위--]]{601,610,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=4490,LP=250,Items={}},

},},	   
--[[611~620위--]]{611,620,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=4470,LP=250,Items={}},

},},	   
--[[621~630위--]]{621,630,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=4450,LP=250,Items={}},

},},	   
--[[631~640위--]]{631,640,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=4430,LP=250,Items={}},

},},	   
--[[641~650위--]]{641,650,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=4410,LP=250,Items={}},

},},	   
--[[651~660위--]]{651,660,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=4390,LP=250,Items={}},

},},	   
--[[661~670위--]]{661,670,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=4370,LP=250,Items={}},

},},	   
--[[671~680위--]]{671,680,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=4350,LP=250,Items={}},

},},	   
--[[681~690위--]]{681,690,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=4330,LP=250,Items={}},

},},	   
--[[691~700위--]]{691,700,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=4310,LP=250,Items={}},

},},	   
--[[701~710위--]]{701,710,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=4290,LP=250,Items={}},

},},	   
--[[711~720위--]]{711,720,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=4270,LP=250,Items={}},

},},	   
--[[721~730위--]]{721,730,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=4250,LP=250,Items={}},

},},	   
--[[731~740위--]]{731,740,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=4230,LP=250,Items={}},

},},	   
--[[741~750위--]]{741,750,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=4210,LP=250,Items={}},

},},	   
--[[751~760위--]]{751,760,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=4190,LP=200,Items={}},

},},	   
--[[761~770위--]]{761,770,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=4170,LP=200,Items={}},

},},	   
--[[771~780위--]]{771,780,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=4150,LP=200,Items={}},

},},	   
--[[781~790위--]]{781,790,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=4130,LP=200,Items={}},

},},	   
--[[791~800위--]]{791,800,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=4110,LP=200,Items={}},

},},	   
--[[801~810위--]]{801,810,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=4090,LP=200,Items={}},

},},	   
--[[811~820위--]]{811,820,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=4070,LP=200,Items={}},

},},	   
--[[821~830위--]]{821,830,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=4050,LP=200,Items={}},

},},	   
--[[831~840위--]]{831,840,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=4030,LP=200,Items={}},

},},	   
--[[841~850위--]]{841,850,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=4010,LP=200,Items={}},

},},	   
--[[851~860위--]]{851,860,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3990,LP=200,Items={}},

},},	   
--[[861~870위--]]{861,870,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3970,LP=200,Items={}},

},},	   
--[[871~880위--]]{871,880,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3950,LP=200,Items={}},

},},	   
--[[881~890위--]]{881,890,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3930,LP=200,Items={}},

},},	   
--[[891~900위--]]{891,900,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3910,LP=200,Items={}},

},},	   
--[[901~910위--]]{901,910,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3890,LP=200,Items={}},

},},	   
--[[911~920위--]]{911,920,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3870,LP=200,Items={}},

},},	   
--[[921~930위--]]{921,930,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3850,LP=200,Items={}},

},},	   
--[[931~940위--]]{931,940,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3830,LP=200,Items={}},

},},	   
--[[941~950위--]]{941,950,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3810,LP=200,Items={}},

},},	   
--[[951~960위--]]{951,960,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3790,LP=200,Items={}},

},},	   
--[[961~970위--]]{961,970,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3770,LP=200,Items={}},

},},	   
--[[971~980위--]]{971,980,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3750,LP=200,Items={}},

},},	   
--[[981~990위--]]{981,990,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3730,LP=200,Items={}},

},},	   
--[[991~1000위--]]{991,1000,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3710,LP=150,Items={}},

},},	   
--[[1001~1050위--]]{1001,1050,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3703,LP=150,Items={}},

},},	   
--[[1051~1100위--]]{1051,1100,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3696,LP=150,Items={}},

},},	   
--[[1101~1150위--]]{1101,1150,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3689,LP=150,Items={}},

},},	   
--[[1151~1200위--]]{1151,1200,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3682,LP=150,Items={}},

},},	   
--[[1201~1250위--]]{1201,1250,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3675,LP=150,Items={}},

},},	   
--[[1251~1300위--]]{1251,1300,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3668,LP=150,Items={}},

},},	   
--[[1301~1350위--]]{1301,1350,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3661,LP=150,Items={}},

},},	   
--[[1351~1400위--]]{1351,1400,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3654,LP=150,Items={}},

},},	   
--[[1401~1450위--]]{1401,1450,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3647,LP=150,Items={}},

},},	   
--[[1451~1500위--]]{1451,1500,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3640,LP=150,Items={}},

},},	   
--[[1501~1550위--]]{1501,1550,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3633,LP=150,Items={}},

},},	   
--[[1551~1600위--]]{1551,1600,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3626,LP=150,Items={}},

},},	   
--[[1601~1650위--]]{1601,1650,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3619,LP=150,Items={}},

},},	   
--[[1651~1700위--]]{1651,1700,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3612,LP=150,Items={}},

},},	   
--[[1701~1750위--]]{1701,1750,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3605,LP=150,Items={}},

},},	   
--[[1751~1800위--]]{1751,1800,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3598,LP=150,Items={}},

},},	   
--[[1801~1850위--]]{1801,1850,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3591,LP=150,Items={}},

},},	   
--[[1851~1900위--]]{1851,1900,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3584,LP=150,Items={}},

},},	   
--[[1901~1950위--]]{1901,1950,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3577,LP=150,Items={}},

},},	   
--[[1951~2000위--]]{1951,2000,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3570,LP=150,Items={}},

},},	   
--[[2001~2050위--]]{2001,2050,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3563,LP=150,Items={}},

},},	   
--[[2051~2100위--]]{2051,2100,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3556,LP=150,Items={}},

},},	   
--[[2101~2150위--]]{2101,2150,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3549,LP=150,Items={}},

},},	   
--[[2151~2200위--]]{2151,2200,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3542,LP=150,Items={}},

},},	   
--[[2201~2250위--]]{2201,2250,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3535,LP=150,Items={}},

},},	   
--[[2251~2300위--]]{2251,2300,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3528,LP=150,Items={}},

},},	   
--[[2301~2350위--]]{2301,2350,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3521,LP=150,Items={}},

},},	   
--[[2351~2400위--]]{2351,2400,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3514,LP=150,Items={}},

},},	   
--[[2401~2450위--]]{2401,2450,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3507,LP=150,Items={}},

},},	   
--[[2451~2500위--]]{2451,2500,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3500,LP=150,Items={}},

},},	   
--[[2501~2550위--]]{2501,2550,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3493,LP=120,Items={}},

},},	   
--[[2551~2600위--]]{2551,2600,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3486,LP=120,Items={}},

},},	   
--[[2601~2650위--]]{2601,2650,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3479,LP=120,Items={}},

},},	   
--[[2651~2700위--]]{2651,2700,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3472,LP=120,Items={}},

},},	   
--[[2701~2750위--]]{2701,2750,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3465,LP=120,Items={}},

},},	   
--[[2751~2800위--]]{2751,2800,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3458,LP=120,Items={}},

},},	   
--[[2801~2850위--]]{2801,2850,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3451,LP=120,Items={}},

},},	   
--[[2851~2900위--]]{2851,2900,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3444,LP=120,Items={}},

},},	   
--[[2901~2950위--]]{2901,2950,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3437,LP=120,Items={}},

},},	   
--[[2951~3000위--]]{2951,3000,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3430,LP=120,Items={}},

},},	   
--[[3001~3050위--]]{3001,3050,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3423,LP=120,Items={}},

},},	   
--[[3051~3100위--]]{3051,3100,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3416,LP=120,Items={}},

},},	   
--[[3101~3150위--]]{3101,3150,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3409,LP=120,Items={}},

},},	   
--[[3151~3200위--]]{3151,3200,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3402,LP=120,Items={}},

},},	   
--[[3201~3250위--]]{3201,3250,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3395,LP=120,Items={}},

},},	   
--[[3251~3300위--]]{3251,3300,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3388,LP=120,Items={}},

},},	   
--[[3301~3350위--]]{3301,3350,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3381,LP=120,Items={}},

},},	   
--[[3351~3400위--]]{3351,3400,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3374,LP=120,Items={}},

},},	   
--[[3401~3450위--]]{3401,3450,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3367,LP=120,Items={}},

},},	   
--[[3451~3500위--]]{3451,3500,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3360,LP=120,Items={}},

},},	   
--[[3501~3550위--]]{3501,3550,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3353,LP=120,Items={}},

},},	   
--[[3551~3600위--]]{3551,3600,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3346,LP=120,Items={}},

},},	   
--[[3601~3650위--]]{3601,3650,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3339,LP=120,Items={}},

},},	   
--[[3651~3700위--]]{3651,3700,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3332,LP=120,Items={}},

},},	   
--[[3701~3750위--]]{3701,3750,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3325,LP=120,Items={}},

},},	   
--[[3751~3800위--]]{3751,3800,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3318,LP=120,Items={}},

},},	   
--[[3801~3850위--]]{3801,3850,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3311,LP=120,Items={}},

},},	   
--[[3851~3900위--]]{3851,3900,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3304,LP=120,Items={}},

},},	   
--[[3901~3950위--]]{3901,3950,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3297,LP=120,Items={}},

},},	   
--[[3951~4000위--]]{3951,4000,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3290,LP=120,Items={}},

},},	   
--[[4001~4050위--]]{4001,4050,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3283,LP=120,Items={}},

},},	   
--[[4051~4100위--]]{4051,4100,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3276,LP=120,Items={}},

},},	   
--[[4101~4150위--]]{4101,4150,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3269,LP=120,Items={}},

},},	   
--[[4151~4200위--]]{4151,4200,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3262,LP=120,Items={}},

},},	   
--[[4201~4250위--]]{4201,4250,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3255,LP=120,Items={}},

},},	   
--[[4251~4300위--]]{4251,4300,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3248,LP=120,Items={}},

},},	   
--[[4301~4350위--]]{4301,4350,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3241,LP=120,Items={}},

},},	   
--[[4351~4400위--]]{4351,4400,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3234,LP=120,Items={}},

},},	   
--[[4401~4450위--]]{4401,4450,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3227,LP=120,Items={}},

},},	   
--[[4451~4500위--]]{4451,4500,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3220,LP=120,Items={}},

},},	   
--[[4501~4550위--]]{4501,4550,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3213,LP=120,Items={}},

},},	   
--[[4551~4600위--]]{4551,4600,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3206,LP=120,Items={}},

},},	   
--[[4601~4650위--]]{4601,4650,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3199,LP=120,Items={}},

},},	   
--[[4651~4700위--]]{4651,4700,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3192,LP=120,Items={}},

},},	   
--[[4701~4750위--]]{4701,4750,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3185,LP=120,Items={}},

},},	   
--[[4751~4800위--]]{4751,4800,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3178,LP=120,Items={}},

},},	   
--[[4801~4850위--]]{4801,4850,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3171,LP=120,Items={}},

},},	   
--[[4851~4900위--]]{4851,4900,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3164,LP=120,Items={}},

},},	   
--[[4901~4950위--]]{4901,4950,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3157,LP=120,Items={}},

},},	   
--[[4951~5000위--]]{4951,5000,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3150,LP=120,Items={}},

},},	   
--[[5001~5100위--]]{5001,5100,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3136,LP=80,Items={}},

},},	   
--[[5101~5200위--]]{5101,5200,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3132,LP=80,Items={}},

},},	   
--[[5201~5300위--]]{5201,5300,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3128,LP=80,Items={}},

},},	   
--[[5301~5400위--]]{5301,5400,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3124,LP=80,Items={}},

},},	   
--[[5401~5500위--]]{5401,5500,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3120,LP=80,Items={}},

},},	   
--[[5501~5600위--]]{5501,5600,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3116,LP=80,Items={}},

},},	   
--[[5601~5700위--]]{5601,5700,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3112,LP=80,Items={}},

},},	   
--[[5701~5800위--]]{5701,5800,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3108,LP=80,Items={}},

},},	   
--[[5801~5900위--]]{5801,5900,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3104,LP=80,Items={}},

},},	   
--[[5901~6000위--]]{5901,6000,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3100,LP=80,Items={}},

},},	   
--[[6001~6100위--]]{6001,6100,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3096,LP=80,Items={}},

},},	   
--[[6101~6200위--]]{6101,6200,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3092,LP=80,Items={}},

},},	   
--[[6201~6300위--]]{6201,6300,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3088,LP=80,Items={}},

},},	   
--[[6301~6400위--]]{6301,6400,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3084,LP=80,Items={}},

},},	   
--[[6401~6500위--]]{6401,6500,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3080,LP=80,Items={}},

},},	   
--[[6501~6600위--]]{6501,6600,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3076,LP=80,Items={}},

},},	   
--[[6601~6700위--]]{6601,6700,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3072,LP=80,Items={}},

},},	   
--[[6701~6800위--]]{6701,6800,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3068,LP=80,Items={}},

},},	   
--[[6801~6900위--]]{6801,6900,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3064,LP=80,Items={}},

},},	   
--[[6901~7000위--]]{6901,7000,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3060,LP=80,Items={}},

},},	   
--[[7001~7100위--]]{7001,7100,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3056,LP=80,Items={}},

},},	   
--[[7101~7200위--]]{7101,7200,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3052,LP=80,Items={}},

},},	   
--[[7201~7300위--]]{7201,7300,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3048,LP=80,Items={}},

},},	   
--[[7301~7400위--]]{7301,7400,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3044,LP=80,Items={}},

},},	   
--[[7401~7500위--]]{7401,7500,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3040,LP=80,Items={}},

},},	   
--[[7501~7600위--]]{7501,7600,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3036,LP=80,Items={}},

},},	   
--[[7601~7700위--]]{7601,7700,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3032,LP=80,Items={}},

},},	   
--[[7701~7800위--]]{7701,7800,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3028,LP=80,Items={}},

},},	   
--[[7801~7900위--]]{7801,7900,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3024,LP=80,Items={}},

},},	   
--[[7901~8000위--]]{7901,8000,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3020,LP=80,Items={}},

},},	   
--[[8001~8100위--]]{8001,8100,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3016,LP=80,Items={}},

},},	   
--[[8101~8200위--]]{8101,8200,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3012,LP=80,Items={}},

},},	   
--[[8201~8300위--]]{8201,8300,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3008,LP=80,Items={}},

},},	   
--[[8301~8400위--]]{8301,8400,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3004,LP=80,Items={}},

},},	   
--[[8401~8500위--]]{8401,8500,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=3000,LP=80,Items={}},

},},	   
--[[8501~8600위--]]{8501,8600,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2996,LP=80,Items={}},

},},	   
--[[8601~8700위--]]{8601,8700,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2992,LP=80,Items={}},

},},	   
--[[8701~8800위--]]{8701,8800,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2988,LP=80,Items={}},

},},	   
--[[8801~8900위--]]{8801,8900,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2984,LP=80,Items={}},

},},	   
--[[8901~9000위--]]{8901,9000,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2980,LP=80,Items={}},

},},	   
--[[9001~9100위--]]{9001,9100,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2976,LP=80,Items={}},

},},	   
--[[9101~9200위--]]{9101,9200,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2972,LP=80,Items={}},

},},	   
--[[9201~9300위--]]{9201,9300,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2968,LP=80,Items={}},

},},	   
--[[9301~9400위--]]{9301,9400,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2964,LP=80,Items={}},

},},	   
--[[9401~9500위--]]{9401,9500,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2960,LP=80,Items={}},

},},	   
--[[9501~9600위--]]{9501,9600,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2956,LP=80,Items={}},

},},	   
--[[9601~9700위--]]{9601,9700,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2952,LP=80,Items={}},

},},	   
--[[9701~9800위--]]{9701,9800,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2948,LP=80,Items={}},

},},	   
--[[9801~9900위--]]{9801,9900,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2944,LP=80,Items={}},

},},	   
--[[9901~10000위--]]{9901,10000,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2940,LP=80,Items={}},

},},	   
--[[10001~10200위--]]{10001,10200,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2936,LP=50,Items={}},

},},	   
--[[10201~10400위--]]{10201,10400,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2932,LP=50,Items={}},

},},	   
--[[10401~10600위--]]{10401,10600,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2928,LP=50,Items={}},

},},	 

 
--[[10601~10800위--]]{10601,10800,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2924,LP=50,Items={}},

},},	   
--[[10801~11000위--]]{10801,11000,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2920,LP=50,Items={}},

},},	   
--[[11001~11200위--]]{11001,11200,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2916,LP=50,Items={}},

},},	   
--[[11201~11400위--]]{11201,11400,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2912,LP=50,Items={}},

},},	   
--[[11401~11600위--]]{11401,11600,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2908,LP=50,Items={}},

},},	   
--[[11601~11800위--]]{11601,11800,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2904,LP=50,Items={}},

},},	   
--[[11801~12000위--]]{11801,12000,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2900,LP=50,Items={}},

},},	   
--[[12001~12200위--]]{12001,12200,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2896,LP=50,Items={}},

},},	   
--[[12201~12400위--]]{12201,12400,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2892,LP=50,Items={}},

},},	   
--[[12401~12600위--]]{12401,12600,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2888,LP=50,Items={}},

},},	   
--[[12601~12800위--]]{12601,12800,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2884,LP=50,Items={}},

},},	   
--[[12801~13000위--]]{12801,13000,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2880,LP=50,Items={}},

},},	   
--[[13001~13200위--]]{13001,13200,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2876,LP=50,Items={}},

},},	   
--[[13201~13400위--]]{13201,13400,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2872,LP=50,Items={}},

},},	   
--[[13401~13600위--]]{13401,13600,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2868,LP=50,Items={}},

},},	   
--[[13601~13800위--]]{13601,13800,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2864,LP=50,Items={}},

},},	   
--[[13801~14000위--]]{13801,14000,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2860,LP=50,Items={}},

},},	   
--[[14001~14200위--]]{14001,14200,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2856,LP=50,Items={}},

},},	   
--[[14201~14400위--]]{14201,14400,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2852,LP=50,Items={}},

},},	   
--[[14401~14600위--]]{14401,14600,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2848,LP=50,Items={}},

},},	   
--[[14601~14800위--]]{14601,14800,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2844,LP=50,Items={}},

},},	   
--[[14801~15000위--]]{14801,15000,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2840,LP=50,Items={}},

},},	   
--[[15001~15200위--]]{15001,15200,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2836,LP=50,Items={}},

},},	   
--[[15201~15400위--]]{15201,15400,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2832,LP=50,Items={}},

},},	   
--[[15401~15600위--]]{15401,15600,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2828,LP=50,Items={}},

},},	   
--[[15601~15800위--]]{15601,15800,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2824,LP=50,Items={}},

},},	   
--[[15801~16000위--]]{15801,16000,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2820,LP=50,Items={}},

},},	   
--[[16001~16200위--]]{16001,16200,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2816,LP=50,Items={}},

},},	   
--[[16201~16400위--]]{16201,16400,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2812,LP=50,Items={}},

},},	   
--[[16401~16600위--]]{16401,16600,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2808,LP=50,Items={}},

},},	   
--[[16601~16800위--]]{16601,16800,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2804,LP=50,Items={}},

},},	   
--[[16801~17000위--]]{16801,17000,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2800,LP=50,Items={}},

},},	   
--[[17001~17200위--]]{17001,17200,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2796,LP=50,Items={}},

},},	   
--[[17201~17400위--]]{17201,17400,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2792,LP=50,Items={}},

},},	   
--[[17401~17600위--]]{17401,17600,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2788,LP=50,Items={}},

},},	   
--[[17601~17800위--]]{17601,17800,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2784,LP=50,Items={}},

},},	   
--[[17801~18000위--]]{17801,18000,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2780,LP=50,Items={}},

},},	   
--[[18001~18200위--]]{18001,18200,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2776,LP=50,Items={}},

},},	   
--[[18201~18400위--]]{18201,18400,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2772,LP=50,Items={}},

},},	   
--[[18401~18600위--]]{18401,18600,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2768,LP=50,Items={}},

},},	   
--[[18601~18800위--]]{18601,18800,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2764,LP=50,Items={}},

},},	   
--[[18801~19000위--]]{18801,19000,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2760,LP=50,Items={}},

},},	   
--[[19001~19200위--]]{19001,19200,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2756,LP=50,Items={}},

},},	   
--[[19201~19400위--]]{19201,19400,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2752,LP=50,Items={}},

},},	   
--[[19401~19600위--]]{19401,19600,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2748,LP=50,Items={}},

},},	   
--[[19601~19800위--]]{19601,19800,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2744,LP=50,Items={}},

},},	   
--[[19801~20000위--]]{19801,20000,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2740,LP=50,Items={}},

},},	   
--[[20001~20500위--]]{20001,20500,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2736,LP=50,Items={}},

},},	   
--[[20501~21000위--]]{20501,21000,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2732,LP=50,Items={}},

},},	   
--[[21001~21500위--]]{21001,21500,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2728,LP=50,Items={}},

},},	   
--[[21501~22000위--]]{21501,22000,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2724,LP=50,Items={}},

},},	   
--[[22001~22500위--]]{22001,22500,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2720,LP=50,Items={}},

},},	   
--[[22501~23000위--]]{22501,23000,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2716,LP=50,Items={}},

},},	   
--[[23001~23500위--]]{23001,23500,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2712,LP=50,Items={}},

},},	   
--[[23501~24000위--]]{23501,24000,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2708,LP=50,Items={}},

},},	   
--[[24001~24500위--]]{24001,24500,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2704,LP=50,Items={}},

},},	   
--[[24501~25000위--]]{24501,25000,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2700,LP=50,Items={}},

},},	   
--[[25001~25500위--]]{25001,25500,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2696,LP=50,Items={}},

},},	   
--[[25501~26000위--]]{25501,26000,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2692,LP=50,Items={}},

},},	   
--[[26001~26500위--]]{26001,26500,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2688,LP=50,Items={}},

},},	   
--[[26501~27000위--]]{26501,27000,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2684,LP=50,Items={}},

},},	   
--[[27001~27500위--]]{27001,27500,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2680,LP=50,Items={}},

},},	   
--[[27501~28000위--]]{27501,28000,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2676,LP=50,Items={}},

},},	   
--[[28001~28500위--]]{28001,28500,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2672,LP=50,Items={}},

},},	   
--[[28501~29000위--]]{28501,29000,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2668,LP=50,Items={}},

},},	   
--[[29001~29500위--]]{29001,29500,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2664,LP=50,Items={}},

},},	   
--[[29501~30000위--]]{29501,30000,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2660,LP=50,Items={}},

},},	   
--[[30001~30500위--]]{30001,30500,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2656,LP=50,Items={}},

},},	   
--[[30501~31000위--]]{30501,31000,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2652,LP=50,Items={}},

},},	   
--[[31001~31500위--]]{31001,31500,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2648,LP=50,Items={}},

},},	   
--[[31501~32000위--]]{31501,32000,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2644,LP=50,Items={}},

},},	   
--[[32001~32500위--]]{32001,32500,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2640,LP=50,Items={}},

},},	   
--[[32501~33000위--]]{32501,33000,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2636,LP=50,Items={}},

},},	   
--[[33001~33500위--]]{33001,33500,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2632,LP=50,Items={}},

},},	   
--[[33501~34000위--]]{33501,34000,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2628,LP=50,Items={}},

},},	   
--[[34001~34500위--]]{34001,34500,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2624,LP=50,Items={}},

},},	   
--[[34501~35000위--]]{34501,35000,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2620,LP=50,Items={}},

},},	   
--[[35001~35500위--]]{35001,35500,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2616,LP=50,Items={}},

},},	   
--[[35501~36000위--]]{35501,36000,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2612,LP=50,Items={}},

},},	   
--[[36001~36500위--]]{36001,36500,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2608,LP=50,Items={}},

},},	   
--[[36501~37000위--]]{36501,37000,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2604,LP=50,Items={}},

},},	   
--[[37001~37500위--]]{37001,37500,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2600,LP=50,Items={}},

},},	   
--[[37501~38000위--]]{37501,38000,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2596,LP=50,Items={}},

},},	   
--[[38001~38500위--]]{38001,38500,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2592,LP=50,Items={}},

},},	   
--[[38501~39000위--]]{38501,39000,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2588,LP=50,Items={}},

},},	   
--[[39001~39500위--]]{39001,39500,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2584,LP=50,Items={}},

},},	   
--[[39501~40000위--]]{39501,40000,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2580,LP=50,Items={}},

},},	   
--[[40001~40500위--]]{40001,40500,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2576,LP=50,Items={}},

},},	   
--[[40501~41000위--]]{40501,41000,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2572,LP=50,Items={}},

},},	   
--[[41001~41500위--]]{41001,41500,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2568,LP=50,Items={}},

},},	   
--[[41501~42000위--]]{41501,42000,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2564,LP=50,Items={}},

},},	   
--[[42001~42500위--]]{42001,42500,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2560,LP=50,Items={}},

},},	   
--[[42501~43000위--]]{42501,43000,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2556,LP=50,Items={}},

},},	   
--[[43001~43500위--]]{43001,43500,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2552,LP=50,Items={}},

},},	   
--[[43501~44000위--]]{43501,44000,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2548,LP=50,Items={}},

},},	   
--[[44001~44500위--]]{44001,44500,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2544,LP=50,Items={}},

},},	   
--[[44501~45000위--]]{44501,45000,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2540,LP=50,Items={}},

},},	   
--[[45001~45500위--]]{45001,45500,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2536,LP=50,Items={}},

},},	   
--[[45501~46000위--]]{45501,46000,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2532,LP=50,Items={}},

},},	   
--[[46001~46500위--]]{46001,46500,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2528,LP=50,Items={}},

},},	   
--[[46501~47000위--]]{46501,47000,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2524,LP=50,Items={}},

},},	   
--[[47001~47500위--]]{47001,47500,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2520,LP=50,Items={}},

},},	   
--[[47501~48000위--]]{47501,48000,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2516,LP=50,Items={}},

},},	   
--[[48001~48500위--]]{48001,48500,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2512,LP=50,Items={}},

},},	   
--[[48501~49000위--]]{48501,49000,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2508,LP=50,Items={}},

},},	   
--[[49001~49500위--]]{49001,49500,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2504,LP=50,Items={}},

},},	   
--[[49501~50000위--]]{49501,50000,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2500,LP=50,Items={}},

},},	   
--[[50001~100000위--]]{50001,100000,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=2000,LP=50,Items={}},

},},	   
--[[100001~200000위--]]{100001,200000,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=1500,LP=0,Items={}},

},},	   
--[[200001~500000위--]]{200001,500000,
  byLvl = {
{MinLvl = 1, MaxLvl= 40,Recon=1000,LP=0,Items={}},

},},	 



}

function PvpInit()
	local idx, match
	for idx, match in pairs(PvpMatch) do
		PvpManager:InsertMatch(match[1], match[2], match[3])
		
		local idx_, valLvl_
		for idx_, valLvl_ in pairs(match.byLvl) do
			PvpManager:InsertMatchRewardByLvl(match[1], match[2], valLvl_.MinLvl, valLvl_.MaxLvl, valLvl_.Recon, valLvl_.LP)
		end
	end
	
	PvpManager:SetDefaultMatch(PvpDefault, PvpDefaultRecon, PvpDefaultLP);
	
	PvpManager:SetDefenceReward(PvpDefenceRecon, PvpDefenceLP);
	
	--------------------------------------------------------------------
	--
	local idx2, reward
	for idx2, reward in pairs(PvpDailyReward) do
		PvpManager:InsertDailyReward(reward[1], reward[2])
		
		local idx3, valLvl
		for idx3, valLvl in pairs(reward.byLvl) do
			PvpManager:InsertDailyRewardByLvl(reward[1], reward[2], valLvl.MinLvl, valLvl.MaxLvl, valLvl.Recon, valLvl.LP)
			
			local idx4, item
			for idx4, item in pairs(valLvl.Items) do
				PvpManager:InsertDailyRewardItem(reward[1], reward[2], valLvl.MinLvl, valLvl.MaxLvl, item[1], item[2])
			end
		end
	end
end

------------------------------------------------------------------------------------------------------------
-- 일일보상 테이블
local ScoreBoardDailyReward = {
 
  
--[[1~1위--]]{1,1,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=35000,LP=0,Items={{33101,5},}},

},},
--[[2~2위--]]{2,2,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=25000,LP=0,Items={{33101,5},}},

},},
--[[3~3위--]]{3,3,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=23000,LP=0,Items={{33101,5},}},

},},
--[[4~4위--]]{4,4,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=21000,LP=0,Items={{33101,5},}},

},},
--[[5~5위--]]{5,5,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=20000,LP=0,Items={{33101,5},}},

},},
--[[6~6위--]]{6,6,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=19000,LP=0,Items={{33101,5},}},

},},
--[[7~7위--]]{7,7,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=18000,LP=0,Items={{33101,5},}},

},},
--[[8~8위--]]{8,8,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=17000,LP=0,Items={{33101,5},}},

},},
--[[9~9위--]]{9,9,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=16000,LP=0,Items={{33101,5},}},

},},
--[[10~10위--]]{10,10,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=15000,LP=0,Items={{33101,5},}},

},},
--[[11~11위--]]{11,11,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=14900,LP=0,Items={{33101,5},}},

},},
--[[12~12위--]]{12,12,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=14855,LP=0,Items={{33101,5},}},

},},
--[[13~13위--]]{13,13,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=14810,LP=0,Items={{33101,5},}},

},},
--[[14~14위--]]{14,14,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=14765,LP=0,Items={{33101,5},}},

},},
--[[15~15위--]]{15,15,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=14720,LP=0,Items={{33101,5},}},

},},
--[[16~16위--]]{16,16,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=14675,LP=0,Items={{33101,5},}},

},},
--[[17~17위--]]{17,17,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=14630,LP=0,Items={{33101,5},}},

},},
--[[18~18위--]]{18,18,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=14585,LP=0,Items={{33101,5},}},

},},
--[[19~19위--]]{19,19,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=14540,LP=0,Items={{33101,5},}},

},},
--[[20~20위--]]{20,20,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=14495,LP=0,Items={{33101,5},}},

},},
--[[21~21위--]]{21,21,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=14450,LP=0,Items={{33101,5},}},

},},
--[[22~22위--]]{22,22,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=14405,LP=0,Items={{33101,5},}},

},},
--[[23~23위--]]{23,23,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=14360,LP=0,Items={{33101,5},}},

},},
--[[24~24위--]]{24,24,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=14315,LP=0,Items={{33101,5},}},

},},
--[[25~25위--]]{25,25,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=14270,LP=0,Items={{33101,5},}},

},},
--[[26~26위--]]{26,26,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=14225,LP=0,Items={{33101,5},}},

},},
--[[27~27위--]]{27,27,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=14180,LP=0,Items={{33101,5},}},

},},
--[[28~28위--]]{28,28,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=14135,LP=0,Items={{33101,5},}},

},},
--[[29~29위--]]{29,29,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=14090,LP=0,Items={{33101,5},}},

},},
--[[30~30위--]]{30,30,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=14045,LP=0,Items={{33101,5},}},

},},
--[[31~31위--]]{31,31,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=14000,LP=0,Items={{33101,5},}},

},},
--[[32~32위--]]{32,32,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=13955,LP=0,Items={{33101,5},}},

},},
--[[33~33위--]]{33,33,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=13910,LP=0,Items={{33101,5},}},

},},
--[[34~34위--]]{34,34,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=13865,LP=0,Items={{33101,5},}},

},},
--[[35~35위--]]{35,35,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=13820,LP=0,Items={{33101,5},}},

},},
--[[36~36위--]]{36,36,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=13775,LP=0,Items={{33101,5},}},

},},
--[[37~37위--]]{37,37,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=13730,LP=0,Items={{33101,5},}},

},},
--[[38~38위--]]{38,38,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=13685,LP=0,Items={{33101,5},}},

},},
--[[39~39위--]]{39,39,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=13640,LP=0,Items={{33101,5},}},

},},
--[[40~40위--]]{40,40,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=13595,LP=0,Items={{33101,5},}},

},},
--[[41~41위--]]{41,41,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=13550,LP=0,Items={{33101,5},}},

},},
--[[42~42위--]]{42,42,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=13505,LP=0,Items={{33101,5},}},

},},
--[[43~43위--]]{43,43,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=13460,LP=0,Items={{33101,5},}},

},},
--[[44~44위--]]{44,44,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=13415,LP=0,Items={{33101,5},}},

},},
--[[45~45위--]]{45,45,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=13370,LP=0,Items={{33101,5},}},

},},
--[[46~46위--]]{46,46,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=13325,LP=0,Items={{33101,5},}},

},},
--[[47~47위--]]{47,47,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=13280,LP=0,Items={{33101,5},}},

},},
--[[48~48위--]]{48,48,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=13235,LP=0,Items={{33101,5},}},

},},
--[[49~49위--]]{49,49,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=13190,LP=0,Items={{33101,5},}},

},},
--[[50~50위--]]{50,50,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=13145,LP=0,Items={{33101,5},}},

},},
--[[51~51위--]]{51,51,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=13100,LP=0,Items={{33101,5},}},

},},
--[[52~52위--]]{52,52,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=13055,LP=0,Items={{33101,5},}},

},},
--[[53~53위--]]{53,53,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=13010,LP=0,Items={{33101,5},}},

},},
--[[54~54위--]]{54,54,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=12965,LP=0,Items={{33101,5},}},

},},
--[[55~55위--]]{55,55,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=12920,LP=0,Items={{33101,5},}},

},},
--[[56~56위--]]{56,56,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=12875,LP=0,Items={{33101,5},}},

},},
--[[57~57위--]]{57,57,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=12830,LP=0,Items={{33101,5},}},

},},
--[[58~58위--]]{58,58,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=12785,LP=0,Items={{33101,5},}},

},},
--[[59~59위--]]{59,59,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=12740,LP=0,Items={{33101,5},}},

},},
--[[60~60위--]]{60,60,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=12695,LP=0,Items={{33101,5},}},

},},
--[[61~61위--]]{61,61,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=12650,LP=0,Items={{33101,5},}},

},},
--[[62~62위--]]{62,62,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=12605,LP=0,Items={{33101,5},}},

},},
--[[63~63위--]]{63,63,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=12560,LP=0,Items={{33101,5},}},

},},
--[[64~64위--]]{64,64,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=12515,LP=0,Items={{33101,5},}},

},},
--[[65~65위--]]{65,65,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=12470,LP=0,Items={{33101,5},}},

},},
--[[66~66위--]]{66,66,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=12425,LP=0,Items={{33101,5},}},

},},
--[[67~67위--]]{67,67,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=12380,LP=0,Items={{33101,5},}},

},},
--[[68~68위--]]{68,68,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=12335,LP=0,Items={{33101,5},}},

},},
--[[69~69위--]]{69,69,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=12290,LP=0,Items={{33101,5},}},

},},
--[[70~70위--]]{70,70,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=12245,LP=0,Items={{33101,5},}},

},},
--[[71~71위--]]{71,71,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=12200,LP=0,Items={{33101,5},}},

},},
--[[72~72위--]]{72,72,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=12155,LP=0,Items={{33101,5},}},

},},
--[[73~73위--]]{73,73,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=12110,LP=0,Items={{33101,5},}},

},},
--[[74~74위--]]{74,74,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=12065,LP=0,Items={{33101,5},}},

},},
--[[75~75위--]]{75,75,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=12020,LP=0,Items={{33101,5},}},

},},
--[[76~76위--]]{76,76,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=11975,LP=0,Items={{33101,5},}},

},},
--[[77~77위--]]{77,77,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=11930,LP=0,Items={{33101,5},}},

},},
--[[78~78위--]]{78,78,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=11885,LP=0,Items={{33101,5},}},

},},
--[[79~79위--]]{79,79,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=11840,LP=0,Items={{33101,5},}},

},},
--[[80~80위--]]{80,80,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=11795,LP=0,Items={{33101,5},}},

},},
--[[81~81위--]]{81,81,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=11750,LP=0,Items={{33101,5},}},

},},
--[[82~82위--]]{82,82,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=11705,LP=0,Items={{33101,5},}},

},},
--[[83~83위--]]{83,83,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=11660,LP=0,Items={{33101,5},}},

},},
--[[84~84위--]]{84,84,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=11615,LP=0,Items={{33101,5},}},

},},
--[[85~85위--]]{85,85,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=11570,LP=0,Items={{33101,5},}},

},},
--[[86~86위--]]{86,86,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=11525,LP=0,Items={{33101,5},}},

},},
--[[87~87위--]]{87,87,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=11480,LP=0,Items={{33101,5},}},

},},
--[[88~88위--]]{88,88,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=11435,LP=0,Items={{33101,5},}},

},},
--[[89~89위--]]{89,89,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=11390,LP=0,Items={{33101,5},}},

},},
--[[90~90위--]]{90,90,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=11345,LP=0,Items={{33101,5},}},

},},
--[[91~91위--]]{91,91,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=11300,LP=0,Items={{33101,5},}},

},},
--[[92~92위--]]{92,92,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=11255,LP=0,Items={{33101,5},}},

},},
--[[93~93위--]]{93,93,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=11210,LP=0,Items={{33101,5},}},

},},
--[[94~94위--]]{94,94,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=11165,LP=0,Items={{33101,5},}},

},},
--[[95~95위--]]{95,95,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=11120,LP=0,Items={{33101,5},}},

},},
--[[96~96위--]]{96,96,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=11075,LP=0,Items={{33101,5},}},

},},
--[[97~97위--]]{97,97,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=11030,LP=0,Items={{33101,5},}},

},},
--[[98~98위--]]{98,98,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=10985,LP=0,Items={{33101,5},}},

},},
--[[99~99위--]]{99,99,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=10940,LP=0,Items={{33101,5},}},

},},
--[[100~100위--]]{100,100,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=10895,LP=0,Items={{33101,5},}},

},},
--[[101~105위--]]{101,105,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=10850,LP=0,Items={{33101,5},}},

},},
--[[106~110위--]]{106,110,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=10805,LP=0,Items={{33101,5},}},

},},
--[[111~115위--]]{111,115,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=10760,LP=0,Items={{33101,5},}},

},},
--[[116~120위--]]{116,120,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=10715,LP=0,Items={{33101,5},}},

},},
--[[121~125위--]]{121,125,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=10670,LP=0,Items={{33101,5},}},

},},
--[[126~130위--]]{126,130,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=10625,LP=0,Items={{33101,5},}},

},},
--[[131~135위--]]{131,135,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=10580,LP=0,Items={{33101,5},}},

},},
--[[136~140위--]]{136,140,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=10535,LP=0,Items={{33101,5},}},

},},
--[[141~145위--]]{141,145,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=10490,LP=0,Items={{33101,5},}},

},},
--[[146~150위--]]{146,150,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=10445,LP=0,Items={{33101,5},}},

},},
--[[151~155위--]]{151,155,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=10400,LP=0,Items={{33101,5},}},

},},
--[[156~160위--]]{156,160,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=10355,LP=0,Items={{33101,5},}},

},},
--[[161~165위--]]{161,165,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=10310,LP=0,Items={{33101,5},}},

},},
--[[166~170위--]]{166,170,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=10265,LP=0,Items={{33101,5},}},

},},
--[[171~175위--]]{171,175,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=10220,LP=0,Items={{33101,5},}},

},},
--[[176~180위--]]{176,180,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=10175,LP=0,Items={{33101,5},}},

},},
--[[181~185위--]]{181,185,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=10130,LP=0,Items={{33101,5},}},

},},
--[[186~190위--]]{186,190,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=10085,LP=0,Items={{33101,5},}},

},},
--[[191~195위--]]{191,195,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=10040,LP=0,Items={{33101,5},}},

},},
--[[196~200위--]]{196,200,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=9995,LP=0,Items={{33101,5},}},

},},
--[[201~210위--]]{201,210,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=9950,LP=0,Items={{33101,3},}},

},},
--[[211~220위--]]{211,220,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=9905,LP=0,Items={{33101,3},}},

},},
--[[221~230위--]]{221,230,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=9860,LP=0,Items={{33101,3},}},

},},
--[[231~240위--]]{231,240,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=9815,LP=0,Items={{33101,3},}},

},},
--[[241~250위--]]{241,250,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=9770,LP=0,Items={{33101,3},}},

},},
--[[251~260위--]]{251,260,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=9725,LP=0,Items={{33101,3},}},

},},
--[[261~270위--]]{261,270,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=9680,LP=0,Items={{33101,3},}},

},},
--[[271~280위--]]{271,280,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=9635,LP=0,Items={{33101,3},}},

},},
--[[281~290위--]]{281,290,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=9590,LP=0,Items={{33101,3},}},

},},
--[[291~300위--]]{291,300,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=9545,LP=0,Items={{33101,3},}},

},},
--[[301~310위--]]{301,310,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=9500,LP=0,Items={{33101,3},}},

},},
--[[311~320위--]]{311,320,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=9455,LP=0,Items={{33101,3},}},

},},
--[[321~330위--]]{321,330,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=9410,LP=0,Items={{33101,3},}},

},},
--[[331~340위--]]{331,340,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=9365,LP=0,Items={{33101,3},}},

},},
--[[341~350위--]]{341,350,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=9320,LP=0,Items={{33101,3},}},

},},
--[[351~360위--]]{351,360,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=9275,LP=0,Items={{33101,3},}},

},},
--[[361~370위--]]{361,370,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=9230,LP=0,Items={{33101,3},}},

},},
--[[371~380위--]]{371,380,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=9185,LP=0,Items={{33101,3},}},

},},
--[[381~390위--]]{381,390,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=9140,LP=0,Items={{33101,3},}},

},},
--[[391~400위--]]{391,400,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=9095,LP=0,Items={{33101,3},}},

},},
--[[401~410위--]]{401,410,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=9050,LP=0,Items={{33101,3},}},

},},
--[[411~420위--]]{411,420,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=9005,LP=0,Items={{33101,3},}},

},},
--[[421~430위--]]{421,430,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=8960,LP=0,Items={{33101,3},}},

},},
--[[431~440위--]]{431,440,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=8915,LP=0,Items={{33101,3},}},

},},
--[[441~450위--]]{441,450,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=8870,LP=0,Items={{33101,3},}},

},},
--[[451~460위--]]{451,460,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=8825,LP=0,Items={{33101,3},}},

},},
--[[461~470위--]]{461,470,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=8780,LP=0,Items={{33101,3},}},

},},
--[[471~480위--]]{471,480,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=8735,LP=0,Items={{33101,3},}},

},},
--[[481~490위--]]{481,490,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=8690,LP=0,Items={{33101,3},}},

},},
--[[491~500위--]]{491,500,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=8645,LP=0,Items={{33101,3},}},

},},
--[[501~510위--]]{501,510,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=8600,LP=0,Items={{33101,2},}},

},},
--[[511~520위--]]{511,520,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=8555,LP=0,Items={{33101,2},}},

},},
--[[521~530위--]]{521,530,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=8510,LP=0,Items={{33101,2},}},

},},
--[[531~540위--]]{531,540,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=8465,LP=0,Items={{33101,2},}},

},},
--[[541~550위--]]{541,550,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=8420,LP=0,Items={{33101,2},}},

},},
--[[551~560위--]]{551,560,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=8375,LP=0,Items={{33101,2},}},

},},
--[[561~570위--]]{561,570,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=8330,LP=0,Items={{33101,2},}},

},},
--[[571~580위--]]{571,580,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=8285,LP=0,Items={{33101,2},}},

},},
--[[581~590위--]]{581,590,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=8240,LP=0,Items={{33101,2},}},

},},
--[[591~600위--]]{591,600,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=8195,LP=0,Items={{33101,2},}},

},},
--[[601~610위--]]{601,610,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=8150,LP=0,Items={{33101,2},}},

},},
--[[611~620위--]]{611,620,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=8105,LP=0,Items={{33101,2},}},

},},
--[[621~630위--]]{621,630,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=8060,LP=0,Items={{33101,2},}},

},},
--[[631~640위--]]{631,640,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=8015,LP=0,Items={{33101,2},}},

},},
--[[641~650위--]]{641,650,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=7970,LP=0,Items={{33101,2},}},

},},
--[[651~660위--]]{651,660,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=7925,LP=0,Items={{33101,2},}},

},},
--[[661~670위--]]{661,670,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=7880,LP=0,Items={{33101,2},}},

},},
--[[671~680위--]]{671,680,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=7835,LP=0,Items={{33101,2},}},

},},
--[[681~690위--]]{681,690,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=7790,LP=0,Items={{33101,2},}},

},},
--[[691~700위--]]{691,700,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=7745,LP=0,Items={{33101,2},}},

},},
--[[701~710위--]]{701,710,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=7700,LP=0,Items={{33101,2},}},

},},
--[[711~720위--]]{711,720,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=7655,LP=0,Items={{33101,2},}},

},},
--[[721~730위--]]{721,730,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=7610,LP=0,Items={{33101,2},}},

},},
--[[731~740위--]]{731,740,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=7565,LP=0,Items={{33101,2},}},

},},
--[[741~750위--]]{741,750,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=7520,LP=0,Items={{33101,2},}},

},},
--[[751~760위--]]{751,760,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=7475,LP=0,Items={{33101,2},}},

},},
--[[761~770위--]]{761,770,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=7430,LP=0,Items={{33101,2},}},

},},
--[[771~780위--]]{771,780,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=7385,LP=0,Items={{33101,2},}},

},},
--[[781~790위--]]{781,790,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=7340,LP=0,Items={{33101,2},}},

},},
--[[791~800위--]]{791,800,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=7295,LP=0,Items={{33101,2},}},

},},
--[[801~810위--]]{801,810,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=7250,LP=0,Items={{33101,2},}},

},},
--[[811~820위--]]{811,820,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=7205,LP=0,Items={{33101,2},}},

},},
--[[821~830위--]]{821,830,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=7160,LP=0,Items={{33101,2},}},

},},
--[[831~840위--]]{831,840,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=7115,LP=0,Items={{33101,2},}},

},},
--[[841~850위--]]{841,850,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=7070,LP=0,Items={{33101,2},}},

},},
--[[851~860위--]]{851,860,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=7025,LP=0,Items={{33101,2},}},

},},
--[[861~870위--]]{861,870,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=6980,LP=0,Items={{33101,2},}},

},},
--[[871~880위--]]{871,880,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=6935,LP=0,Items={{33101,2},}},

},},
--[[881~890위--]]{881,890,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=6890,LP=0,Items={{33101,2},}},

},},
--[[891~900위--]]{891,900,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=6845,LP=0,Items={{33101,2},}},

},},
--[[901~910위--]]{901,910,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=6800,LP=0,Items={{33101,2},}},

},},
--[[911~920위--]]{911,920,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=6755,LP=0,Items={{33101,2},}},

},},
--[[921~930위--]]{921,930,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=6710,LP=0,Items={{33101,2},}},

},},
--[[931~940위--]]{931,940,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=6665,LP=0,Items={{33101,2},}},

},},
--[[941~950위--]]{941,950,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=6620,LP=0,Items={{33101,2},}},

},},
--[[951~960위--]]{951,960,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=6575,LP=0,Items={{33101,2},}},

},},
--[[961~970위--]]{961,970,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=6530,LP=0,Items={{33101,2},}},

},},
--[[971~980위--]]{971,980,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=6485,LP=0,Items={{33101,2},}},

},},
--[[981~990위--]]{981,990,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=6440,LP=0,Items={{33101,2},}},

},},
--[[991~1000위--]]{991,1000,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=6395,LP=0,Items={{33101,2},}},

},},
--[[1001~1050위--]]{1001,1050,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=6350,LP=0,Items={{33101,1},}},

},},
--[[1051~1100위--]]{1051,1100,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=6305,LP=0,Items={{33101,1},}},

},},
--[[1101~1150위--]]{1101,1150,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=6260,LP=0,Items={{33101,1},}},

},},
--[[1151~1200위--]]{1151,1200,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=6215,LP=0,Items={{33101,1},}},

},},
--[[1201~1250위--]]{1201,1250,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=6170,LP=0,Items={{33101,1},}},

},},
--[[1251~1300위--]]{1251,1300,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=6125,LP=0,Items={{33101,1},}},

},},
--[[1301~1350위--]]{1301,1350,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=6080,LP=0,Items={{33101,1},}},

},},
--[[1351~1400위--]]{1351,1400,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=6035,LP=0,Items={{33101,1},}},

},},
--[[1401~1450위--]]{1401,1450,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=5990,LP=0,Items={{33101,1},}},

},},
--[[1451~1500위--]]{1451,1500,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=5945,LP=0,Items={{33101,1},}},

},},
--[[1501~1550위--]]{1501,1550,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=5900,LP=0,Items={}},

},},
--[[1551~1600위--]]{1551,1600,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=5870,LP=0,Items={}},

},},
--[[1601~1650위--]]{1601,1650,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=5840,LP=0,Items={}},

},},
--[[1651~1700위--]]{1651,1700,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=5810,LP=0,Items={}},

},},
--[[1701~1750위--]]{1701,1750,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=5780,LP=0,Items={}},

},},
--[[1751~1800위--]]{1751,1800,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=5750,LP=0,Items={}},

},},
--[[1801~1850위--]]{1801,1850,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=5720,LP=0,Items={}},

},},
--[[1851~1900위--]]{1851,1900,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=5690,LP=0,Items={}},

},},
--[[1901~1950위--]]{1901,1950,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=5660,LP=0,Items={}},

},},
--[[1951~2000위--]]{1951,2000,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=5630,LP=0,Items={}},

},},
--[[2001~2050위--]]{2001,2050,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=5600,LP=0,Items={}},

},},
--[[2051~2100위--]]{2051,2100,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=5570,LP=0,Items={}},

},},
--[[2101~2150위--]]{2101,2150,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=5540,LP=0,Items={}},

},},
--[[2151~2200위--]]{2151,2200,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=5510,LP=0,Items={}},

},},
--[[2201~2250위--]]{2201,2250,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=5480,LP=0,Items={}},

},},
--[[2251~2300위--]]{2251,2300,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=5450,LP=0,Items={}},

},},
--[[2301~2350위--]]{2301,2350,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=5420,LP=0,Items={}},

},},
--[[2351~2400위--]]{2351,2400,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=5390,LP=0,Items={}},

},},
--[[2401~2450위--]]{2401,2450,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=5360,LP=0,Items={}},

},},
--[[2451~2500위--]]{2451,2500,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=5330,LP=0,Items={}},

},},
--[[2501~2550위--]]{2501,2550,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=5300,LP=0,Items={}},

},},
--[[2551~2600위--]]{2551,2600,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=5290,LP=0,Items={}},

},},
--[[2601~2650위--]]{2601,2650,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=5280,LP=0,Items={}},

},},
--[[2651~2700위--]]{2651,2700,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=5270,LP=0,Items={}},

},},
--[[2701~2750위--]]{2701,2750,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=5260,LP=0,Items={}},

},},
--[[2751~2800위--]]{2751,2800,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=5250,LP=0,Items={}},

},},
--[[2801~2850위--]]{2801,2850,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=5240,LP=0,Items={}},

},},
--[[2851~2900위--]]{2851,2900,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=5230,LP=0,Items={}},

},},
--[[2901~2950위--]]{2901,2950,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=5220,LP=0,Items={}},

},},
--[[2951~3000위--]]{2951,3000,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=5210,LP=0,Items={}},

},},
--[[3001~3050위--]]{3001,3050,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=5200,LP=0,Items={}},

},},
--[[3051~3100위--]]{3051,3100,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=5190,LP=0,Items={}},

},},
--[[3101~3150위--]]{3101,3150,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=5180,LP=0,Items={}},

},},
--[[3151~3200위--]]{3151,3200,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=5170,LP=0,Items={}},

},},
--[[3201~3250위--]]{3201,3250,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=5160,LP=0,Items={}},

},},
--[[3251~3300위--]]{3251,3300,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=5150,LP=0,Items={}},

},},
--[[3301~3350위--]]{3301,3350,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=5140,LP=0,Items={}},

},},
--[[3351~3400위--]]{3351,3400,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=5130,LP=0,Items={}},

},},
--[[3401~3450위--]]{3401,3450,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=5120,LP=0,Items={}},

},},
--[[3451~3500위--]]{3451,3500,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=5110,LP=0,Items={}},

},},
--[[3501~3550위--]]{3501,3550,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=5100,LP=0,Items={}},

},},
--[[3551~3600위--]]{3551,3600,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=5090,LP=0,Items={}},

},},
--[[3601~3650위--]]{3601,3650,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=5080,LP=0,Items={}},

},},
--[[3651~3700위--]]{3651,3700,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=5070,LP=0,Items={}},

},},
--[[3701~3750위--]]{3701,3750,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=5060,LP=0,Items={}},

},},
--[[3751~3800위--]]{3751,3800,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=5050,LP=0,Items={}},

},},
--[[3801~3850위--]]{3801,3850,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=5040,LP=0,Items={}},

},},
--[[3851~3900위--]]{3851,3900,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=5030,LP=0,Items={}},

},},
--[[3901~3950위--]]{3901,3950,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=5020,LP=0,Items={}},

},},
--[[3951~4000위--]]{3951,4000,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=5010,LP=0,Items={}},

},},
--[[4001~4050위--]]{4001,4050,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=5000,LP=0,Items={}},

},},
--[[4051~4100위--]]{4051,4100,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4990,LP=0,Items={}},

},},
--[[4101~4150위--]]{4101,4150,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4980,LP=0,Items={}},

},},
--[[4151~4200위--]]{4151,4200,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4970,LP=0,Items={}},

},},
--[[4201~4250위--]]{4201,4250,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4960,LP=0,Items={}},

},},
--[[4251~4300위--]]{4251,4300,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4950,LP=0,Items={}},

},},
--[[4301~4350위--]]{4301,4350,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4940,LP=0,Items={}},

},},
--[[4351~4400위--]]{4351,4400,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4930,LP=0,Items={}},

},},
--[[4401~4450위--]]{4401,4450,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4920,LP=0,Items={}},

},},
--[[4451~4500위--]]{4451,4500,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4910,LP=0,Items={}},

},},
--[[4501~4550위--]]{4501,4550,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4900,LP=0,Items={}},

},},
--[[4551~4600위--]]{4551,4600,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4890,LP=0,Items={}},

},},
--[[4601~4650위--]]{4601,4650,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4880,LP=0,Items={}},

},},
--[[4651~4700위--]]{4651,4700,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4870,LP=0,Items={}},

},},
--[[4701~4750위--]]{4701,4750,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4860,LP=0,Items={}},

},},
--[[4751~4800위--]]{4751,4800,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4850,LP=0,Items={}},

},},
--[[4801~4850위--]]{4801,4850,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4840,LP=0,Items={}},

},},
--[[4851~4900위--]]{4851,4900,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4830,LP=0,Items={}},

},},
--[[4901~4950위--]]{4901,4950,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4820,LP=0,Items={}},

},},
--[[4951~5000위--]]{4951,5000,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4810,LP=0,Items={}},

},},
--[[5001~5100위--]]{5001,5100,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4800,LP=0,Items={}},

},},
--[[5101~5200위--]]{5101,5200,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4790,LP=0,Items={}},

},},
--[[5201~5300위--]]{5201,5300,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4780,LP=0,Items={}},

},},
--[[5301~5400위--]]{5301,5400,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4770,LP=0,Items={}},

},},
--[[5401~5500위--]]{5401,5500,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4760,LP=0,Items={}},

},},
--[[5501~5600위--]]{5501,5600,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4750,LP=0,Items={}},

},},
--[[5601~5700위--]]{5601,5700,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4740,LP=0,Items={}},

},},
--[[5701~5800위--]]{5701,5800,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4730,LP=0,Items={}},

},},
--[[5801~5900위--]]{5801,5900,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4720,LP=0,Items={}},

},},
--[[5901~6000위--]]{5901,6000,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4710,LP=0,Items={}},

},},
--[[6001~6100위--]]{6001,6100,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4700,LP=0,Items={}},

},},
--[[6101~6200위--]]{6101,6200,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4690,LP=0,Items={}},

},},
--[[6201~6300위--]]{6201,6300,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4680,LP=0,Items={}},

},},
--[[6301~6400위--]]{6301,6400,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4670,LP=0,Items={}},

},},
--[[6401~6500위--]]{6401,6500,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4660,LP=0,Items={}},

},},
--[[6501~6600위--]]{6501,6600,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4650,LP=0,Items={}},

},},
--[[6601~6700위--]]{6601,6700,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4640,LP=0,Items={}},

},},
--[[6701~6800위--]]{6701,6800,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4630,LP=0,Items={}},

},},
--[[6801~6900위--]]{6801,6900,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4620,LP=0,Items={}},

},},
--[[6901~7000위--]]{6901,7000,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4610,LP=0,Items={}},

},},
--[[7001~7100위--]]{7001,7100,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4600,LP=0,Items={}},

},},
--[[7101~7200위--]]{7101,7200,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4590,LP=0,Items={}},

},},
--[[7201~7300위--]]{7201,7300,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4580,LP=0,Items={}},

},},
--[[7301~7400위--]]{7301,7400,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4570,LP=0,Items={}},

},},
--[[7401~7500위--]]{7401,7500,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4560,LP=0,Items={}},

},},
--[[7501~7600위--]]{7501,7600,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4550,LP=0,Items={}},

},},
--[[7601~7700위--]]{7601,7700,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4540,LP=0,Items={}},

},},
--[[7701~7800위--]]{7701,7800,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4530,LP=0,Items={}},

},},
--[[7801~7900위--]]{7801,7900,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4520,LP=0,Items={}},

},},
--[[7901~8000위--]]{7901,8000,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4510,LP=0,Items={}},

},},
--[[8001~8100위--]]{8001,8100,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4500,LP=0,Items={}},

},},
--[[8101~8200위--]]{8101,8200,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4490,LP=0,Items={}},

},},
--[[8201~8300위--]]{8201,8300,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4480,LP=0,Items={}},

},},
--[[8301~8400위--]]{8301,8400,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4470,LP=0,Items={}},

},},
--[[8401~8500위--]]{8401,8500,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4460,LP=0,Items={}},

},},
--[[8501~8600위--]]{8501,8600,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4450,LP=0,Items={}},

},},
--[[8601~8700위--]]{8601,8700,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4440,LP=0,Items={}},

},},
--[[8701~8800위--]]{8701,8800,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4430,LP=0,Items={}},

},},
--[[8801~8900위--]]{8801,8900,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4420,LP=0,Items={}},

},},
--[[8901~9000위--]]{8901,9000,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4410,LP=0,Items={}},

},},
--[[9001~9100위--]]{9001,9100,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4400,LP=0,Items={}},

},},
--[[9101~9200위--]]{9101,9200,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4390,LP=0,Items={}},

},},
--[[9201~9300위--]]{9201,9300,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4380,LP=0,Items={}},

},},
--[[9301~9400위--]]{9301,9400,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4370,LP=0,Items={}},

},},
--[[9401~9500위--]]{9401,9500,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4360,LP=0,Items={}},

},},
--[[9501~9600위--]]{9501,9600,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4350,LP=0,Items={}},

},},
--[[9601~9700위--]]{9601,9700,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4340,LP=0,Items={}},

},},
--[[9701~9800위--]]{9701,9800,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4330,LP=0,Items={}},

},},
--[[9801~9900위--]]{9801,9900,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4320,LP=0,Items={}},

},},
--[[9901~10000위--]]{9901,10000,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4310,LP=0,Items={}},

},},
--[[10001~10200위--]]{10001,10200,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4305,LP=0,Items={}},

},},
--[[10201~10400위--]]{10201,10400,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4300,LP=0,Items={}},

},},
--[[10401~10600위--]]{10401,10600,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4295,LP=0,Items={}},

},},
--[[10601~10800위--]]{10601,10800,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4290,LP=0,Items={}},

},},
--[[10801~11000위--]]{10801,11000,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4285,LP=0,Items={}},

},},
--[[11001~11200위--]]{11001,11200,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4280,LP=0,Items={}},

},},
--[[11201~11400위--]]{11201,11400,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4275,LP=0,Items={}},

},},
--[[11401~11600위--]]{11401,11600,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4270,LP=0,Items={}},

},},
--[[11601~11800위--]]{11601,11800,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4265,LP=0,Items={}},

},},
--[[11801~12000위--]]{11801,12000,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4260,LP=0,Items={}},

},},
--[[12001~12200위--]]{12001,12200,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4255,LP=0,Items={}},

},},
--[[12201~12400위--]]{12201,12400,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4250,LP=0,Items={}},

},},
--[[12401~12600위--]]{12401,12600,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4245,LP=0,Items={}},

},},
--[[12601~12800위--]]{12601,12800,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4240,LP=0,Items={}},

},},
--[[12801~13000위--]]{12801,13000,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4235,LP=0,Items={}},

},},
--[[13001~13200위--]]{13001,13200,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4230,LP=0,Items={}},

},},
--[[13201~13400위--]]{13201,13400,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4225,LP=0,Items={}},

},},
--[[13401~13600위--]]{13401,13600,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4220,LP=0,Items={}},

},},
--[[13601~13800위--]]{13601,13800,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4215,LP=0,Items={}},

},},
--[[13801~14000위--]]{13801,14000,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4210,LP=0,Items={}},

},},
--[[14001~14200위--]]{14001,14200,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4205,LP=0,Items={}},

},},
--[[14201~14400위--]]{14201,14400,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4200,LP=0,Items={}},

},},
--[[14401~14600위--]]{14401,14600,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4195,LP=0,Items={}},

},},
--[[14601~14800위--]]{14601,14800,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4190,LP=0,Items={}},

},},
--[[14801~15000위--]]{14801,15000,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4185,LP=0,Items={}},

},},
--[[15001~15200위--]]{15001,15200,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4180,LP=0,Items={}},

},},
--[[15201~15400위--]]{15201,15400,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4175,LP=0,Items={}},

},},
--[[15401~15600위--]]{15401,15600,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4170,LP=0,Items={}},

},},
--[[15601~15800위--]]{15601,15800,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4165,LP=0,Items={}},

},},
--[[15801~16000위--]]{15801,16000,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4160,LP=0,Items={}},

},},
--[[16001~16200위--]]{16001,16200,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4155,LP=0,Items={}},

},},
--[[16201~16400위--]]{16201,16400,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4150,LP=0,Items={}},

},},
--[[16401~16600위--]]{16401,16600,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4145,LP=0,Items={}},

},},
--[[16601~16800위--]]{16601,16800,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4140,LP=0,Items={}},

},},
--[[16801~17000위--]]{16801,17000,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4135,LP=0,Items={}},

},},
--[[17001~17200위--]]{17001,17200,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4130,LP=0,Items={}},

},},
--[[17201~17400위--]]{17201,17400,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4125,LP=0,Items={}},

},},
--[[17401~17600위--]]{17401,17600,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4120,LP=0,Items={}},

},},
--[[17601~17800위--]]{17601,17800,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4115,LP=0,Items={}},

},},
--[[17801~18000위--]]{17801,18000,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4110,LP=0,Items={}},

},},
--[[18001~18200위--]]{18001,18200,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4105,LP=0,Items={}},

},},
--[[18201~18400위--]]{18201,18400,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4100,LP=0,Items={}},

},},
--[[18401~18600위--]]{18401,18600,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4095,LP=0,Items={}},

},},
--[[18601~18800위--]]{18601,18800,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4090,LP=0,Items={}},

},},
--[[18801~19000위--]]{18801,19000,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4085,LP=0,Items={}},

},},
--[[19001~19200위--]]{19001,19200,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4080,LP=0,Items={}},

},},
--[[19201~19400위--]]{19201,19400,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4075,LP=0,Items={}},

},},
--[[19401~19600위--]]{19401,19600,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4070,LP=0,Items={}},

},},
--[[19601~19800위--]]{19601,19800,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4065,LP=0,Items={}},

},},
--[[19801~20000위--]]{19801,20000,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4060,LP=0,Items={}},

},},
--[[20001~20500위--]]{20001,20500,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4055,LP=0,Items={}},

},},
--[[20501~21000위--]]{20501,21000,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4050,LP=0,Items={}},

},},
--[[21001~21500위--]]{21001,21500,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4045,LP=0,Items={}},

},},
--[[21501~22000위--]]{21501,22000,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4040,LP=0,Items={}},

},},
--[[22001~22500위--]]{22001,22500,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4035,LP=0,Items={}},

},},
--[[22501~23000위--]]{22501,23000,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4030,LP=0,Items={}},

},},
--[[23001~23500위--]]{23001,23500,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4025,LP=0,Items={}},

},},
--[[23501~24000위--]]{23501,24000,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4020,LP=0,Items={}},

},},
--[[24001~24500위--]]{24001,24500,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4015,LP=0,Items={}},

},},
--[[24501~25000위--]]{24501,25000,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4010,LP=0,Items={}},

},},
--[[25001~25500위--]]{25001,25500,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4005,LP=0,Items={}},

},},
--[[25501~26000위--]]{25501,26000,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=4000,LP=0,Items={}},

},},
--[[26001~26500위--]]{26001,26500,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=3995,LP=0,Items={}},

},},
--[[26501~27000위--]]{26501,27000,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=3990,LP=0,Items={}},

},},
--[[27001~27500위--]]{27001,27500,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=3985,LP=0,Items={}},

},},
--[[27501~28000위--]]{27501,28000,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=3980,LP=0,Items={}},

},},
--[[28001~28500위--]]{28001,28500,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=3975,LP=0,Items={}},

},},
--[[28501~29000위--]]{28501,29000,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=3970,LP=0,Items={}},

},},
--[[29001~29500위--]]{29001,29500,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=3965,LP=0,Items={}},

},},
--[[29501~30000위--]]{29501,30000,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=3960,LP=0,Items={}},

},},
--[[30001~30500위--]]{30001,30500,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=3955,LP=0,Items={}},

},},
--[[30501~31000위--]]{30501,31000,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=3950,LP=0,Items={}},

},},
--[[31001~31500위--]]{31001,31500,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=3945,LP=0,Items={}},

},},
--[[31501~32000위--]]{31501,32000,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=3940,LP=0,Items={}},

},},
--[[32001~32500위--]]{32001,32500,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=3935,LP=0,Items={}},

},},
--[[32501~33000위--]]{32501,33000,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=3930,LP=0,Items={}},

},},
--[[33001~33500위--]]{33001,33500,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=3925,LP=0,Items={}},

},},
--[[33501~34000위--]]{33501,34000,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=3920,LP=0,Items={}},

},},
--[[34001~34500위--]]{34001,34500,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=3915,LP=0,Items={}},

},},
--[[34501~35000위--]]{34501,35000,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=3910,LP=0,Items={}},

},},
--[[35001~35500위--]]{35001,35500,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=3905,LP=0,Items={}},

},},
--[[35501~36000위--]]{35501,36000,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=3900,LP=0,Items={}},

},},
--[[36001~36500위--]]{36001,36500,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=3895,LP=0,Items={}},

},},
--[[36501~37000위--]]{36501,37000,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=3890,LP=0,Items={}},

},},
--[[37001~37500위--]]{37001,37500,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=3885,LP=0,Items={}},

},},
--[[37501~38000위--]]{37501,38000,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=3880,LP=0,Items={}},

},},
--[[38001~38500위--]]{38001,38500,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=3875,LP=0,Items={}},

},},
--[[38501~39000위--]]{38501,39000,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=3870,LP=0,Items={}},

},},
--[[39001~39500위--]]{39001,39500,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=3865,LP=0,Items={}},

},},
--[[39501~40000위--]]{39501,40000,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=3860,LP=0,Items={}},

},},
--[[40001~40500위--]]{40001,40500,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=3855,LP=0,Items={}},

},},
--[[40501~41000위--]]{40501,41000,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=3850,LP=0,Items={}},

},},
--[[41001~41500위--]]{41001,41500,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=3845,LP=0,Items={}},

},},
--[[41501~42000위--]]{41501,42000,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=3840,LP=0,Items={}},

},},
--[[42001~42500위--]]{42001,42500,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=3835,LP=0,Items={}},

},},
--[[42501~43000위--]]{42501,43000,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=3830,LP=0,Items={}},

},},
--[[43001~43500위--]]{43001,43500,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=3825,LP=0,Items={}},

},},
--[[43501~44000위--]]{43501,44000,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=3820,LP=0,Items={}},

},},
--[[44001~44500위--]]{44001,44500,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=3815,LP=0,Items={}},

},},
--[[44501~45000위--]]{44501,45000,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=3810,LP=0,Items={}},

},},
--[[45001~45500위--]]{45001,45500,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=3805,LP=0,Items={}},

},},
--[[45501~46000위--]]{45501,46000,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=3800,LP=0,Items={}},

},},
--[[46001~46500위--]]{46001,46500,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=3795,LP=0,Items={}},

},},
--[[46501~47000위--]]{46501,47000,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=3790,LP=0,Items={}},

},},
--[[47001~47500위--]]{47001,47500,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=3785,LP=0,Items={}},

},},
--[[47501~48000위--]]{47501,48000,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=3780,LP=0,Items={}},

},},
--[[48001~48500위--]]{48001,48500,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=3775,LP=0,Items={}},

},},
--[[48501~49000위--]]{48501,49000,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=3770,LP=0,Items={}},

},},
--[[49001~49500위--]]{49001,49500,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=3765,LP=0,Items={}},

},},
--[[49501~50000위--]]{49501,50000,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=3760,LP=0,Items={}},

},},
--[[50001~100000위--]]{50001,100000,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=3500,LP=0,Items={}},

},},
--[[100001~200000위--]]{100001,200000,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=3200,LP=0,Items={}},

},},
--[[200001~500000위--]]{200001,500000,
  byLvl = {
{MinLvl =1,MaxLvl=40, Recon=3000,LP=0,Items={}},

},},



}

function ScoreBoardInit()
	local idx2, reward
	for idx2, reward in pairs(ScoreBoardDailyReward) do
		ScoreBoardMgr:InsertDailyReward(reward[1], reward[2])
		
		local idx3, valLvl
		for idx3, valLvl in pairs(reward.byLvl) do
			ScoreBoardMgr:InsertDailyRewardByLvl(reward[1], reward[2], valLvl.MinLvl, valLvl.MaxLvl, valLvl.Recon, valLvl.LP)
			
			local idx4, item
			for idx4, item in pairs(valLvl.Items) do
				ScoreBoardMgr:InsertDailyRewardItem(reward[1], reward[2], valLvl.MinLvl, valLvl.MaxLvl, item[1], item[2])
			end
		end
	end
end