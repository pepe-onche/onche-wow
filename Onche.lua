local version = "0.2"
local CHAT_STICKER_SIZE = 38
local BUBBLE_STICKER_SIZE = 32

local loginFrame = CreateFrame("Frame")
loginFrame:RegisterEvent("PLAYER_LOGIN")

local function loginHandler(self, event, ...)
    print("|cFFFFFF00Onche Addon V" .. version)
end

loginFrame:SetScript("OnEvent", loginHandler)

local timeSinceLastUpdate = 0

local stickers = {
    ["AAAAAAAAYAAAAA"] = true,
    ["AD_Laurent_2"] = true,
    ["AD_Laurent"] = true,
    ["Adolfbg"] = true,
    ["ahhh"] = true,
    ["ahitison"] = true,
    ["Ahi_Zoom"] = true,
    ["Allo_c_est_zizou"] = true,
    ["Amourbrise"] = true,
    ["anus"] = true,
    ["Assad"] = true,
    ["att"] = true,
    ["audrey_culotte"] = true,
    ["audrey_parle"] = true,
    ["Avocat"] = true,
    ["aya_clones"] = true,
    ["BabChad"] = true,
    ["Ba_sourire"] = true,
    ["bilal_plug"] = true,
    ["Bontoutou"] = true,
    ["boomer"] = true,
    ["bouais"] = true,
    ["boube"] = true,
    ["bras_multiple"] = true,
    ["bras"] = true,
    ["brise2"] = true,
    ["cafe"] = true,
    ["calin2"] = true,
    ["capuche"] = true,
    ["cash_buvard_"] = true,
    ["cash_deforme"] = true,
    ["cash_mange"] = true,
    ["cash_pique"] = true,
    ["cash_rage"] = true,
    ["cash_wonki"] = true,
    ["cestpizza"] = true,
    ["Chabonnet"] = true,
    ["Chadort"] = true,
    ["chakipleur"] = true,
    ["chakoi"] = true,
    ["Chat_aya"] = true,
    ["Chat_bonnet"] = true,
    ["chatbrushingananas"] = true,
    ["chatbrushinglitchi"] = true,
    ["chatbrushingorange"] = true,
    ["chatbrushingpasteque"] = true,
    ["chatbrushingpitaya"] = true,
    ["chatbrushing"] = true,
    ["chat_capri_sun"] = true,
    ["Chat_cash_"] = true,
    ["Chat_fache_4"] = true,
    ["chat_fdv"] = true,
    ["chatflingue"] = true,
    ["chatire"] = true,
    ["chat_lunettes"] = true,
    ["Chat_marrant_lunette_bleue"] = true,
    ["chat_marrant_rond"] = true,
    ["Chat_marrant_"] = true,
    ["chat_medecin"] = true,
    ["chat_perplexe"] = true,
    ["Chat_piment"] = true,
    ["ChatPresidentRoi"] = true,
    ["ChatRegardMeprisant"] = true,
    ["chatrire"] = true,
    ["chatserpent"] = true,
    ["chat_sourire_flingue"] = true,
    ["Chat_tasse"] = true,
    ["chat_zoom"] = true,
    ["chien_ail"] = true,
    ["Chien_CASH"] = true,
    ["chien_compris"] = true,
    ["chien_meuf"] = true,
    ["chienwtf"] = true,
    ["chieux"] = true,
    ["Choent"] = true,
    ["chouffe"] = true,
    ["clap"] = true,
    ["Cohen_ahi"] = true,
    ["combat_"] = true,
    ["couilles_panoramix"] = true,
    ["crier"] = true,
    ["Crie"] = true,
    ["Csc1"] = true,
    ["Daenerys_sarcasme"] = true,
    ["Danyzoom1"] = true,
    ["deg"] = true,
    ["dentsaudrey"] = true,
    ["Descolin_ahi"] = true,
    ["deuxbaffes"] = true,
    ["dickhead"] = true,
    ["Didier_Bourdon_Chien"] = true,
    ["dog_sad"] = true,
    ["donald-pervers"] = true,
    ["elcon"] = true,
    ["elton-john"] = true,
    ["Explication"] = true,
    ["face_risitas"] = true,
    ["fatigue_manon_aubry"] = true,
    ["fatigue_sourire"] = true,
    ["fatigue_triangle"] = true,
    ["fessee"] = true,
    ["gange_13"] = true,
    ["glisse"] = true,
    ["Golempelo"] = true,
    ["Gros-Golem"] = true,
    ["Heureux-zoom"] = true,
    ["Hitlerloco"] = true,
    ["Hitlerlove"] = true,
    ["hitler-rire"] = true,
    ["hollande"] = true,
    ["h"] = true,
    ["Immondice"] = true,
    ["inc_miam"] = true,
    ["interloque"] = true,
    ["jean_marire"] = true,
    ["jerry"] = true,
    ["Jesus_fap"] = true,
    ["jesusfemme"] = true,
    ["jesus_issou"] = true,
    ["jesus_moqueur"] = true,
    ["jesus_papy"] = true,
    ["jesus_perplexe"] = true,
    ["jesus_pipe"] = true,
    ["jesus-rire"] = true,
    ["Jesus_singe"] = true,
    ["jesus"] = true,
    ["Jesus_tireur"] = true,
    ["jesus_zoom"] = true,
    ["jgobelin"] = true,
    ["jmarie_boxe_"] = true,
    ["joint"] = true,
    ["journal"] = true,
    ["Juif_regard"] = true,
    ["k2a"] = true,
    ["kangourisi"] = true,
    ["karadoc"] = true,
    ["kermit_kalash"] = true,
    ["larry1"] = true,
    ["Larry"] = true,
    ["larry_well"] = true,
    ["LeChoque"] = true,
    ["loco_nerd"] = true,
    ["Locos2"] = true,
    ["Loco"] = true,
    ["locoz"] = true,
    ["Loup-mange-couille"] = true,
    ["macron-ecoute"] = true,
    ["magalax_"] = true,
    ["magalie2"] = true,
    ["magalie_mange_mickey"] = true,
    ["magalie_ogre_symetrie"] = true,
    ["magalie_piege"] = true,
    ["magalie_soupir"] = true,
    ["magali"] = true,
    ["Marrant_lunettes3"] = true,
    ["mastercuck"] = true,
    ["mechat"] = true,
    ["meuf_deg"] = true,
    ["Meuf_langue"] = true,
    ["mickey_blase"] = true,
    ["Mickey_face"] = true,
    ["mickey_fatigue"] = true,
    ["mickey_mickey"] = true,
    ["mickey_"] = true,
    ["mickey_triangle"] = true,
    ["MickHOO"] = true,
    ["morsay"] = true,
    ["Mouais_Jesus"] = true,
    ["mr_robot"] = true,
    ["narines"] = true,
    ["nazi_18"] = true,
    ["nez"] = true,
    ["ninja"] = true,
    ["notready2"] = true,
    ["Olivier_Carglass"] = true,
    ["Onche_nazi"] = true,
    ["onch"] = true,
    ["Oopsi"] = true,
    ["OuaisTaRaison"] = true,
    ["ouat"] = true,
    ["PeepoPray"] = true,
    ["pepecentaure"] = true,
    ["pepe_corde"] = true,
    ["pepe"] = true,
    ["perplexe"] = true,
    ["philippot_dechet_1"] = true,
    ["philippot_diagonale"] = true,
    ["philippotm"] = true,
    ["philippot_scouter"] = true,
    ["Philippot"] = true,
    ["pia"] = true,
    ["pizzacat"] = true,
    ["plug_costard"] = true,
    ["Poker_face"] = true,
    ["polygone"] = true,
    ["Popcorn"] = true,
    ["pote_de_ADlaurent"] = true,
    ["quoicoubeh_curly"] = true,
    ["quoicoubeh"] = true,
    ["Rayman"] = true,
    ["rey_chatte"] = true,
    ["rien_compris_2"] = true,
    ["rienconfruittexte"] = true,
    ["rikacran"] = true,
    ["risi8"] = true,
    ["risibo"] = true,
    ["risi_chauve"] = true,
    ["risicolere"] = true,
    ["Risiculs"] = true,
    ["risicul"] = true,
    ["risideux_flingues"] = true,
    ["risidoc"] = true,
    ["risi_flemme"] = true,
    ["risi_jzoom"] = true,
    ["risikick"] = true,
    ["Risinerd"] = true,
    ["Risisinge"] = true,
    ["Risisourire"] = true,
    ["risitas_ahi"] = true,
    ["risitas_gonfle"] = true,
    ["risitas_pensif_zoom"] = true,
    ["risitas_riche"] = true,
    ["risitas"] = true,
    ["risitas_triangle"] = true,
    ["Risitas_wtf"] = true,
    ["risitriste"] = true,
    ["risi_zoom"] = true,
    ["ronaldo_oreiller"] = true,
    ["ruquier_pet_foireux"] = true,
    ["sarkozy"] = true,
    ["selection_naturelle"] = true,
    ["selection"] = true,
    ["sele"] = true,
    ["shill"] = true,
    ["singeah"] = true,
    ["Singe_Noir"] = true,
    ["sodium_bras"] = true,
    ["sodium_cafe"] = true,
    ["sodium_chef"] = true,
    ["sodium_choque"] = true,
    ["sodiume_mhm"] = true,
    ["sodium_espion"] = true,
    ["sodiumFatigue"] = true,
    ["sodium_fier"] = true,
    ["sodium_fuck"] = true,
    ["sodium_livre"] = true,
    ["sodium_maestro"] = true,
    ["sodium_popcorn"] = true,
    ["sodium_prie"] = true,
    ["sodium_slurp"] = true,
    ["sodium_sueur"] = true,
    ["sodium"] = true,
    ["sodium_triste"] = true,
    ["sodium_yugi"] = true,
    ["Soral_observe"] = true,
    ["style"] = true,
    ["sueur"] = true,
    ["tarer"] = true,
    ["tartine"] = true,
    ["tetedecul"] = true,
    ["Tristitude"] = true,
    ["trousse"] = true,
    ["vagifeet"] = true,
    ["valentin_lunettes"] = true,
    ["Vieux_jeune"] = true,
    ["volutes"] = true,
    ["wsh"] = true,
    ["youpi_matin"] = true,
    ["zahi"] = true,
    ["zhitler"] = true,
    ["zidahi"] = true,
    ["zidane_benzemonstre"] = true,
    ["zidane_tasse"] = true,
    ["Zizou_"] = true,
}

local stickerNames = {}
for k in pairs(stickers) do table.insert(stickerNames, k) end
table.sort(stickerNames, function(a, b)
    return string.lower(a) < string.lower(b)
end)

local smileys = {
    [":pacg:"] = "10.tga:16:16:0:0",
    [":noel:"] = "11.tga:16:16:0:0",
    [":o))"] = "12.tga:16:16:0:0",
    [":snif2:"] = "13.tga:16:16:0:0",
    [":-("] = "14.tga:16:16:0:0",
    [":-(("] = "15.tga:16:16:0:0",
    [":mac:"] = "16.tga:16:16:0:0",
    [":gba:"] = "17.tga:16:16:0:0",
    [":hap:"] = "18.tga:16:16:0:0",
    [":nah:"] = "19.tga:16:16:0:0",
    [":)"] = "1.tga:16:16:0:0",
    [":snif:"] = "20.tga:16:16:0:0",
    [":mort:"] = "21.tga:16:16:0:0",
    [":hello:"] = "29.tga:45:45:0:0",
    [":question:"] = "2.tga:26:26:0:0",
    [":ok:"] = "36.tga:24:24:0:0",
    [":rechercher:"] = "38.tga:50:50:0:0",
    [":g)"] = "3.tga:16:16:0:0",
    [":-D"] = "40.tga:16:16:0:0",
    [":salut:"] = "42.tga:46:46:0:0",
    [":up:"] = "44.tga:42:42:0:0",
    [":("] = "45.tga:16:16:0:0",
    [":-)"] = "46.tga:16:16:0:0",
    [":peur:"] = "47.tga:16:16:0:0",
    [":bye:"] = "48.tga:44:44:0:0",
    [":dpdr:"] = "49.tga:64:64:0:0",
    [":d)"] = "4.tga:16:16:0:0",
    [":fou:"] = "50.tga:16:16:0:0",
    [":gne:"] = "51.tga:65:65:0:0",
    [":dehors:"] = "52.tga:58:58:0:0",
    [":fier:"] = "53.tga:16:16:0:0",
    [":coeur:"] = "54.tga:21:21:0:0",
    [":rouge:"] = "55.tga:16:16:0:0",
    [":sors:"] = "56.tga:50:50:0:0",
    [":ouch2:"] = "57.tga:16:16:0:0",
    [":merci:"] = "58.tga:44:44:0:0",
    [":svp:"] = "59.tga:50:50:0:0",
    [":cd:"] = "5.tga:16:16:0:0",
    [":ange:"] = "60.tga:31:31:0:0",
    [":diable:"] = "61.tga:35:35:0:0",
    [":gni:"] = "62.tga:27:27:0:0",
    [":spoiler:"] = "63.tga:50:50:0:0",
    [":hs:"] = "64.tga:51:51:0:0",
    [":desole:"] = "65.tga:47:47:0:0",
    [":sournois:"] = "67.tga:16:16:0:0",
    [":hum:"] = "68.tga:16:16:0:0",
    [":globe:"] = "6.tga:16:16:0:0",
    [":pf:"] = "72.tga:16:16:0:0",
    [":ddb:"] = "74.tga:49:49:0:0",
    [":pave:"] = "75.tga:51:51:0:0",
    [":objection:"] = "76.tga:54:54:0:0",
    [":siffle:"] = "77.tga:22:22:0:0",
    [":p)"] = "7.tga:16:16:0:0",
    [":malade:"] = "8.tga:16:16:0:0",
    [":pacd:"] = "9.tga:16:16:0:0",
}

local function escape_lua_pattern(str)
    return string.gsub(str, "([%^%$%(%)%%%.%[%]%*%+%-%?])", "%%%1")
end

local function ProcessText(text, size, multiple)
    matched = false
    with_smileys = text
    for key, value in pairs(smileys) do
        fullvalue = "|TInterface\\AddOns\\Onche\\Smileys\\"..value.."|t"
        with_smileys = string.gsub(with_smileys, escape_lua_pattern(key), fullvalue, 1)
        if string.find(with_smileys, fullvalue, 1, true) then
            if not multiple then
                matched = true
                break
            end
        end
    end

    if not multiple and matched then return with_smileys end

    return string.gsub(with_smileys, ":[%w-_]+:", function(match)
        if not matched and stickers[string.sub(match, 2, -2)] then
            if not multiple then matched = true end
            replacement = "|TInterface\\AddOns\\Onche\\Stickers\\"..string.sub(match, 2, -2)..".tga:"..size..":"..size..":0:0|t"
            return replacement
        end
        return match
    end)
end

local function FilterChatMessage(self, event, message, sender, ...)
    return false, ProcessText(message, CHAT_STICKER_SIZE, false), sender, ...
end

ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL", FilterChatMessage)
ChatFrame_AddMessageEventFilter("CHAT_MSG_SAY", FilterChatMessage)
ChatFrame_AddMessageEventFilter("CHAT_MSG_PARTY", FilterChatMessage)
ChatFrame_AddMessageEventFilter("CHAT_MSG_PARTY_LEADER", FilterChatMessage)
ChatFrame_AddMessageEventFilter("CHAT_MSG_PARTY_GUIDE", FilterChatMessage)
ChatFrame_AddMessageEventFilter("CHAT_MSG_MONSTER_PARTY", FilterChatMessage)
ChatFrame_AddMessageEventFilter("CHAT_MSG_GUILD", FilterChatMessage)
ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER", FilterChatMessage)
ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER_INFORM", FilterChatMessage)
ChatFrame_AddMessageEventFilter("CHAT_MSG_YELL", FilterChatMessage)
ChatFrame_AddMessageEventFilter("CHAT_MSG_INSTANCE_CHAT", FilterChatMessage)
ChatFrame_AddMessageEventFilter("CHAT_MSG_EMOTE", FilterChatMessage)
ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID", FilterChatMessage)
ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID_LEADER", FilterChatMessage)
ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID_WARNING", FilterChatMessage)
ChatFrame_AddMessageEventFilter("CHAT_MSG_BATTLEGROUND", FilterChatMessage)
ChatFrame_AddMessageEventFilter("CHAT_MSG_BATTLEGROUND_LEADER", FilterChatMessage)
ChatFrame_AddMessageEventFilter("CHAT_MSG_OFFICER", FilterChatMessage)
ChatFrame_AddMessageEventFilter("CHAT_MSG_AFK", FilterChatMessage)
ChatFrame_AddMessageEventFilter("CHAT_MSG_SKILL", FilterChatMessage)
ChatFrame_AddMessageEventFilter("CHAT_MSG_LOOT", FilterChatMessage)
ChatFrame_AddMessageEventFilter("CHAT_MSG_MONEY", FilterChatMessage)
ChatFrame_AddMessageEventFilter("CHAT_MSG_BN_WHISPER", FilterChatMessage)
ChatFrame_AddMessageEventFilter("CHAT_MSG_BN_WHISPER_INFORM", FilterChatMessage)
ChatFrame_AddMessageEventFilter("CHAT_MSG_SYSTEM", FilterChatMessage)

local function ToggleStickersFrame()
    if StickersFrame:IsVisible() then
        StickersFrame:Hide()
    else
        StickersFrame:Show()
    end
end

local function AppendTextToChatInput(text)
    local chatEditBox = ChatEdit_GetActiveWindow()

    if not chatEditBox then
        ChatFrame_OpenChat(text, DEFAULT_CHAT_FRAME)
        chatEditBox = ChatEdit_GetActiveWindow()
    else
        local currentText = chatEditBox:GetText()
        chatEditBox:SetText(currentText .. text)
        chatEditBox:SetCursorPosition(chatEditBox:GetNumLetters())
    end
end

function StickersFrame_OnLoad(self)
    StickersFrame:SetMovable(true)
    StickersFrame:EnableMouse(true)
    StickersFrame:RegisterForDrag("LeftButton")
    StickersFrame:SetScript("OnDragStart", function(self, button)
	    self:StartMoving()
    end)
    StickersFrame:SetScript("OnDragStop", function(self)
	    self:StopMovingOrSizing()
    end)

    local buttons = {}
    local buttonSize = 52
    local padding = 6
    for i, k in ipairs(stickerNames) do
        col = (i-1) % 5
        row = math.floor((i-1) / 5)

        local button = CreateFrame("Button", "MyAddonButton" .. i, StickersFrameScrollChildFrame, "UIPanelButtonTemplate")
        button:SetSize(buttonSize, buttonSize)
        button:SetPoint("TOPLEFT", col * (buttonSize + padding) + padding, -row * (buttonSize + padding) - padding)

        button:SetScript("OnEnter", function(self)
            GameTooltip:SetOwner(self, "ANCHOR_TOP")
            GameTooltip:AddLine(":"..k..":", 1, 1, 1)
            GameTooltip:Show()
        end)

        button:SetScript("OnLeave", function(self)
            GameTooltip:Hide()
        end)

        local normalTexture = button:CreateTexture(nil, "BACKGROUND")
        normalTexture:SetAllPoints(button)
        normalTexture:SetTexture("Interface\\AddOns\\Onche\\Stickers\\"..k..".tga")

        local pushedTexture = button:CreateTexture(nil, "BACKGROUND")
        pushedTexture:SetAllPoints(button)
        pushedTexture:SetTexture("Interface\\AddOns\\Onche\\Stickers\\"..k..".tga")
        pushedTexture:SetTexCoord(0, 1, 0, 1)

        local disabledTexture = button:CreateTexture(nil, "BACKGROUND")
        disabledTexture:SetAllPoints(button)
        disabledTexture:SetTexture("Interface\\AddOns\\Onche\\Stickers\\"..k..".tga")
        disabledTexture:SetTexCoord(0, 1, 0, 1)

        local highlightTexture = button:CreateTexture(nil, "BACKGROUND")
        highlightTexture:SetAllPoints(button)
        highlightTexture:SetTexture("Interface\\AddOns\\Onche\\Stickers\\"..k..".tga")
        highlightTexture:SetTexCoord(0, 1, 0, 1)
        highlightTexture:SetAlpha(0.5)

        button:SetNormalTexture(normalTexture)
        button:SetPushedTexture(pushedTexture)
        button:SetDisabledTexture(disabledTexture)
        button:SetHighlightTexture(highlightTexture)

        button:SetScript("OnClick", function(self)
            AppendTextToChatInput(":"..k..":")
        end)

        table.insert(buttons, button)
    end
end

local function UpdateChatBubble(frame, fontstring)
    if not frame:IsShown() then 
        -- Clear last text so that if the same text is spoken again the bubble
        -- will be reprocessed
        fontstring.lastText = nil
        return 
    end

    local text = fontstring:GetText() or ""
    fontstring:SetText(ProcessText(text, BUBBLE_STICKER_SIZE, true))    
    fontstring.lastText = text
    fontstring:SetWidth(fontstring:GetStringWidth())

end

local function IterateChatBubbles(funcToCall)
    for i=1,WorldFrame:GetNumChildren() do
        local v = select(i, WorldFrame:GetChildren())
        local b = v:GetBackdrop()
        if b and b.bgFile == "Interface\\Tooltips\\ChatBubble-Background" then
            for i=1,v:GetNumRegions() do
                local frame = v
                local v = select(i, v:GetRegions())
                if v:GetObjectType() == "FontString" then
                    local fontstring = v
                    if type(funcToCall) == "function" then
                        funcToCall(frame, fontstring)
                    end
                end
            end
        end
    end
end


local loopframe = CreateFrame("Frame")
loopframe:SetScript("OnUpdate", function(self, elapsed)
    timeSinceLastUpdate = timeSinceLastUpdate + elapsed

    -- Check if 1 second has passed
    if timeSinceLastUpdate >= 0.1 then
        IterateChatBubbles(UpdateChatBubble)  -- Call your function
        timeSinceLastUpdate = 0  -- Reset the timer
    end
end)

SLASH_STICKERS1 = "/stickers"
SlashCmdList["STICKERS"] = ToggleStickersFrame
