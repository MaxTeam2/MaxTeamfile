local function ChangeUser(msg)
local text = msg.content_.text_
if ChatType == 'sp' or ChatType == 'gp'  then
if text then 
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,result)
if result.id_ then 
local abbs = DevHaider:get("MaxTeamTEAM:User"..result.id_)
if not result.username_ then 
if abbs then 
Dev_Haider(msg.chat_id_, msg.id_, 1, "حذف معرفه خمطو بسرعه، 😹💔 \nهذا معرفه @"..abbs.."", 1, 'html')
DevHaider:del("MaxTeamTEAM:User"..result.id_) 
end
end
if result.username_ then 
if abbs and abbs ~= result.username_ then 
local Haider_text = {
'معرفك الجديد عشره بربع محد ياخذه😹💔',
"هاها غيرت معرفك نشروك بقناة فضايح😹💔💭",
"معرفك الجديد حلو منين خامطه؟!🤤♥️",
"معرفك القديم @"..result.username_.." ضمه بقناة لاينبعص، 😹♥️",
}
abbss = math.random(#Haider_text)
Dev_Haider(msg.chat_id_, msg.id_, 1, Haider_text[abbss], 1, 'html')
end  
DevHaider:set("MaxTeamTEAM:User"..result.id_, result.username_) 
end
end
end,nil) 
end
end

end
return {
MaxTeam = ChangeUser
}