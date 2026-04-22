--!strict
-- This script is intended to be placed in a client context (e.g. StarterPlayerScripts)
-- It will initialize and show the UI.

local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Wait for the library to be replicated
local _3ex5_Library = ReplicatedStorage:WaitForChild("3ex5")

-- Require the main library module
local _3ex5 = require(_3ex5_Library.src.main)

-- Initialize the library to create the UI
_3ex5.init()
