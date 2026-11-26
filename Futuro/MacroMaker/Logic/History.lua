--------------------------------------------------------------------------------
-- Macro Maker - History Module (Undo/Redo)
-- Version: 2.0
-- Author: Satyros
--
-- Description:
--   Provides undo/redo functionality for the Builder.
--   Stores snapshots of builder state (output text) in a stack.
--------------------------------------------------------------------------------

local AddOnName, MM = ...
local L = MM.L

MM.History = {
    stack = {},
    pointer = 0,
    maxSize = 50,
    ignoreNext = false,
}

--- Pushes the current builder state onto the history stack.
function MM.History:Push()
    if self.ignoreNext then
        self.ignoreNext = false
        return
    end
    
    local text = ""
    if MM.outputBox then text = MM.outputBox:GetText() or "" end
    
    local name = ""
    if MM.nameInput then name = MM.nameInput:GetText() or "" end
    
    -- Don't push if same as current state
    if self.pointer > 0 and self.stack[self.pointer] then
        local current = self.stack[self.pointer]
        if current.text == text and current.name == name then return end
    end
    
    -- Trim future states if we're not at the end
    while #self.stack > self.pointer do
        table.remove(self.stack)
    end
    
    -- Push new state
    table.insert(self.stack, {
        text = text,
        name = name,
    })
    self.pointer = #self.stack
    
    -- Enforce max size
    while #self.stack > self.maxSize do
        table.remove(self.stack, 1)
        self.pointer = self.pointer - 1
    end
end

--- Restores the previous state (Undo).
function MM.History:Undo()
    if self.pointer <= 1 then
        if MM.Notify then MM:Notify(L["Nothing to undo"], "info") end
        return
    end
    
    self.pointer = self.pointer - 1
    self:Restore()
end

--- Restores the next state (Redo).
function MM.History:Redo()
    if self.pointer >= #self.stack then
        if MM.Notify then MM:Notify(L["Nothing to redo"], "info") end
        return
    end
    
    self.pointer = self.pointer + 1
    self:Restore()
end

--- Applies the state at the current pointer.
function MM.History:Restore()
    local state = self.stack[self.pointer]
    if not state then return end
    
    self.ignoreNext = true -- Prevent recursive push
    
    if MM.outputBox then
        MM.outputBox:SetText(state.text)
    end
    if MM.nameInput then
        MM.nameInput:SetText(state.name)
    end
end

--- Clears the history stack.
function MM.History:Clear()
    wipe(self.stack)
    self.pointer = 0
end
