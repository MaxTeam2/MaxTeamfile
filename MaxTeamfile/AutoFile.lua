local function AutoFile(msg)
local text = msg.content_.text_
if Sudo(msg) then
if text == 'تفعيل النسخه التلقائيه' or text == 'تفعيل جلب نسخه الكروبات' or text == 'تفعيل عمل نسخه للمجموعات' then   
Dev_Haider(msg.chat_id_,msg.id_, 1, "⌁︙تم تفعيل جلب نسخة الكروبات التلقائيه\n⌁︙سيتم ارسال نسخه تلقائيه للكروبات كل يوم الى خاص المطور الاساسي", 1, 'md')
DevHaider:del(MaxTeam.."Haider:Lock:AutoFile")
end
if text == 'تعطيل النسخه التلقائيه' or text == 'تعطيل جلب نسخه الكروبات' or text == 'تعطيل عمل نسخه للمجموعات' then  
Dev_Haider(msg.chat_id_,msg.id_, 1, "⌁︙تم تعطيل جلب نسخة الكروبات التلقائيه", 1, 'md')
DevHaider:set(MaxTeam.."Haider:Lock:AutoFile",true) 
end 
end

if (text and not DevHaider:get(MaxTeam.."Haider:Lock:AutoFile")) then
Time = DevHaider:get(MaxTeam.."Haider:AutoFile:Time")
if Time then 
if Time ~= os.date("%x") then 
local list = DevHaider:smembers(MaxTeam..'Haider:Groups') 
local BotName = (DevHaider:get(MaxTeam.."Haider:NameBot") or 'لاريكا')
local GetJson = '{"BotId": '..MaxTeam..',"BotName": "'..BotName..'","GroupsList":{'  
for k,v in pairs(list) do 
LinkGroups = DevHaider:get(MaxTeam.."Haider:Groups:Links"..v)
Welcomes = DevHaider:get(MaxTeam..'Haider:Groups:Welcomes'..v) or ''
HaiderConstructors = DevHaider:smembers(MaxTeam..'Haider:HaiderConstructor:'..v)
BasicConstructors = DevHaider:smembers(MaxTeam..'Haider:BasicConstructor:'..v)
Constructors = DevHaider:smembers(MaxTeam..'Haider:Constructor:'..v)
Managers = DevHaider:smembers(MaxTeam..'Haider:Managers:'..v)
Admis = DevHaider:smembers(MaxTeam..'Haider:Admins:'..v)
Vips = DevHaider:smembers(MaxTeam..'Haider:VipMem:'..v)
if k == 1 then
GetJson = GetJson..'"'..v..'":{'
else
GetJson = GetJson..',"'..v..'":{'
end
if #Vips ~= 0 then 
GetJson = GetJson..'"Vips":['
for k,v in pairs(Vips) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Admis ~= 0 then
GetJson = GetJson..'"Admis":['
for k,v in pairs(Admis) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Managers ~= 0 then
GetJson = GetJson..'"Managers":['
for k,v in pairs(Managers) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Constructors ~= 0 then
GetJson = GetJson..'"Constructors":['
for k,v in pairs(Constructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #BasicConstructors ~= 0 then
GetJson = GetJson..'"BasicConstructors":['
for k,v in pairs(BasicConstructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #HaiderConstructors ~= 0 then
GetJson = GetJson..'"HaiderConstructors":['
for k,v in pairs(HaiderConstructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if LinkGroups then
GetJson = GetJson..'"LinkGroups":"'..LinkGroups..'",'
end
GetJson = GetJson..'"Welcomes":"'..Welcomes..'"}'
end
GetJson = GetJson..'}}'
local File = io.open('./'..MaxTeam..'.json', "w")
File:write(GetJson)
File:close()
local abbas = 'https://api.telegram.org/bot' .. TokenBot .. '/sendDocument'
local curl = 'curl "' .. abbas .. '" -F "chat_id='..DevId..'" -F "document=@'..MaxTeam..'.json' .. '" -F "caption=⌁︙يحتوي الملف على ↫ '..#list..' مجموعه"'
io.popen(curl)
io.popen('fm -fr '..MaxTeam..'.json')
DevHaider:set(MaxTeam.."Haider:AutoFile:Time",os.date("%x"))
end
else 
DevHaider:set(MaxTeam.."Haider:AutoFile:Time",os.date("%x"))
end
end

end
return {
MaxTeam = AutoFile
}