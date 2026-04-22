--!strict

-- This is the entry point for loadstring.
-- It will load the actual 3ex5 library from ReplicatedStorage.

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local _3ex5_Library = ReplicatedStorage:WaitForChild("3ex5")

local _3ex5 = require(_3ex5_Library.main)

return _3ex5
