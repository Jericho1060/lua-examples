-- ################################################################################
-- #                  Copyright 2014-2022 Novaquark SAS                           #
-- ################################################################################

-----------------------------------------------------------------------------------
-- Receiver
--
-- Receives messages on the element's channels
-----------------------------------------------------------------------------------

require("element")

--- Receives messages on the element's channels
---@class Receiver
receiver = {}
receiver.__index = receiver
function Receiver()
    local self = Element()

    --- Emitted when a message is received on any channel defined on the element
    ---@param channel string The channel; can be used as a filter
    ---@param message string The message received
    self.onReceived = Event:new()
    self.receive = Event:new()
    self.receive:addAction(function(self,channel,message) error("Receiver.receive(channel,message) event is deprecated, use Receiver.onReceived(channel,message) instead.") end, true, 1)

    --- Returns the receiver range
    ---@return number value The range in metres
    function self.getRange() end
    
    --- Checks if the given channel exists in the receiver channels list
    ---@param channel string The channels list as Lua table
    ---@return boolean value True if the channels list contains the given channel, false otherwise
    function self.hasChannel(channel) end

    --- Set the channels list
    ---@param channels table The channels list as Lua table
    ---@return boolean success True if the channels list has been successfully set, false otherwise
    function self.setChannelList(channels) end
    ---@deprecated Receiver.setChannels(channels) is deprecated, use Receiver.setChannelList(channels) instead.
    function self.setChannels(channels) error("Receiver.setChannels(channels) is deprecated, use Receiver.setChannelList(channels) instead.") end

    ---Returns the channels list
    ---@return table channels The channels list as Lua table
    function self.getChannelList() end
    ---@deprecated Receiver.getChannels() is deprecated, use Receiver.getChannelList() instead.
    function self.getChannels(channels) error("Receiver.getChannels() is deprecated, use Receiver.getChannelList() instead.") end

    return setmetatable(self, receiver)
end