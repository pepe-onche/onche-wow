local version = "0.1"

local loginFrame = CreateFrame("Frame")
loginFrame:RegisterEvent("PLAYER_LOGIN")

local function loginHandler(self, event, ...)
    print("|cFFFFFF00Onche Addon V" .. version)
end

loginFrame:SetScript("OnEvent", loginHandler)

local stickers = {
    ["ahitison"] = true,
    ["Allo_c_est_zizou"] = true,
    ["anus"] = true,
    ["Avocat"] = true,
    ["aya_clones"] = true,
    ["bouais"] = true,
    ["bras"] = true,
    ["cafe"] = true,
    ["cash_wonki"] = true,
    ["Chabonnet"] = true,
    ["chakoi"] = true,
    ["chat_capri_sun"] = true,
    ["chatflingue"] = true,
    ["chatire"] = true,
    ["chat_lunettes"] = true,
    ["Chat_marrant_"] = true,
    ["chat_perplexe"] = true,
    ["chatserpent"] = true,
    ["chat_sourire_flingue"] = true,
    ["chat_zoom"] = true,
    ["Cohen_ahi"] = true,
    ["couilles_panoramix"] = true,
    ["crier"] = true,
    ["Crie"] = true,
    ["deg"] = true,
    ["Descolin_ahi"] = true,
    ["deuxbaffes"] = true,
    ["elcon"] = true,
    ["fatigue_sourire"] = true,
    ["Gros-Golem"] = true,
    ["Hitlerlove"] = true,
    ["hollande"] = true,
    ["h"] = true,
    ["Immondice"] = true,
    ["interloque"] = true,
    ["jerry"] = true,
    ["jesus_moqueur"] = true,
    ["jesus_perplexe"] = true,
    ["jesus_pipe"] = true,
    ["jesus"] = true,
    ["jesus_zoom"] = true,
    ["joint"] = true,
    ["journal"] = true,
    ["kangourisi"] = true,
    ["larry1"] = true,
    ["Larry"] = true,
    ["larry_well"] = true,
    ["macron-ecoute"] = true,
    ["morsay"] = true,
    ["Mouais_Jesus"] = true,
    ["narines"] = true,
    ["nez"] = true,
    ["notready2"] = true,
    ["onch"] = true,
    ["Oopsi"] = true,
    ["ouat"] = true,
    ["pepe_corde"] = true,
    ["perplexe"] = true,
    ["pizzacat"] = true,
    ["Poker_face"] = true,
    ["Popcorn"] = true,
    ["pote_de_ADlaurent"] = true,
    ["Rayman"] = true,
    ["risi8"] = true,
    ["risibo"] = true,
    ["risi_chauve"] = true,
    ["risicul"] = true,
    ["risi_jzoom"] = true,
    ["Risisinge"] = true,
    ["risitas_ahi"] = true,
    ["risitas_gonfle"] = true,
    ["risitas"] = true,
    ["Risitas_wtf"] = true,
    ["risitriste"] = true,
    ["risi_zoom"] = true,
    ["ronaldo_oreiller"] = true,
    ["ruquier_pet_foireux"] = true,
    ["selection_naturelle"] = true,
    ["sele"] = true,
    ["sueur"] = true,
    ["tarer"] = true,
    ["wsh"] = true,
    ["zahi"] = true,
    ["zhitler"] = true,
    ["zidahi"] = true,
    ["zidane_tasse"] = true,
    ["Zizou_"] = true,
}

local stickerNames = {}
for k in pairs(stickers) do table.insert(stickerNames, k) end
table.sort(stickerNames)

local function FilterChatMessage(self, event, message, sender, ...)
    matched = false
    local newMessage = string.gsub(message, ":[%w-_]+:", function(match)
        if not matched and stickers[string.sub(match, 2, -2)] then
            matched = true
            return "|TInterface\\AddOns\\Onche\\Stickers\\"..string.sub(match, 2, -2)..".tga:38|t"
        end
        return match
    end)

    return false, newMessage, sender, ...
end

ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL", FilterChatMessage)
ChatFrame_AddMessageEventFilter("CHAT_MSG_SAY", FilterChatMessage)
ChatFrame_AddMessageEventFilter("CHAT_MSG_PARTY", FilterChatMessage)
ChatFrame_AddMessageEventFilter("CHAT_MSG_GUILD", FilterChatMessage)
ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER", FilterChatMessage)
ChatFrame_AddMessageEventFilter("CHAT_MSG_YELL", FilterChatMessage)
ChatFrame_AddMessageEventFilter("CHAT_MSG_INSTANCE_CHAT", FilterChatMessage)

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

SLASH_STICKERS1 = "/stickers"
SlashCmdList["STICKERS"] = ToggleStickersFrame
