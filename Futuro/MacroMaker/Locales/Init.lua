--------------------------------------------------------------------------------
-- Macro Maker - Locale Initialization
-- Version: 1.2
-- Author: Satyros
--
-- Description:
--   Initializes the Localization table (L).
--   Sets up a metatable to handle missing keys by returning the key itself.
--------------------------------------------------------------------------------

local AddOnName, MM = ...

MM.L = MM.L or setmetatable({}, {
    __index = function(t, k)
        -- Fallback to key if translation missing
        return k
    end
})
